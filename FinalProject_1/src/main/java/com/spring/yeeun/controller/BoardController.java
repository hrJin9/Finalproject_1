package com.spring.yeeun.controller;

import java.io.File;
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
		mav.setViewName("board/notice_all.tiles"); 
		return mav; 
	}
	
	
	
	// 게시판 글쓰기
	@RequestMapping(value="/addEnd.up", method= {RequestMethod.POST})
	public ModelAndView addEnd(Map<String, String> paraMap, ModelAndView mav, NoticeBoardVO boardvo, MultipartHttpServletRequest mrequest, MultipartFile[] attaches) {
		//System.out.println(boardvo.getFk_employee_no());
		//System.out.println(boardvo.getName_kr());
		//System.out.println(boardvo.getCategoryTag());
		//System.out.println(boardvo.getSubject());
		//System.out.println(boardvo.getContent());
		System.out.println(boardvo.getPriority());
		
        //form 태그의 name 명과  BoardVO 의 필드명이 같다라면 (정확히 말하자면 setName 명이 같다라면)
        //request.getParameter("form 태그의 name명"); 을 사용하지 않더라도 자동적으로 BoardVO boardvo 에 set 되어진다.
	    // 첨부파일이 있는 경우 (사용자가 쓴 글에 파일이 첨부되어 있는 것인지, 아니면 파일첨부가 안된것인지 구분을 지어주어야 한다.)
		MultipartFile attach = boardvo.getAttach();  // add.jsp 페이지에서 파일첨부를 하면 boardvo 를 통해서 첨부파일 값을 받아온다.
		
		if( !attach.isEmpty() ) { // 첨부파일이 있는 경우라면
			
			/*
		        1. 사용자가 보낸 첨부파일을 WAS(톰캣)의 특정 폴더에 저장해주어야 한다. 
		        >>> 파일이 업로드 되어질 특정 경로(폴더)지정해주기
		                   우리는 WAS의 webapp/resources/files 라는 폴더로 지정해준다.
		                   조심할 것은  Package Explorer 에서  files 라는 폴더를 만드는 것이 아니다.       
		    */
			// WAS 의 webapp 의 절대경로를 알아와야 한다.
			HttpSession session = mrequest.getSession(); // mrequest 세션 객체생성
			String root = session.getServletContext().getRealPath("/");  // 여기까지가 WAS의 webapp/ 와 같다.
			
			System.out.println("~~~ 확인용 webapp 의 절대경로 => " + root);
			// ~~~ 확인용 webapp 의 절대경로 => C:\NCS\workspace(spring)\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Board\
		
			String path = root+"resources"+ File.separator +"files"; //  webapp/resources 폴더에  files 폴더를 만들것이다. files 폴더에 업로드 파일을 저장할 예정이다.
			/* File.separator 는 운영체제에서 사용하는 폴더와 파일의 구분자이다.
		              운영체제가 Windows 이라면 File.separator 는  "\" 이고,
		              운영체제가 UNIX, Linux, 매킨토시(맥) 이라면  File.separator 는 "/" 이다. 
		              즉, OS(운영체제) 와 상관없이  File.separator 을 넣어주면된다.
		    */
			
			// path 가 첨부파일이 저장될 WAS(톰캣)의 폴더가 된다.
			// System.out.println("~~~ 확인용 path => " + path);  // 첨부파일이 비어있으면 콘솔에 아무것도 출력되지 않는다.
			// ~~~ 확인용 path => C:\NCS\workspace(spring)\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Board\resources\files
		
			/*
				2. 파일첨부를 위한 변수의 설정 및 값을 초기화 한 후 파일 올리기
			*/
			String newFileName = "";
			// WAS(톰캣)의 디스크에 저장될 파일명
			
			byte[] bytes = null;
			// 첨부파일의 내용물을 담는 것
			
			long fileSize = 0;  // 첨부파일의 최대 용량크기는 servlet-context.xml #21 에서 10MB(value="10485760") 로 해두었다.
			// 첨부파일의 크기
			
			try {
				bytes = attach.getBytes();
				// attach(첨부파일)의 내용물을 읽어오는 것(알맹이). 읽어온 내용물을 bytes에 저장시킨다.
				
				String originalFilename = attach.getOriginalFilename();
				// attach.getOriginalFilename() 이 첨부파일명의 파일명(예: 강아지.png) 이다.
				// System.out.println("~~~ 확인용 originalFilename => " + originalFilename);
				// ~~~ 확인용 originalFilename => LG_싸이킹청소기_사용설명서.pdf
				
				newFileName = fileManager.doFileUpload(bytes, originalFilename, path); // fileManager 클래스 파일의  doFileUpload 메소드(알맹이, 오리지널파일명, 경로) 를 통해 첨부되어진 파일을 업로드 하도록 하는 것
					// 첨부되어진 파일을 업로드 하도록 하는 것이다.
				
				//System.out.println(">>> 확인용 newFileName => " + newFileName);
				// >>> 확인용 newFileName => 20221028155717172835821348200.pdf
				
				/*
				    3. BoardVO boardvo 에 fileName 값과 orgFilename 값과 fileSize 값을 넣어주기
				*/
					boardvo.setNb_fileName(newFileName);
					// WAS(톰캣)에 저장된 파일명(20221028155717172835821348200.pdf)
					
					boardvo.setNb_orgFilename(originalFilename);
					// 게시판 페이지에서 첨부된 파일(강아지.png)을 보여줄 때 사용.
		            // 또한 사용자가 파일을 다운로드 할때 사용되어지는 파일명으로 사용.
					// LG_싸이킹청소기_사용설명서.pdf
					
					fileSize = attach.getSize();  // 첨부파일의 크기(단위는 byte임).  타입은 long 타입임.
					boardvo.setFileSize(String.valueOf(fileSize));  // long 타입을 String 타입으로 바꿔줌. boardvo 의 fileSize 필드는 String 타입이기 때문임.
					//System.out.println(">>> 확인용 fileSize => " + fileSize);
						
			} catch (Exception e) {  // (깨진 첨부파일을 읽어오는 경우 등) 모든 것을 포함하는 예외처리를 Exception 로 해준다. 참고로 FileManager.java 파일에서도  메소드에 throws Exception 처리 해주었다.
				e.printStackTrace();
			}
		}
		
		boardvo.setContent(MyUtil.secureCode(boardvo.getContent())); // 불러온 내용(Content)에 MyUtil 클래스에 있는 secureCode 메소드를 적용한다. 적용후 바뀐 내용(Content)을 다시 set하여 저장한다.
		
		// === #156. 파일첨부가 있는 글쓰기 또는 파일첨부가 없는 글쓰기로 나뉘어서 service 호출하기  === //
		//     먼저 위의 int n = service.add(boardvo); 부분을 주석처리 하고서 아래와 같이 한다.
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
			mav.setViewName("redirect:/board_all.up");  // **** 추후에 aop 제거하기 ****
			// 글쓰기가 성공되어지면 글목록을 보여주는 board_all.up 페이지로 이동시킨다.
		}
		else { // 실패시
			/*
			String loc = "/board_all.up";
			String message = "글쓰기가 실패되었습니다.";
			mav.addObject("log",mrequest.getContextPath() + loc);
			mav.addObject("message",message);
			mav.setViewName("msg"); */
			mav.setViewName("board/error/add_error.tiles");
			//   /WEB-INF/views/tiles1/board/error/add_error.jsp 파일을 생성한다.
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