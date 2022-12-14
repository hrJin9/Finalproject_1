package com.spring.yeeun.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.finalproject.common.FileManager;
import com.spring.finalproject.common.MyUtil;
import com.spring.yeeun.model.NoticeBoardVO;
import com.spring.yeeun.service.InterBoardService;

@Controller
public class BoardController {
	
	@Autowired
	private InterBoardService service;
	
	@Autowired
	private FileManager fileManager;
	
	
	@RequestMapping(value = "/board/view.up")
	public String view(HttpServletRequest request) {
		return "board/view.tiles";
	}
	
	/*
	@RequestMapping(value = "/board/add.up")
	public String add(HttpServletRequest request) {
		return "board/add.tiles";
	}	*/
	
	
	// 게시판 목록 및 글쓰기 폼페이지 요청
	@RequestMapping(value = "/board_all.up")
	public ModelAndView rl_board_all(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) { 
		//getCurrentURL(request);  // 로그아웃을 했을 때 현재 보이던 그 페이지 그대로 돌아가기 위한 메소드 호출 (단, 로그인을 해야지만 볼 수 있는 페이지에는 사용하면 안된다. AOP 와 getCurrentURL(request); 코드가 꼬이게 된다.)
	      
		List<NoticeBoardVO> boardList = null;    // 초기값으로 글이 하나도 없을 수 있음
	      
		//////////////////////////////////////////////////////
		// 글조회수(readCount)증가 (DML문 update)는
		// 반드시 목록보기에 와서 해당 글제목을 클릭했을 경우에만 증가되고,
		// 웹브라우저에서 새로고침(F5)을 했을 경우에는 증가가 되지 않도록 해야 한다.
		// 이것을 하기 위해서는 session 을 사용하여 처리하면 된다.
		HttpSession session = request.getSession();
		session.setAttribute("readCountPermission", "yes");
		// session 에  "readCountPermission" 키값으로 저장된 value값은 "yes" 이다.
		// session 에  "readCountPermission" 키값에 해당하는 value값 "yes"를 얻으려면 
		// 반드시 웹브라우저에서 주소창에 /list.action 페이지에서 요청해야지만 value값 "yes"를 얻어올 수 있다.
		///////////////////////////////////////////////////////
		
		// ** 페이징 처리를 안한 검색어가 없는 전체 글목록 보여주기 ** //
		String searchCondition = request.getParameter("searchCondition");
		String searchVal = request.getParameter("searchVal");
		
		if(searchCondition == null) {
			searchCondition = "";
		}
		
		if(searchVal == null) { 
			searchVal = "";      // null 대신 검색어에 "" 로 들어온다.
		}
		if(searchVal != null) {  // 검색어가 공백일 경우
			searchVal = searchVal.trim(); // 공백을 제거하면 검색어에  "" 로 들어온다.
		}
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchCondition", searchCondition);
		paraMap.put("searchVal", searchVal);
		
		boardList = service.boardListSearch(paraMap);  // paraMap 이 없다면 전체 글목록이 다 조회되고, paraMap 이 있다면  검색 조건절에 해당하는 글목록만 조회된다.
		
		// 검색대상 컬럼과 검색어를 뷰단 페이지에서 유지시키기 위한 것임.
		if( !"".equals(searchCondition) && !"".equals(searchVal) ) {
		mav.addObject("paraMap", paraMap);  // paraMap 에 저장한 data 를  request 영역에 넣어두고 있는 것
		}
		
		//boardList = service.boardListNoSearch(); // 페이징 처리를 안한 검색어가 없는 전체 글목록 보여주기
	    mav.addObject("boardList", boardList);   // 값이 null이 아닐경우 전송 
		
		mav.setViewName("board/notice_all.tiles"); 
		return mav;  
	}
	
	
	
	// 게시판 글쓰기
	@RequestMapping(value="/addEnd.up", method= {RequestMethod.POST})
	public ModelAndView addEnd(Map<String, String> paraMap, ModelAndView mav, NoticeBoardVO boardvo, MultipartHttpServletRequest mrequest, MultipartFile[] attaches) {
		// System.out.println(boardvo.getPriority());
		
        //form 태그의 name 명과  BoardVO 의 필드명이 같다라면 (정확히 말하자면 setName 명이 같다라면)
        //request.getParameter("form 태그의 name명"); 을 사용하지 않더라도 자동적으로 BoardVO boardvo 에 set 되어진다.
	    // 첨부파일이 있는 경우 (사용자가 쓴 글에 파일이 첨부되어 있는 것인지, 아니면 파일첨부가 안된것인지 구분을 지어주어야 한다.)
		MultipartFile attach = boardvo.getAttach();  // add.jsp 페이지에서 파일첨부를 하면 boardvo 를 통해서 첨부파일 값을 받아온다.
		
		if( !attach.isEmpty() ) { // 첨부파일이 있는 경우라면
			
			// WAS 의 webapp 의 절대경로를 알아와야 한다.
			HttpSession session = mrequest.getSession(); // mrequest 세션 객체생성
			String root = session.getServletContext().getRealPath("/");  // 여기까지가 WAS의 webapp/ 와 같다.
			
			System.out.println("~~~ 확인용 webapp 의 절대경로 => " + root);
			// ~~~ 확인용 webapp 의 절대경로 => C:\NCS\workspace(spring)\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Board\
		
			String path = root+"resources"+ File.separator +"files"; //  webapp/resources 폴더에  files 폴더를 만들것이다. files 폴더에 업로드 파일을 저장할 예정이다.
			// path 가 첨부파일이 저장될 WAS(톰캣)의 폴더가 된다.
			// System.out.println("~~~ 확인용 path => " + path);  // 첨부파일이 비어있으면 콘솔에 아무것도 출력되지 않는다.
			// ~~~ 확인용 path => C:\NCS\workspace(spring)\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Board\resources\files
		
			//파일첨부를 위한 변수의 설정 및 값을 초기화 한 후 파일 올리기
			String newFileName = "";  // WAS(톰캣)의 디스크에 저장될 파일명
			
			byte[] bytes = null;  // 첨부파일의 내용물을 담는 것
			
			long fileSize = 0;  // 첨부파일의 최대 용량크기는 servlet-context.xml #21 에서 10MB(value="10485760") 로 해두었다.

			
			try {
				bytes = attach.getBytes();
				// attach(첨부파일)의 내용물을 읽어오는 것(알맹이). 읽어온 내용물을 bytes에 저장시킨다.
				
				String originalFilename = attach.getOriginalFilename();
				newFileName = fileManager.doFileUpload(bytes, originalFilename, path); // fileManager 클래스 파일의  doFileUpload 메소드(알맹이, 오리지널파일명, 경로) 를 통해 첨부되어진 파일을 업로드 하도록 하는 것
				// 첨부되어진 파일을 업로드 하도록 하는 것이다.
				
				boardvo.setNb_fileName(newFileName);
				// WAS(톰캣)에 저장된 파일명(20221028155717172835821348200.pdf)
				
				boardvo.setNb_orgFilename(originalFilename);
				// 게시판 페이지에서 첨부된 파일(강아지.png)을 보여줄 때 사용.
	            // 또한 사용자가 파일을 다운로드 할때 사용되어지는 파일명으로 사용.
				
				fileSize = attach.getSize();  // 첨부파일의 크기(단위는 byte임).  타입은 long 타입임.
				boardvo.setFileSize(String.valueOf(fileSize));  // long 타입을 String 타입으로 바꿔줌. boardvo 의 fileSize 필드는 String 타입이기 때문임.
				//System.out.println(">>> 확인용 fileSize => " + fileSize);
						
			} catch (Exception e) {  
				e.printStackTrace();
			}
		}
		
		boardvo.setContent(MyUtil.secureCode(boardvo.getContent())); // 불러온 내용(Content)에 MyUtil 클래스에 있는 secureCode 메소드를 적용한다. 적용후 바뀐 내용(Content)을 다시 set하여 저장한다.
		
		// 파일첨부가 있는 글쓰기 또는 파일첨부가 없는 글쓰기로 나뉘어서 service 호출하기
		int n = 0;
		if( attach.isEmpty() ) { 
			// attach(파일첨부)가 없는 글쓰기인 경우
			n = service.add(boardvo);
		}
		else {
			// attach(파일첨부)가 있는 글쓰기인 경우
			n = service.add_withFile(boardvo);
		}
		
		if(n==1) { // 성공시
			mav.setViewName("redirect:/board_all.up");  // board_all.up 페이지로 이동시킨다. **** 추후에 aop 제거하기 **** 
		}
		else { // 실패시
			/*
			String loc = "/board_all.up";
			String message = "글쓰기가 실패되었습니다.";
			mav.addObject("log",mrequest.getContextPath() + loc);
			mav.addObject("message",message);
			mav.setViewName("msg"); */
			mav.setViewName("board/error/add_error.tiles");
		}
		
		return mav;		
	}
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/board_team.up")
	public String board_team(HttpServletRequest request) {
		return "board/notice_team.tiles";
	}
	
	@RequestMapping(value = "/board/freeboard.up")
	public String freeboard(HttpServletRequest request) {
		return "board/freeboard.tiles";
	}
	
	
	/*
	 * @RequestMapping(value = "/board/myboard.up") public String
	 * myboard(HttpServletRequest request) { return "board/myboard.tiles"; }
	 */
	
	
	
	
	
}