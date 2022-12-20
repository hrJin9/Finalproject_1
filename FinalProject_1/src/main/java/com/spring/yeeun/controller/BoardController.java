package com.spring.yeeun.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.xwpf.usermodel.TOC;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.finalproject.common.FileManager;
import com.spring.finalproject.common.MyUtil;
import com.spring.hyerin.model.EmployeeVO;
import com.spring.yeeun.model.BoardHeartVO;
import com.spring.yeeun.model.BoardScrapVO;
import com.spring.yeeun.model.Fb_CommentVO;
import com.spring.yeeun.model.FreeBoardVO;
import com.spring.yeeun.model.NoticeBoardVO;
import com.spring.yeeun.service.InterBoardService;

@Controller
public class BoardController {
	
	@Autowired
	private InterBoardService service;
	
	@Autowired
	private FileManager fileManager;
	
	
	// **************** 공지게시판  **************** //
	// 게시판 목록 및 글쓰기 폼페이지 요청
	@RequestMapping(value = "/board_all.up")
	public ModelAndView rl_board_all(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) { 
		//getCurrentURL(request);  // 로그아웃을 했을 때 현재 보이던 그 페이지 그대로 돌아가기 위한 메소드 호출 (단, 로그인을 해야지만 볼 수 있는 페이지에는 사용하면 안된다. AOP 와 getCurrentURL(request); 코드가 꼬이게 된다.)
	      
		List<NoticeBoardVO> boardList = null;      // 초기값으로 글이 하나도 없을 수 있음
		List<BoardScrapVO> bookmarkList = null;    // 초기값으로 북마크 글이 하나도 없을 수 있음
	      
		// ** 글조회수(readCount)증가 설정  시작 ** //
		// 글조회수(readCount)증가 (DML문 update)는
		// 반드시 목록보기에 와서 해당 글제목을 클릭했을 경우에만 증가되고, 웹브라우저에서 새로고침(F5)을 했을 경우에는 증가가 되지 않도록 해야 한다.
		// 이것을 하기 위해서는 session 을 사용하여 처리하면 된다.
		// session 에  "readCountPermission" 키값으로 저장된 value값은 "yes" 이다.
		// session 에  "readCountPermission" 키값에 해당하는 value값 "yes"를 얻으려면 
		// 반드시 웹브라우저에서 주소창에 /list.action 페이지에서 요청해야지만 value값 "yes"를 얻어올 수 있다.
		HttpSession session = request.getSession();
		session.setAttribute("readCountPermission", "yes");
		// ** 글조회수(readCount)증가 설정 끝 ** //
		
		
		// ** 페이징 처리를 안한 검색어가 없는 전체 글목록 보여주기 ** //
		String searchCondition = request.getParameter("searchCondition");
		String searchVal = request.getParameter("searchVal");
        String str_currentShowPageNo = request.getParameter("currentShowPageNo");
        //System.out.println("searchCondition >> "+searchCondition);
        //System.out.println("searchVal >> "+searchVal);
        
        
        // url 에 장난칠 경우 전체목록이 보여지도록 막아준다.
        if(searchCondition == null || (!"categoryTag".equals(searchCondition) && !"name_kr".equals(searchCondition) && !"subject".equals(searchCondition) && !"content".equals(searchCondition)) ) {  // searchType 이 null 값이거나  subject 도 아니고 name 도 아닐 경우
        	searchCondition = "";  // 검색어가 없는 것으로 간주해서 "" 로 들어온다.
        }
        if(searchVal == null || "".equals(searchVal) || searchVal.trim().isEmpty() ) { // null 이든지 "" 이든지 공백을 제거하든지      ** ||(또는) 경우, 앞에 조건이 아닐 경우 뒤로 넘어간다. 즉 모든 조건이 다른 경우이다.
        	searchVal = "";  // 검색어가 없는 것으로 간주해서 "" 로 들어온다.
        }
      
        Map<String, String> paraMap = new HashMap<>();
        paraMap.put("searchCondition", searchCondition);
        paraMap.put("searchVal", searchVal);
         
        // 먼저 총 게시물 건수(totalCount)를 구해와야 한다.
        // 총 게시물 건수(totalCount)는 검색조건이 있을 때와 없을 때로 나뉘어진다.
        int totalCount = 0;         // 총 게시물 건수
        int sizePerPage = 10;        // 한 페이지당 보여줄 게시물 건수 
        int currentShowPageNo = 0;  // 현재 보여주는 페이지번호로서, 초기치로는 1페이지로 설정함.
        int totalPage = 0;          // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)
         
        int startRno = 0; // 시작 행번호
        int endRno = 0;   // 끝 행번호
       
        // 총 게시물 건수(totalCount)
        totalCount = service.getTotalCount(paraMap);
        //System.out.println("~~~~ 확인용 totalCount : " + totalCount);
       
        // 만약에 총 게시물 건수(totalCount)가 24 개 이라면  총 페이지수(totalPage)는 3개가 되어야 한다.
        totalPage = (int) Math.ceil( (double)totalCount/sizePerPage );
       
        if(str_currentShowPageNo == null) {
        	// 게시판에 보여지는 초기화면 
        	currentShowPageNo = 1; // 초기치로는 1페이지로 설정함.
        }
        else {
        	try {
        		currentShowPageNo = Integer.parseInt(str_currentShowPageNo);   // 현재 보여주는 페이지번호는 int타입이어야 한다.
                if( currentShowPageNo < 1 || currentShowPageNo > totalPage ) { // 음수거나 총페이지수보다 클 경우
            	    currentShowPageNo = 1; // 초기치로는 1페이지로 설정함.  
                }
        	} catch(NumberFormatException e) { // currentShowPageNo 에 문자열로 장난칠 경우
        		currentShowPageNo = 1; // 초기치로는 1페이지로 설정함.  
        	}
        }
       
        startRno = ((currentShowPageNo - 1) * sizePerPage) + 1;
        endRno = startRno + sizePerPage - 1;
       
        paraMap.put("startRno", String.valueOf(startRno)); // Map 은 String 타입이므로  int 타입인 startRno 를 변환한다.
        paraMap.put("endRno", String.valueOf(endRno));     // Map 은 String 타입이므로  int 타입인 endRno 를 변환한다.
       
        // 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한 것)
        boardList = service.boardListSearchWithPaging(paraMap);  // paraMap 이 없다면 전체 글목록이 다 조회되고, paraMap 이 있다면 where 조건절(searchType, searchWord)에 해당하는 글목록만 조회된다.
        
        // ** 북마크한 게시물 시작  ** //
        // 로그인된 유저의 employee_no 알아오기
 		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
 		String fk_employee_no = loginuser.getEmployee_no();
		
		paraMap.put("fk_employee_no", fk_employee_no);
		
		// 북마크한 게시물 조회하기
        bookmarkList = service.bookmarkList(fk_employee_no);  // paraMap 이 없다면 전체 글목록이 다 조회되고, paraMap 이 있다면 where 조건절(searchType, searchWord)에 해당하는 글목록만 조회된다.
        //System.out.println("bookmarkList >>" + bookmarkList);
        
        if(bookmarkList != null) {
			for(NoticeBoardVO nbvo : boardList) {
				for (int i = 0; i < bookmarkList.size(); i++) {
					if(nbvo.getNbno().equals(bookmarkList.get(i).getFk_bno())) {
						nbvo.setBookmark("true");
						//System.out.println("nbvo.getNbno() >>> " + nbvo.getNbno());
					}
				}
				
			}// end of for------------------
		}
        // ** 북마크한 게시물 끝  ** //
        
        
        // 검색대상 컬럼과 검색어를 뷰단 페이지에서 유지시키기 위한 것임.
        if( !"".equals(searchCondition) && !"".equals(searchVal) ) { // 둘 다 뭔가가 들어와서 null이 아닐 경우
        	mav.addObject("paraMap", paraMap); // paraMap 에 저장한 data 를  request 영역에 넣어두고 있는 것
        }
       
        // === #121. 페이지바 만들기 === //
        int blockSize = 10;
        // blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 개수이다.
      
        int loop = 1;
        //loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수[ 지금은 10개(== blockSize) ] 까지만 증가하는 용도이다.
      
        int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
      
        String pageBar = "<nav><ul class='pagination mg-pagebar'style='align-items: center;display: inline-flex;'>";
        String url = "board_all.up";
      
 		// === [맨처음][이전] 만들기 === //
 		if(pageNo != 1) {
 			pageBar += "<li class='page-item'><a class='page-link'  aria-label='처음' href='"+url+"?searchCondition="+searchCondition+"&searchVal="+searchVal+"&currentShowPageNo=1'><span aria-hidden='true'>&laquo;</span></a></li>";
 			pageBar += "<li class='page-item'><a class='page-link'  aria-label='이전' href='"+url+"?searchCondition="+searchCondition+"&searchVal="+searchVal+"&currentShowPageNo="+(pageNo-1)+"'><span aria-hidden='true'>&lt;</span></a></li>";
 		}
 		
 		 
 		while( !(loop > blockSize || pageNo > totalPage) ) {
 			if(pageNo==currentShowPageNo) {
 				pageBar += "<li class='page-item' style='cursor:not-allowed; font-weight: 700; '><a class='page-link' style='background-color: #4285f4; color: white !important;'><span aria-hidden='true'>"+pageNo+"</span></a></li>";
 			}
 			else {
 				pageBar += "<li class='page-item'><a class='page-link' href='"+url+"?searchCondition="+searchCondition+"&searchVal="+searchVal+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
 			}
 			loop ++;
 			pageNo ++;
 		}// end of while()
 		
 		// === [다음][마지막] 만들기 === //
 		if(pageNo <= totalPage) {
 			pageBar += "<li class='page-item'><a class='page-link' aria-label='다음'href='"+url+"?searchCondition="+searchCondition+"&searchVal="+searchVal+"&currentShowPageNo="+pageNo+"'><span aria-hidden='true'>&gt;</span></a></li>";
 			pageBar += "<li class='page-item'><a class='page-link' aria-label='마지막' href='"+url+"?searchCondition="+searchCondition+"&searchVal="+searchVal+"&currentShowPageNo="+totalPage+"'><span aria-hidden='true'>&raquo;</span></a></li>";
 		}
 		
 		pageBar += "</ul></nav>";
 		mav.addObject("pageBar",pageBar);
       
      
        // 페이징 처리되어진 후 특정 글제목을 클릭하여 상세내용을 본 이후
        // 사용자가 "검색된결과목록보기" 버튼을 클릭했을 때 돌아갈 페이지를 알려주기 위해 현재 페이지 주소를 뷰단으로 넘겨준다.
        String gobackURL = MyUtil.getCurrentURL(request);  // 다음의 데이터까지 포함한 현재 URL 주소를 알려주는 메소드
		//System.out.println("gobackURL >>" +gobackURL);
        
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy. MM. dd");
        Calendar now = Calendar.getInstance();
        String today = formatter.format(now.getTime());
		
		//boardList = service.boardListNoSearch(); // 페이징 처리를 안한 검색어가 없는 전체 글목록 보여주기
        mav.addObject("gobackURL", gobackURL.replaceAll("&", " "));
        mav.addObject("boardList", boardList); // 모든 게시판 내용(값이 null이 아닐경우 전송)
	    mav.addObject("bookmarkList", bookmarkList);  // 북마크한 것(값이 null이 아닐경우 전송)
	    mav.addObject("today", today);                // 오늘 날짜
		mav.setViewName("board/notice_all.tiles"); 
		return mav;  
	}
	
	
	// 북마크 표시하기 및 표시 해제하기
	@ResponseBody
	@RequestMapping(value = "/notice/updateScrap.up", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8") // 오로지 GET방식만 허락하는 것임.
	public String noticeaddscrap(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no(); // 로그인한 유저(북마크한 유저)
		
		String status = request.getParameter("status");  // 의미 없음
		String fk_bno = request.getParameter("nbno");
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("fk_bno", fk_bno);
		paraMap.put("status", status);
		paraMap.put("fk_employee_no", fk_employee_no);
		
		// 북마크한 게시물인지 조회하기
		BoardScrapVO bookmarkNo = service.selbookmarkNo(paraMap);
        //System.out.println("bookmarkNo >>" + bookmarkNo);
		
		if(bookmarkNo != null) { // delete 해야함
			paraMap.put("update", "del");
		}else { // insert 해야함
			paraMap.put("update", "add");
		}
		
        // 북마크 표시하기 및 표시 해제하기
		int result = service.updateBookmark(paraMap);
		if(result != 0) {
			result = 1;
		}
		//System.out.println("result :" + result);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result);
		jsonobj.put("bookmarkNo", bookmarkNo);
		return jsonobj.toString(); // "[]" 또는 "[{},{},{}]"
	}
	
	
	// 게시판 글쓰기
	@RequestMapping(value="/board_addEnd.up", method= {RequestMethod.POST})
	public ModelAndView board_addEnd(Map<String, String> paraMap, ModelAndView mav, NoticeBoardVO boardvo, MultipartHttpServletRequest mrequest, MultipartFile[] attaches) {
		// System.out.println(boardvo.getPriority());
		
        //form 태그의 name 명과  BoardVO 의 필드명이 같다라면 (정확히 말하자면 setName 명이 같다라면)
        //request.getParameter("form 태그의 name명"); 을 사용하지 않더라도 자동적으로 BoardVO boardvo 에 set 되어진다.
	    // 첨부파일이 있는 경우 (사용자가 쓴 글에 파일이 첨부되어 있는 것인지, 아니면 파일첨부가 안된것인지 구분을 지어주어야 한다.)
		MultipartFile attach = boardvo.getAttach();  // add.jsp 페이지에서 파일첨부를 하면 boardvo 를 통해서 첨부파일 값을 받아온다.
		
		if( !attach.isEmpty() ) { // 첨부파일이 있는 경우라면
			
			// WAS 의 webapp 의 절대경로를 알아와야 한다.
			HttpSession session = mrequest.getSession(); // mrequest 세션 객체생성
			String root = session.getServletContext().getRealPath("/");  // 여기까지가 WAS의 webapp/ 와 같다.
			
			//System.out.println("~~~ 확인용 webapp 의 절대경로 => " + root);
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
				
				fileSize = attach.getSize();  // 첨부파일의 크기(단위는 byte임) 이며 타입은 long 타입임.
				boardvo.setFileSize(String.valueOf(fileSize));  // long 타입을 String 타입으로 바꿔줌. boardvo 의 fileSize 필드는 String 타입이기 때문임.
						
			} catch (Exception e) {  
				e.printStackTrace();
			}
		}
		
		boardvo.setContent(MyUtil.secureCode(boardvo.getContent())); // 불러온 내용(Content)에 MyUtil 클래스에 있는 secureCode 메소드를 적용한다. 적용후 바뀐 내용(Content)을 다시 set하여 저장한다.
		
		// 파일첨부가 있는 글쓰기 또는 파일첨부가 없는 글쓰기로 나뉘어서 service 호출하기
		int n = 0;
		if( attach.isEmpty() ) {  // attach(파일첨부)가 없는 글쓰기인 경우
			n = service.add(boardvo);
		}
		else { // attach(파일첨부)가 있는 글쓰기인 경우
			n = service.add_withFile(boardvo);
		}
		
		if(n==1) {
			mav.setViewName("redirect:/board_all.up");  // board_all.up 페이지로 이동시킨다. **** 추후에 aop 제거하기 **** 
		}
		else {
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
	
	
	

	/**
	 * 파일이름 추출하기
	 * 1. 업로드한 파일의 확장자명 알아내기
	 * 2. (오늘날짜)_currentTimeMillis + 확장자 방식으로 파일명 생성
	 * 3. 파일 경로에 등록
	 * 4. 주소값 리턴 (https://localhost:8080/bombom/resources/upload/파일)
	 */
	// 게시판 글쓰기 스마트에디터(파일 삽입) Ajax
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@ResponseBody
	@RequestMapping(value = "/board/image_upload.up", method = RequestMethod.POST, produces="text/plain;charset=UTF-8") 
	public String imageUpload(@RequestParam("image")MultipartFile multipartFile,
							  @RequestParam String uri, HttpServletRequest request) {

		if(multipartFile.isEmpty()) {
			logger.warn("user_write image upload detected, but there's no file.");
			return "not found";
		}

		String directory = request.getSession().getServletContext().getRealPath("resources/upload/board/");

		String fileName = multipartFile.getOriginalFilename();
		int lastIndex = fileName.lastIndexOf(".");
		String ext = fileName.substring(lastIndex, fileName.length());
		String newFileName = LocalDate.now() + "_" + System.currentTimeMillis() + ext;

		try {
			File image = new File(directory + newFileName);

			multipartFile.transferTo(image);

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		} finally {
			logger.info("uri : {}", uri);
			logger.info("Image Path : {}", directory);
			logger.info("File_name : {}", newFileName);
		}

		// 주소값 알아내기
		String path = request.getContextPath();
		int index = request.getRequestURL().indexOf(path);
		String url = request.getRequestURL().substring(0, index);

		// https://localhost:8080/bombom/resources/upload/파일이름

		return url + request.getContextPath() + "/resources/upload/board/" + newFileName;
	}

	
	
	// 게시물 보여주기 페이지 요청
	@RequestMapping(value="/notice/view.up")
	public ModelAndView view(ModelAndView mav, HttpServletRequest request) {
		
	    //getCurrentURL(request);  // 로그아웃을 했을 때 현재 보이던 그 페이지 그대로 돌아가기 위한 메소드 호출

	    HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no(); // 로그인한 유저(북마크한 유저)
		String nbno = request.getParameter("nbno");
		
        Map<String, String> paraMap = new HashMap<>();
		paraMap.put("fk_employee_no", fk_employee_no);
		paraMap.put("nbno", nbno);
        
		
		String searchCondition = request.getParameter("searchCondition");
		String searchVal = request.getParameter("searchVal");
		
		if(searchCondition == null) {
			searchCondition = "";
		}
		if(searchVal == null) {
			searchVal = "";
		}
		
		// 페이징 처리되어진 후 특정 글제목을 클릭하여 상세내용을 본 이후 
		// 사용자가 "검색된결과목록보기" 버튼을 클릭했을 때 돌아갈 페이지를 알려주기 위해 현재 페이지 주소를 뷰단으로 넘겨준다.
		String gobackURL = request.getParameter("gobackURL");  
		// list.jsp 파일에서는  /list.action?searchType=subject&searchWord=java&currentShowPageNo=3 넘겨주는데,
		// 넘겨받을 때는  & 구분자로 끊겨서   /list.action?searchType=subject 까지 받아온다.
		// 게시판 목록보기에서  mav.addObject("gobackURL", gobackURL.replaceAll("&", " ")); 처리를 해줌으로써 아래와 같이 전부 다 받아오게 된다.
		
		if(gobackURL != null && gobackURL.contains(" ") ) {  // gobackURL 은 null 이 아니면서, 내용물에 구분자 & 대신에 넣어준 공백 " " 이 있다면
			gobackURL = gobackURL.replaceAll(" ", "&");
		}
		mav.addObject("gobackURL", gobackURL);
		
		
	    try {
	        Integer.parseInt(nbno);  // 숫자타입인 글번호만 받아오기

			paraMap.put("searchCondition", searchCondition);
			paraMap.put("searchVal", searchVal);
			mav.addObject("paraMap", paraMap);
			
	        //  글1개를 보여주는 페이지 요청은 select 와 함께 DML문(지금은 글조회수 증가인 update문)이 포함되어져 있다.
	        //  이럴경우 웹브라우저에서 페이지 새로고침(F5)을 했을때 DML문이 실행되어 매번 글조회수 증가가 발생한다.
	        //  그래서 우리는 웹브라우저에서 페이지 새로고침(F5)을 했을때는 단순히 select만 해주고 DML문(지금은 글조회수 증가인 update문)은  실행하지 않도록 해주어야 한다.

	        // 게시판 목록보기에서 session.setAttribute("readCountPermission", "yes"); 해두었다.
	        NoticeBoardVO boardvo = null;
	        if("yes".equals(session.getAttribute("readCountPermission"))) { // 확인용
	            // 글목록보기를 클릭한 다음에 특정글을 조회해온 경우이다. 즉 글목록보기 페이지를 거쳐온 경우를 의미한다.

	        	// 글조회수 증가와 함께 글 1개를 조회해주는 것 
	        	// (먼저, 로그인을 한 상태에서 다른 사람의 글을 조회할 경우에는 글조회수 컬럼의 값을 1증가 해야 한다)
	            boardvo = service.getView(paraMap);

	            // (중요) session 에 저장된 readCountPermission 을 삭제한다. 확인용이므로 계속 session 에 남겨둘 필요없이 확인 후에 삭제해야 함
	            session.removeAttribute("readCountPermission");
	        }
	        else {
	            // 웹브라우저에서 새로고침(F5)을 클릭한 경우이다.
	        	
	        	// 글조회수 증가는 없고 게시물 1개만 조회 해주는 것 
	            boardvo = service.getViewWithNoAddCount(paraMap);
	        }
	        
	        
	        // ** 좋아요한 게시물 시작  ** //
			// 게시글 1개에서 좋아요 여부 확인
			int heartCheck = service.heartCheck(paraMap);  // paraMap 이 없다면 전체 글목록이 다 조회되고, paraMap 이 있다면 where 조건절(searchType, searchWord)에 해당하는 글목록만 조회된다.
			//System.out.println("heartCheck >>" + heartCheck);
	        if(heartCheck != 0) { // heartCheck == 1  인 경우
	        	boardvo.setHeart("true");
	        }
	        // ** 좋아요한 게시물 끝  ** //
	        
	        // ** 북마크한 게시물 시작  ** //
 			// 게시글 1개에서 북마크 여부 확인
 			int bookmarkCheck = service.bookmarkCheck(paraMap);  // paraMap 이 없다면 전체 글목록이 다 조회되고, paraMap 이 있다면 where 조건절(searchType, searchWord)에 해당하는 글목록만 조회된다.
 			//System.out.println("bookmarkCheck >>" + bookmarkCheck);
 	        if(bookmarkCheck != 0) { // bookmarkCheck == 1  인 경우
 	        	boardvo.setBookmark("true");
 	        }
 	        // ** 북마크한 게시물 끝  ** //
	        
	        mav.addObject("boardvo", boardvo);
	    } catch (NumberFormatException e) {
	    }

	    mav.setViewName("board/nb_view.tiles");
	    return mav;
	}
		
	
	
	// 이전글제목, 다음글제목 클릭시 조회수 +1 증가를 위한 것
	@RequestMapping(value="/notice/view_pn.up")
	public ModelAndView view_2(ModelAndView mav, HttpServletRequest request) {
		
		//getCurrentURL(request);  // 로그아웃을 했을 때 현재 보이던 그 페이지 그대로 돌아가기 위한 메소드 호출
		
		String nbno = request.getParameter("nbno");
		
		String searchCondition = request.getParameter("searchCondition");
		String searchVal = request.getParameter("searchVal");
		String gobackURL = request.getParameter("gobackURL");
		//System.out.println("searchCondition >>>>>"+searchCondition);
		//System.out.println("searchVal >>>>>"+searchVal);
		//System.out.println("gobackURL >>>>>"+gobackURL);
		
		try {
			searchVal = URLEncoder.encode(searchVal, "UTF-8"); // redirect:/ 를 할 경우 한글이 ? 처럼 안 깨지고 그대로 한글을 사용하도록 해줌. 
			gobackURL = URLEncoder.encode(gobackURL, "UTF-8"); 
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} 
		
		HttpSession session = request.getSession();
		session.setAttribute("readCountPermission", "yes");  
		// 이것을 가진 상태에서 아래의 url 로 이동하도록 틀어버린다.
		
		mav.setViewName("redirect:/notice/view.up?nbno="+nbno+"&searchCondition="+searchCondition+"&searchVal="+searchVal+"&gobackURL="+gobackURL); 
		// 위에 파라미터에서는 문제가 없고,  여기서 redirect 해줄 때  searchWord 에 한글이 들어오면 ?? 로 깨지게 된다. 참고로 영어가 들어오면 인식한다.
		// 따라서  searchVal = URLEncoder.encode(searchVal, "UTF-8"); 를 해줌으로써  그대로 한글을 사용하도록 해줌. 
		
		return mav;
	}
	
		
	// 게시물 보기에서 첨부파일 다운 받기
	@RequestMapping(value="/download.up")
	public void download(HttpServletRequest request, HttpServletResponse response) { // 파일을 다운만 받아주는 메소드로, view 단이 필요가 없다.
		
		String nbno = request.getParameter("nbno"); // 첨부파일이 있는 글번호
		
		// 글조회수 증가는 없고 단순히 글1개만 조회 해주는 것 
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("nbno", nbno);  // 글번호
		paraMap.put("searchCondition", "");  // 검색조건
		paraMap.put("searchVal", "");  // 검색어
		
		response.setContentType("text/html; charset=UTF-8");  // jsp 파일 맨 위에 선언하는 searchCondition="text/html; charset=UTF-8" 와 동일함. 해당파일은 java 파일이지만  view 단 페이지를 사용하지 않고, 웹페이지로 출력해주겠다는 의미임.
		PrintWriter out = null;  // 일반적으로 사용하는  System.out.println(); 은 모니터에 출력하는 것. PrintWriter out 은 웹브라우저에 출력하는 것. // out 은 웹브라우저에 기술하는 대상체라고 생각하자.
		
		try {
			Integer.parseInt(nbno); // nbno 가 숫자타입이어야 하므로 try~catch 해줌.
			NoticeBoardVO boardvo = service.getViewWithNoAddCount(paraMap);  // 글번호 또는 검색조건 및 검색어 받아옴.
			
			if(boardvo == null || (boardvo != null && boardvo.getNb_fileName() == null)) { // 사용자가 장난칠 경우 (boardvo(글번호) 존재하지 않거나 있더라도 getNb_fileName 이 없을 경우)
				out = response.getWriter();  // out 은 웹브라우저에 기술하는 대상체라고 생각하자.
				out.println("<script type='text/javascript'>alert('존재하지 않는 게시글이거나 첨부파일이므로 파일 다운로드가 불가합니다.'); history.back();</script>");
				return; // 종료
			}
			else {
				// 정상적으로 다운로드를 할 경우
				String fileName = boardvo.getNb_fileName();
				String orgFilename = boardvo.getNb_orgFilename();
				
				// 첨부파일이 저장되어 있는 WAS(톰캣)서버의 디스크 경로명을 알아아야만 다운로드를 해줄 수 있다.
				// 이 경로는 우리가 첨부파일을 위해서 /board_addEnd.up 에서 설정해두었던 경로와 똑같아야 한다. WAS 의 webapp 의 절대경로를 알아와야 한다.
				HttpSession session = request.getSession();
				String root = session.getServletContext().getRealPath("/");
				
				String path = root+"resources"+ File.separator +"files"; //  webapp/resources 폴더에  files 폴더를 만들것이다. files 폴더에 업로드 파일을 저장할 예정이다.
			      
				// **** file 다운로드 하기 **** //
				boolean flag = false;  // file 다운로드 성공, 실패를 알려주는 용도
				flag = fileManager.dofileDownload(fileName, orgFilename, path, response); // 어떤 파일을, 어떠한 이름으로, 어떤 경로로 다운로드할지, 응답하는 response
				// file 다운로드 성공시 flag 는 true, 실패시 flag 는 false 를 가진다.
				
				if(!flag) {
					// 다운로드가 실패할 경우 메시지를 띄워준다. (기본값은 true, ! 를 붙이면 false)
					out = response.getWriter();
					out.println("<script type='text/javascript'>alert('파일다운로드가 실패하였습니다.'); history.back();</script>");
				}
			}
			
		} catch (NumberFormatException | IOException e) {
			try {
				out = response.getWriter();
				out.println("<script type='text/javascript'>alert('파일다운로드가 불가합니다.'); history.back();</script>");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			
		}
		
	} 
	
	
	// 좋아요 누르기
	@ResponseBody
	@RequestMapping(value = "/heartAdd.up", method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String heartAdd(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no(); // 로그인한 유저(좋아요한 유저)
		
		String status = request.getParameter("status");  // 의미 없음
		String fk_bno = request.getParameter("nbno");
		//System.out.println("fk_bno >>" + fk_bno);
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("fk_bno", fk_bno);
		paraMap.put("status", status);
		paraMap.put("fk_employee_no", fk_employee_no);
		
		// 좋아요한 게시물인지 조회하기
		BoardHeartVO heartAddNo = service.selHeartaddNo(paraMap);
        //System.out.println("heartAddNo >>" + heartAddNo);
		
		if(heartAddNo != null) { // delete 해야함
			paraMap.put("update", "del");
		}else { // insert 해야함
			paraMap.put("update", "add");
		}
		
        // 좋아요 표시하기 및 표시 해제하기
		int result = service.updateHeart(paraMap);
		if(result != 0) {
			result = 1;
		}
		//System.out.println("result :" + result);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result);
		jsonobj.put("heartAddNo", heartAddNo);
		//jsonobj.put("heartCnt", heartCnt);
		return jsonobj.toString(); // "[]" 또는 "[{},{},{}]"
	}
		
		
	// 게시글 1개의 좋아요 개수 알아오기
	@ResponseBody
	@RequestMapping(value = "/goLikeCount.up", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
	public String goLikeCount(HttpServletRequest request) {
		
		String fk_bno = request.getParameter("nbno");
		//System.out.println("fk_bno >>" + fk_bno);
		
		int heartCnt = service.heartCntbyView(fk_bno);
		//System.out.println("heartCnt >>" + heartCnt);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("heartCnt", heartCnt);
		return jsonobj.toString(); // "[]" 또는 "[{},{},{}]"
	}
	
	
	// 게시글 수정하기
	@RequestMapping(value="/board_editEnd.up", method= {RequestMethod.POST}) 
	public ModelAndView board_editEnd(ModelAndView mav, NoticeBoardVO boardvo, HttpServletRequest request) {
		
		int n = service.boardEdit(boardvo);
		
		if(n == 0) {
			mav.addObject("message", "게시글 수정이 실패하였습니다.");
			mav.addObject("loc", "javascript:history.back()"); // 이전페이지로 이동
		}
		else {  // 정상적으로 변경된 경우
			mav.addObject("message", "게시글이 수정되었습니다.");
			mav.addObject("loc", request.getContextPath()+"/board_all.up"); 
		}
		mav.setViewName("msg");
		
		return mav;
	}
		
		
	// 게시글 삭제하기
	@RequestMapping(value="/board_delEnd.up", method= {RequestMethod.POST}) 
	public ModelAndView board_delEnd(ModelAndView mav, HttpServletRequest request, HttpServletResponse response) {
		
		String nbno = request.getParameter("nbno");
		//System.out.println("nbno >>>>>"+nbno);
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("nbno", nbno);
		
		// ** 파일첨부 된 글이라면 글 삭제시 먼저 첨부파일을 삭제하기 시작 **
		paraMap.put("searchCondition", "");
		paraMap.put("searchVal", "");
		
		NoticeBoardVO boardvo = service.getViewWithNoAddCount(paraMap);
		// 글조회수(readCount) 증가 없이 단순히 글1개만 조회해주는 것이다.
		
		String fileName = boardvo.getNb_fileName();
		
		if(fileName != null && !"".equals(fileName)) {  // 첨부파일이 있는 경우
			
			// WAS 의 webapp 의 절대경로를 알아와야 한다.
			HttpSession session = request.getSession(); // mrequest 세션 객체생성
			String root = session.getServletContext().getRealPath("/");  // 여기까지가 WAS의 webapp/ 와 같다.
			String path = root+"resources"+ File.separator +"files";     //  webapp/resources 폴더에  files 폴더를 만들것이다. files 폴더에 업로드 파일을 저장할 예정이다.
			
			paraMap.put("path", path);  // 삭제해야할 파일이 저장된 경로
			paraMap.put("fileName", fileName);  // 삭제해야할 파일명
			
		}
		// ** 파일첨부 된 글이라면 글 삭제시 먼저 첨부파일을 삭제하기 끝 **
		
		
		int n = service.boardDel(paraMap);
		
		if(n == 0) {
			mav.addObject("message", "게시글 삭제가 실패하였습니다.");
			mav.addObject("loc", "javascript:history.back()"); // 이전페이지로 이동
		}
		else {  // 정상적으로 변경된 경우
			mav.addObject("message", "게시글이 삭제되었습니다.");
			mav.addObject("loc", request.getContextPath()+"/board_all.up"); 
		}
		mav.setViewName("msg");
		
		return mav;
	}	
	
	
	@RequestMapping(value = "/board_team.up")
	public String board_team(HttpServletRequest request) {
		return "board/notice_team.tiles";
	}
	
	
	
	// **************** 자유게시판  **************** //
	/*
	@RequestMapping(value = "/freeboard.up")
	public String freeboard(HttpServletRequest request) {
		return "board/freeboard.tiles";
	} */
	
	
	// 게시판 목록 및 글쓰기 폼페이지 요청
	@RequestMapping(value = "/freeboard.up")
	public ModelAndView freeboard(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) { 
		//getCurrentURL(request);  // 로그아웃을 했을 때 현재 보이던 그 페이지 그대로 돌아가기 위한 메소드 호출 (단, 로그인을 해야지만 볼 수 있는 페이지에는 사용하면 안된다. AOP 와 getCurrentURL(request); 코드가 꼬이게 된다.)
	      
		List<FreeBoardVO> boardList = null;        // 초기값으로 글이 하나도 없을 수 있음
		List<BoardScrapVO> bookmarkList = null;    // 초기값으로 북마크 글이 하나도 없을 수 있음
	      
		// ** 글조회수(readCount)증가 설정  시작 ** //
		// 글조회수(readCount)증가 (DML문 update)는
		// 반드시 목록보기에 와서 해당 글제목을 클릭했을 경우에만 증가되고, 웹브라우저에서 새로고침(F5)을 했을 경우에는 증가가 되지 않도록 해야 한다.
		// 이것을 하기 위해서는 session 을 사용하여 처리하면 된다.
		// session 에  "readCountPermission" 키값으로 저장된 value값은 "yes" 이다.
		// session 에  "readCountPermission" 키값에 해당하는 value값 "yes"를 얻으려면 
		// 반드시 웹브라우저에서 주소창에 /list.action 페이지에서 요청해야지만 value값 "yes"를 얻어올 수 있다.
		HttpSession session = request.getSession();
		session.setAttribute("readCountPermission", "yes");
		// ** 글조회수(readCount)증가 설정 끝 ** //
		
		
		// ** 페이징 처리를 안한 검색어가 없는 전체 글목록 보여주기 ** //
		String searchCondition = request.getParameter("searchCondition");
		String searchVal = request.getParameter("searchVal");
        String str_currentShowPageNo = request.getParameter("currentShowPageNo");
        //System.out.println("searchCondition >> "+searchCondition);
        //System.out.println("searchVal >> "+searchVal);
        
        
        // url 에 장난칠 경우 전체목록이 보여지도록 막아준다.
        if(searchCondition == null || (!"name_kr".equals(searchCondition) && !"subject".equals(searchCondition) && !"content".equals(searchCondition)) ) {  // searchType 이 null 값이거나  subject 도 아니고 name 도 아닐 경우
        	searchCondition = "";  // 검색어가 없는 것으로 간주해서 "" 로 들어온다.
        }
        if(searchVal == null || "".equals(searchVal) || searchVal.trim().isEmpty() ) { // null 이든지 "" 이든지 공백을 제거하든지      ** ||(또는) 경우, 앞에 조건이 아닐 경우 뒤로 넘어간다. 즉 모든 조건이 다른 경우이다.
        	searchVal = "";  // 검색어가 없는 것으로 간주해서 "" 로 들어온다.
        }
      
        Map<String, String> paraMap = new HashMap<>();
        paraMap.put("searchCondition", searchCondition);
        paraMap.put("searchVal", searchVal);
         
        // 먼저 총 게시물 건수(totalCount)를 구해와야 한다.
        // 총 게시물 건수(totalCount)는 검색조건이 있을 때와 없을 때로 나뉘어진다.
        int totalCount = 0;          // 총 게시물 건수
        int sizePerPage = 10;        // 한 페이지당 보여줄 게시물 건수 
        int currentShowPageNo = 0;   // 현재 보여주는 페이지번호로서, 초기치로는 1페이지로 설정함.
        int totalPage = 0;           // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)
         
        int startRno = 0; // 시작 행번호
        int endRno = 0;   // 끝 행번호
       
        // 총 게시물 건수(totalCount)
        totalCount = service.getfnTotalCount(paraMap);
        //System.out.println("~~~~ 확인용 totalCount : " + totalCount);
       
        // 만약에 총 게시물 건수(totalCount)가 24 개 이라면  총 페이지수(totalPage)는 3개가 되어야 한다.
        totalPage = (int) Math.ceil( (double)totalCount/sizePerPage );
       
        if(str_currentShowPageNo == null) {
        	// 게시판에 보여지는 초기화면 
        	currentShowPageNo = 1; // 초기치로는 1페이지로 설정함.
        }
        else {
        	try {
        		currentShowPageNo = Integer.parseInt(str_currentShowPageNo);   // 현재 보여주는 페이지번호는 int타입이어야 한다.
                if( currentShowPageNo < 1 || currentShowPageNo > totalPage ) { // 음수거나 총페이지수보다 클 경우
            	    currentShowPageNo = 1; // 초기치로는 1페이지로 설정함.  
                }
        	} catch(NumberFormatException e) { // currentShowPageNo 에 문자열로 장난칠 경우
        		currentShowPageNo = 1; // 초기치로는 1페이지로 설정함.  
        	}
        }
       
        startRno = ((currentShowPageNo - 1) * sizePerPage) + 1;
        endRno = startRno + sizePerPage - 1;
       
        paraMap.put("startRno", String.valueOf(startRno)); // Map 은 String 타입이므로  int 타입인 startRno 를 변환한다.
        paraMap.put("endRno", String.valueOf(endRno));     // Map 은 String 타입이므로  int 타입인 endRno 를 변환한다.
       
        // 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한 것)
        boardList = service.fboardListSearchWithPaging(paraMap);  // paraMap 이 없다면 전체 글목록이 다 조회되고, paraMap 이 있다면 where 조건절(searchType, searchWord)에 해당하는 글목록만 조회된다.
        
        // **** 북마크한 게시물 시작  **** //
        // 로그인된 유저의 employee_no 알아오기
 		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
 		String fk_employee_no = loginuser.getEmployee_no();
		
		paraMap.put("fk_employee_no", fk_employee_no);
		
		// 북마크한 게시물 조회하기
        bookmarkList = service.fn_bookmarkList(fk_employee_no);  // paraMap 이 없다면 전체 글목록이 다 조회되고, paraMap 이 있다면 where 조건절(searchType, searchWord)에 해당하는 글목록만 조회된다.
        //System.out.println("bookmarkList >>" + bookmarkList);
        
        if(bookmarkList != null) {
			for(FreeBoardVO nbvo : boardList) {
				for (int i = 0; i < bookmarkList.size(); i++) {
					if(nbvo.getFbno().equals(bookmarkList.get(i).getFk_bno())) {
						nbvo.setBookmark("true");
						//System.out.println("nbvo.getNbno() >>> " + nbvo.getNbno());
					}
				}
				
			}// end of for------------------
		}
        // **** 북마크한 게시물 끝  **** //
        
        // 검색대상 컬럼과 검색어를 뷰단 페이지에서 유지시키기 위한 것임.
        if( !"".equals(searchCondition) && !"".equals(searchVal) ) { // 둘 다 뭔가가 들어와서 null이 아닐 경우
        	mav.addObject("paraMap", paraMap); // paraMap 에 저장한 data 를  request 영역에 넣어두고 있는 것
        }
       
        // === #121. 페이지바 만들기 === //
        int blockSize = 10;
        // blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 개수이다.
      
        int loop = 1;
        //loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수[ 지금은 10개(== blockSize) ] 까지만 증가하는 용도이다.
      
        int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
      
        String pageBar = "<nav><ul class='pagination mg-pagebar'style='align-items: center;display: inline-flex;'>";
        String url = "board_all.up";
      
 		// === [맨처음][이전] 만들기 === //
 		if(pageNo != 1) {
 			pageBar += "<li class='page-item'><a class='page-link'  aria-label='처음' href='"+url+"?searchCondition="+searchCondition+"&searchVal="+searchVal+"&currentShowPageNo=1'><span aria-hidden='true'>&laquo;</span></a></li>";
 			pageBar += "<li class='page-item'><a class='page-link'  aria-label='이전' href='"+url+"?searchCondition="+searchCondition+"&searchVal="+searchVal+"&currentShowPageNo="+(pageNo-1)+"'><span aria-hidden='true'>&lt;</span></a></li>";
 		}
 		
 		 
 		while( !(loop > blockSize || pageNo > totalPage) ) {
 			if(pageNo==currentShowPageNo) {
 				pageBar += "<li class='page-item' style='cursor:not-allowed; font-weight: 700; '><a class='page-link' style='background-color: #4285f4; color: white !important;'><span aria-hidden='true'>"+pageNo+"</span></a></li>";
 			}
 			else {
 				pageBar += "<li class='page-item'><a class='page-link' href='"+url+"?searchCondition="+searchCondition+"&searchVal="+searchVal+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
 			}
 			loop ++;
 			pageNo ++;
 		}// end of while()
 		
 		// === [다음][마지막] 만들기 === //
 		if(pageNo <= totalPage) {
 			pageBar += "<li class='page-item'><a class='page-link' aria-label='다음'href='"+url+"?searchCondition="+searchCondition+"&searchVal="+searchVal+"&currentShowPageNo="+pageNo+"'><span aria-hidden='true'>&gt;</span></a></li>";
 			pageBar += "<li class='page-item'><a class='page-link' aria-label='마지막' href='"+url+"?searchCondition="+searchCondition+"&searchVal="+searchVal+"&currentShowPageNo="+totalPage+"'><span aria-hidden='true'>&raquo;</span></a></li>";
 		}
 		
 		pageBar += "</ul></nav>";
 		mav.addObject("pageBar",pageBar);
       
      
        // 페이징 처리되어진 후 특정 글제목을 클릭하여 상세내용을 본 이후
        // 사용자가 "검색된결과목록보기" 버튼을 클릭했을 때 돌아갈 페이지를 알려주기 위해 현재 페이지 주소를 뷰단으로 넘겨준다.
        String gobackURL = MyUtil.getCurrentURL(request);  // 다음의 데이터까지 포함한 현재 URL 주소를 알려주는 메소드
		//System.out.println("gobackURL >>" +gobackURL);
        
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy. MM. dd");
        Calendar now = Calendar.getInstance();
        String today = formatter.format(now.getTime());
		
		//boardList = service.boardListNoSearch(); // 페이징 처리를 안한 검색어가 없는 전체 글목록 보여주기
        mav.addObject("gobackURL", gobackURL.replaceAll("&", " "));
        mav.addObject("boardList", boardList);        // 모든 게시판 내용(값이 null이 아닐경우 전송)
	    mav.addObject("bookmarkList", bookmarkList);  // 북마크한 것(값이 null이 아닐경우 전송)
	    mav.addObject("today", today);                // 오늘 날짜
		mav.setViewName("board/freeboard.tiles"); 
		return mav;  
	}
	
	
	// 게시판 글쓰기
	@RequestMapping(value="/freeboard_addEnd.up", method= {RequestMethod.POST})
	public ModelAndView freeboard_addEnd(Map<String, String> paraMap, ModelAndView mav, FreeBoardVO boardvo, MultipartHttpServletRequest mrequest, MultipartFile[] attaches) {
		//System.out.println(boardvo.getFk_employee_no());
		//System.out.println(boardvo.getCommentCheck());
		//System.out.println(boardvo.getSubject());
		//System.out.println(boardvo.getContent());
		//System.out.println(boardvo.getPosition());
		//System.out.println(boardvo.getAttach());
		
        //form 태그의 name 명과  BoardVO 의 필드명이 같다라면 (정확히 말하자면 setName 명이 같다라면)
        //request.getParameter("form 태그의 name명"); 을 사용하지 않더라도 자동적으로 BoardVO boardvo 에 set 되어진다.
	    // 첨부파일이 있는 경우 (사용자가 쓴 글에 파일이 첨부되어 있는 것인지, 아니면 파일첨부가 안된것인지 구분을 지어주어야 한다.)
		MultipartFile attach = boardvo.getAttach();  // add.jsp 페이지에서 파일첨부를 하면 boardvo 를 통해서 첨부파일 값을 받아온다.
		
		if( !attach.isEmpty() ) { // 첨부파일이 있는 경우라면
			
			// WAS 의 webapp 의 절대경로를 알아와야 한다.
			HttpSession session = mrequest.getSession(); // mrequest 세션 객체생성
			String root = session.getServletContext().getRealPath("/");  // 여기까지가 WAS의 webapp/ 와 같다.
			
			//System.out.println("~~~ 확인용 webapp 의 절대경로 => " + root);
			String path = root+"resources"+ File.separator +"files"; //  webapp/resources 폴더에  files 폴더를 만들것이다. files 폴더에 업로드 파일을 저장할 예정이다.
		
			//파일첨부를 위한 변수의 설정 및 값을 초기화 한 후 파일 올리기
			String newFileName = "";  // WAS(톰캣)의 디스크에 저장될 파일명
			byte[] bytes = null;  // 첨부파일의 내용물을 담는 것
			long fileSize = 0;  // 첨부파일의 최대 용량크기는 servlet-context.xml #21 에서 10MB(value="10485760") 로 해두었다.

			try {
				bytes = attach.getBytes(); // attach(첨부파일)의 내용물을 읽어오는 것(알맹이). 읽어온 내용물을 bytes에 저장시킨다.
				
				String originalFilename = attach.getOriginalFilename();
				newFileName = fileManager.doFileUpload(bytes, originalFilename, path); // fileManager 클래스 파일의  doFileUpload 메소드(알맹이, 오리지널파일명, 경로) 를 통해 첨부되어진 파일을 업로드 하도록 하는 것
				// 첨부되어진 파일을 업로드 하도록 하는 것이다.
				
				boardvo.setFb_fileName(newFileName);
				// WAS(톰캣)에 저장된 파일명(20221028155717172835821348200.pdf)
				
				boardvo.setFb_orgFilename(originalFilename);
				// 게시판 페이지에서 첨부된 파일(강아지.png)을 보여줄 때 사용. 또한 사용자가 파일을 다운로드 할때 사용되어지는 파일명으로 사용.
				
				fileSize = attach.getSize();  // 첨부파일의 크기(단위는 byte임) 이며 타입은 long 타입임.
				boardvo.setFileSize(String.valueOf(fileSize));  // long 타입을 String 타입으로 바꿔줌. boardvo 의 fileSize 필드는 String 타입이기 때문임.
						
			} catch (Exception e) {  
				e.printStackTrace();
			}
		}
		
		boardvo.setContent(MyUtil.secureCode(boardvo.getContent())); // 불러온 내용(Content)에 MyUtil 클래스에 있는 secureCode 메소드를 적용한다. 적용후 바뀐 내용(Content)을 다시 set하여 저장한다.
		
		// 파일첨부가 있는 글쓰기 또는 파일첨부가 없는 글쓰기로 나뉘어서 service 호출하기
		int n = 0;
		if( attach.isEmpty() ) {  // attach(파일첨부)가 없는 글쓰기인 경우
			n = service.fb_add(boardvo);
		}
		else { // attach(파일첨부)가 있는 글쓰기인 경우
			n = service.fb_add_withFile(boardvo);
		}
		
		if(n==1) {
			mav.setViewName("redirect:/freeboard.up");  // freeboard.up 페이지로 이동시킨다.
		}
		else {
			/*
			String loc = "/board_all.up";
			String message = "글쓰기가 실패되었습니다.";
			mav.addObject("log",mrequest.getContextPath() + loc);
			mav.addObject("message",message);
			mav.setViewName("msg"); */
			mav.setViewName("board/error/add_error.tiles");
		}
		
		//System.out.println(boardvo.toString());
		
		return mav;		
	}	
	
	
	// 북마크 표시하기 및 표시 해제하기
	@ResponseBody
	@RequestMapping(value = "/fboard/updateScrap.up", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8") // 오로지 GET방식만 허락하는 것임.
	public String fboardaddscrap(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no(); // 로그인한 유저(북마크한 유저)
		
		String status = request.getParameter("status");  // 의미 없음
		String fk_bno = request.getParameter("fbno");
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("fk_bno", fk_bno);
		paraMap.put("status", status);
		paraMap.put("fk_employee_no", fk_employee_no);
		
		// 북마크한 게시물인지 조회하기
		BoardScrapVO bookmarkNo = service.fb_selbookmarkNo(paraMap);
        //System.out.println("bookmarkNo >>" + bookmarkNo);
		
		if(bookmarkNo != null) { // delete 해야함
			paraMap.put("update", "del");
		}else { // insert 해야함
			paraMap.put("update", "add");
		}
		
        // 북마크 표시하기 및 표시 해제하기
		int result = service.fb_updateBookmark(paraMap);
		if(result != 0) {
			result = 1;
		}
		//System.out.println("result :" + result);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result);
		jsonobj.put("bookmarkNo", bookmarkNo);
		return jsonobj.toString(); // "[]" 또는 "[{},{},{}]"
	}

	
	// 게시물 보여주기 페이지 요청
	@RequestMapping(value="/fboard/view.up")
	public ModelAndView fn_view(ModelAndView mav, HttpServletRequest request) {
		
	    //getCurrentURL(request);  // 로그아웃을 했을 때 현재 보이던 그 페이지 그대로 돌아가기 위한 메소드 호출

	    HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no(); // 로그인한 유저(북마크한 유저)
		String fbno = request.getParameter("fbno");
		
        Map<String, String> paraMap = new HashMap<>();
		paraMap.put("fk_employee_no", fk_employee_no);
		paraMap.put("fbno", fbno);
        
		
		String searchCondition = request.getParameter("searchCondition");
		String searchVal = request.getParameter("searchVal");
		
		if(searchCondition == null) {
			searchCondition = "";
		}
		if(searchVal == null) {
			searchVal = "";
		}
		
		// 페이징 처리되어진 후 특정 글제목을 클릭하여 상세내용을 본 이후 
		// 사용자가 "검색된결과목록보기" 버튼을 클릭했을 때 돌아갈 페이지를 알려주기 위해 현재 페이지 주소를 뷰단으로 넘겨준다.
		String gobackURL = request.getParameter("gobackURL");  
		// list.jsp 파일에서는  /list.action?searchType=subject&searchWord=java&currentShowPageNo=3 넘겨주는데,
		// 넘겨받을 때는  & 구분자로 끊겨서   /list.action?searchType=subject 까지 받아온다.
		// 게시판 목록보기에서  mav.addObject("gobackURL", gobackURL.replaceAll("&", " ")); 처리를 해줌으로써 아래와 같이 전부 다 받아오게 된다.
		
		if(gobackURL != null && gobackURL.contains(" ") ) {  // gobackURL 은 null 이 아니면서, 내용물에 구분자 & 대신에 넣어준 공백 " " 이 있다면
			gobackURL = gobackURL.replaceAll(" ", "&");
		}
		mav.addObject("gobackURL", gobackURL);
		
		
	    try {
	        Integer.parseInt(fbno);  // 숫자타입인 글번호만 받아오기

			paraMap.put("searchCondition", searchCondition);
			paraMap.put("searchVal", searchVal);
			mav.addObject("paraMap", paraMap);
			
	        //  글1개를 보여주는 페이지 요청은 select 와 함께 DML문(지금은 글조회수 증가인 update문)이 포함되어져 있다.
	        //  이럴경우 웹브라우저에서 페이지 새로고침(F5)을 했을때 DML문이 실행되어 매번 글조회수 증가가 발생한다.
	        //  그래서 우리는 웹브라우저에서 페이지 새로고침(F5)을 했을때는 단순히 select만 해주고 DML문(지금은 글조회수 증가인 update문)은  실행하지 않도록 해주어야 한다.

			loginuser = (EmployeeVO) session.getAttribute("loginuser");
			
			String login_userid = null; // 초기값
			if(loginuser != null) {
				login_userid = loginuser.getEmployee_no();
				// login_userid 는 로그인 되어진 사용자의 userid 이다.
			}
			paraMap.put("login_userid", login_userid);

			
			
			
	        // 게시판 목록보기에서 session.setAttribute("readCountPermission", "yes"); 해두었다.
	        FreeBoardVO boardvo = null;
	        if("yes".equals(session.getAttribute("readCountPermission"))) { // 확인용
	            // 글목록보기를 클릭한 다음에 특정글을 조회해온 경우이다. 즉 글목록보기 페이지를 거쳐온 경우를 의미한다.

	        	// 글조회수 증가와 함께 글 1개를 조회해주는 것 
	        	// (먼저, 로그인을 한 상태에서 다른 사람의 글을 조회할 경우에는 글조회수 컬럼의 값을 1증가 해야 한다)
	            boardvo = service.getfn_View(paraMap);

	            // (중요) session 에 저장된 readCountPermission 을 삭제한다. 확인용이므로 계속 session 에 남겨둘 필요없이 확인 후에 삭제해야 함
	            session.removeAttribute("readCountPermission");
	        }
	        else {
	            // 웹브라우저에서 새로고침(F5)을 클릭한 경우이다.
	        	
	        	// 글조회수 증가는 없고 게시물 1개만 조회 해주는 것 
	            boardvo = service.getfn_ViewWithNoAddCount(paraMap);
	        }
	        
	        
	        // ** 좋아요한 게시물 시작  ** //
			// 게시글 1개에서 좋아요 여부 확인
			int heartCheck = service.fn_heartCheck(paraMap);  // paraMap 이 없다면 전체 글목록이 다 조회되고, paraMap 이 있다면 where 조건절(searchType, searchWord)에 해당하는 글목록만 조회된다.
			//System.out.println("heartCheck >>" + heartCheck);
	        if(heartCheck != 0) { // heartCheck == 1  인 경우
	        	boardvo.setHeart("true");
	        }
	        // ** 좋아요한 게시물 끝  ** //
	        
	        // ** 북마크한 게시물 시작  ** //
 			// 게시글 1개에서 북마크 여부 확인
 			int bookmarkCheck = service.fn_bookmarkCheck(paraMap);  // paraMap 이 없다면 전체 글목록이 다 조회되고, paraMap 이 있다면 where 조건절(searchType, searchWord)에 해당하는 글목록만 조회된다.
 			//System.out.println("bookmarkCheck >>" + bookmarkCheck);
 	        if(bookmarkCheck != 0) { // bookmarkCheck == 1  인 경우
 	        	boardvo.setBookmark("true");
 	        }
 	        // ** 북마크한 게시물 끝  ** //
	        
	        mav.addObject("boardvo", boardvo);
	    } catch (NumberFormatException e) {
	    }

	    mav.setViewName("board/fb_view.tiles");
	    return mav;
	}
	
	
	
	// 이전글제목, 다음글제목 클릭시 조회수 +1 증가를 위한 것
	@RequestMapping(value="/fboard/view_pn.up")
	public ModelAndView fn_view_2(ModelAndView mav, HttpServletRequest request) {
		
		//getCurrentURL(request);  // 로그아웃을 했을 때 현재 보이던 그 페이지 그대로 돌아가기 위한 메소드 호출
		
		String fbno = request.getParameter("fbno");
		
		String searchCondition = request.getParameter("searchCondition");
		String searchVal = request.getParameter("searchVal");
		String gobackURL = request.getParameter("gobackURL");
		//System.out.println("searchCondition >>>>>"+searchCondition);
		//System.out.println("searchVal >>>>>"+searchVal);
		//System.out.println("gobackURL >>>>>"+gobackURL);
		
		try {
			searchVal = URLEncoder.encode(searchVal, "UTF-8"); // redirect:/ 를 할 경우 한글이 ? 처럼 안 깨지고 그대로 한글을 사용하도록 해줌. 
			gobackURL = URLEncoder.encode(gobackURL, "UTF-8"); 
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} 
		
		HttpSession session = request.getSession();
		session.setAttribute("readCountPermission", "yes");  
		// 이것을 가진 상태에서 아래의 url 로 이동하도록 틀어버린다.
		
		mav.setViewName("redirect:/fboard/view.up?fbno="+fbno+"&searchCondition="+searchCondition+"&searchVal="+searchVal+"&gobackURL="+gobackURL); 
		// 위에 파라미터에서는 문제가 없고,  여기서 redirect 해줄 때  searchWord 에 한글이 들어오면 ?? 로 깨지게 된다. 참고로 영어가 들어오면 인식한다.
		// 따라서  searchVal = URLEncoder.encode(searchVal, "UTF-8"); 를 해줌으로써  그대로 한글을 사용하도록 해줌. 
		
		return mav;
	}
	
		
	// 게시물 보기에서 첨부파일 다운 받기
	@RequestMapping(value="/fn_download.up")
	public void fn_download(HttpServletRequest request, HttpServletResponse response) { // 파일을 다운만 받아주는 메소드로, view 단이 필요가 없다.
		
		String fbno = request.getParameter("fbno"); // 첨부파일이 있는 글번호
		
		// 글조회수 증가는 없고 단순히 글1개만 조회 해주는 것 
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("fbno", fbno);  // 글번호
		paraMap.put("searchCondition", "");  // 검색조건
		paraMap.put("searchVal", "");  // 검색어
		
		response.setContentType("text/html; charset=UTF-8");  // jsp 파일 맨 위에 선언하는 searchCondition="text/html; charset=UTF-8" 와 동일함. 해당파일은 java 파일이지만  view 단 페이지를 사용하지 않고, 웹페이지로 출력해주겠다는 의미임.
		PrintWriter out = null;  // 일반적으로 사용하는  System.out.println(); 은 모니터에 출력하는 것. PrintWriter out 은 웹브라우저에 출력하는 것. // out 은 웹브라우저에 기술하는 대상체라고 생각하자.
		
		try {
			Integer.parseInt(fbno); // nbno 가 숫자타입이어야 하므로 try~catch 해줌.
			FreeBoardVO boardvo = service.getfn_ViewWithNoAddCount(paraMap);  // 글번호 또는 검색조건 및 검색어 받아옴.
			
			if(boardvo == null || (boardvo != null && boardvo.getFb_fileName() == null)) { // 사용자가 장난칠 경우 (boardvo(글번호) 존재하지 않거나 있더라도 getNb_fileName 이 없을 경우)
				out = response.getWriter();  // out 은 웹브라우저에 기술하는 대상체라고 생각하자.
				out.println("<script type='text/javascript'>alert('존재하지 않는 게시글이거나 첨부파일이므로 파일 다운로드가 불가합니다.'); history.back();</script>");
				return; // 종료
			}
			else {
				// 정상적으로 다운로드를 할 경우
				String fileName = boardvo.getFb_fileName();
				String orgFilename = boardvo.getFb_orgFilename();
				
				// 첨부파일이 저장되어 있는 WAS(톰캣)서버의 디스크 경로명을 알아아야만 다운로드를 해줄 수 있다.
				// 이 경로는 우리가 첨부파일을 위해서 /board_addEnd.up 에서 설정해두었던 경로와 똑같아야 한다. WAS 의 webapp 의 절대경로를 알아와야 한다.
				HttpSession session = request.getSession();
				String root = session.getServletContext().getRealPath("/");
				
				String path = root+"resources"+ File.separator +"files"; //  webapp/resources 폴더에  files 폴더를 만들것이다. files 폴더에 업로드 파일을 저장할 예정이다.
			      
				// **** file 다운로드 하기 **** //
				boolean flag = false;  // file 다운로드 성공, 실패를 알려주는 용도
				flag = fileManager.dofileDownload(fileName, orgFilename, path, response); // 어떤 파일을, 어떠한 이름으로, 어떤 경로로 다운로드할지, 응답하는 response
				// file 다운로드 성공시 flag 는 true, 실패시 flag 는 false 를 가진다.
				
				if(!flag) {
					// 다운로드가 실패할 경우 메시지를 띄워준다. (기본값은 true, ! 를 붙이면 false)
					out = response.getWriter();
					out.println("<script type='text/javascript'>alert('파일다운로드가 실패하였습니다.'); history.back();</script>");
				}
			}
			
		} catch (NumberFormatException | IOException e) {
			try {
				out = response.getWriter();
				out.println("<script type='text/javascript'>alert('파일다운로드가 불가합니다.'); history.back();</script>");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		
	} 
	
	
	// 좋아요 누르기
	@ResponseBody
	@RequestMapping(value = "/fn_heartAdd.up", method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String fn_heartAdd(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no(); // 로그인한 유저(좋아요한 유저)
		
		String status = request.getParameter("status");  // 의미 없음
		String fk_bno = request.getParameter("fbno");
		//System.out.println("fk_bno >>" + fk_bno);
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("fk_bno", fk_bno);
		paraMap.put("status", status);
		paraMap.put("fk_employee_no", fk_employee_no);
		
		// 좋아요한 게시물인지 조회하기
		FreeBoardVO heartAddNo = service.fn_selHeartaddNo(paraMap);
        //System.out.println("heartAddNo >>" + heartAddNo);
		
		if(heartAddNo != null) { // delete 해야함
			paraMap.put("update", "del");
		}else { // insert 해야함
			paraMap.put("update", "add");
		}
		
        // 좋아요 표시하기 및 표시 해제하기
		int result = service.fn_updateHeart(paraMap);
		if(result != 0) {
			result = 1;
		}
		//System.out.println("result :" + result);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result);
		jsonobj.put("heartAddNo", heartAddNo);
		//jsonobj.put("heartCnt", heartCnt);
		return jsonobj.toString(); // "[]" 또는 "[{},{},{}]"
	}
		
		
	// 게시글 1개의 좋아요 개수 알아오기
	@ResponseBody
	@RequestMapping(value = "/fn_goLikeCount.up", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
	public String fn_goLikeCount(HttpServletRequest request) {
		
		String fk_bno = request.getParameter("fbno");
		//System.out.println("fk_bno >>" + fk_bno);
		
		int heartCnt = service.fn_heartCntbyView(fk_bno);
		//System.out.println("heartCnt >>" + heartCnt);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("heartCnt", heartCnt);
		return jsonobj.toString(); // "[]" 또는 "[{},{},{}]"
	}
	
	
	// 게시글 수정하기
	@RequestMapping(value="/freeboard_editEnd.up", method= {RequestMethod.POST}) 
	public ModelAndView freeboard_editEnd(ModelAndView mav, FreeBoardVO boardvo, HttpServletRequest request) {
		
		int n = service.fn_boardEdit(boardvo);
		
		if(n == 0) {
			mav.addObject("message", "게시글 수정이 실패하였습니다.");
			mav.addObject("loc", "javascript:history.back()"); // 이전페이지로 이동
		}
		else {  // 정상적으로 변경된 경우
			mav.addObject("message", "게시글이 수정되었습니다.");
			mav.addObject("loc", request.getContextPath()+"/freeboard.up"); 
		}
		mav.setViewName("msg");
		
		return mav;
	}
		
		
	// 게시글 삭제하기
	@RequestMapping(value="/freeboard_delEnd.up", method= {RequestMethod.POST}) 
	public ModelAndView freeboard_delEnd(ModelAndView mav, HttpServletRequest request, HttpServletResponse response) {
		
		String fbno = request.getParameter("fbno");
		//System.out.println("nbno >>>>>"+nbno);
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("fbno", fbno);
		
		// ** 파일첨부 된 글이라면 글 삭제시 먼저 첨부파일을 삭제하기 시작 **
		paraMap.put("searchCondition", "");
		paraMap.put("searchVal", "");
		
		FreeBoardVO boardvo = service.getfn_ViewWithNoAddCount(paraMap);
		// 글조회수(readCount) 증가 없이 단순히 글1개만 조회해주는 것이다.
		
		String fileName = boardvo.getFb_fileName();
		
		if(fileName != null && !"".equals(fileName)) {  // 첨부파일이 있는 경우
			
			// WAS 의 webapp 의 절대경로를 알아와야 한다.
			HttpSession session = request.getSession(); // mrequest 세션 객체생성
			String root = session.getServletContext().getRealPath("/");  // 여기까지가 WAS의 webapp/ 와 같다.
			String path = root+"resources"+ File.separator +"files";     //  webapp/resources 폴더에  files 폴더를 만들것이다. files 폴더에 업로드 파일을 저장할 예정이다.
			
			paraMap.put("path", path);  // 삭제해야할 파일이 저장된 경로
			paraMap.put("fileName", fileName);  // 삭제해야할 파일명
			
		}
		// ** 파일첨부 된 글이라면 글 삭제시 먼저 첨부파일을 삭제하기 끝 **
		
		
		int n = service.fn_boardDel(paraMap);
		
		if(n == 0) {
			mav.addObject("message", "게시글 삭제가 실패하였습니다.");
			mav.addObject("loc", "javascript:history.back()"); // 이전페이지로 이동
		}
		else {  // 정상적으로 변경된 경우
			mav.addObject("message", "게시글이 삭제되었습니다.");
			mav.addObject("loc", request.getContextPath()+"/freeboard.up"); 
		}
		mav.setViewName("msg");
		
		return mav;
	}	
	
	
	// ************* 자유게시판 댓글작성 ************* //
	// 첨부파일이 없는 댓글쓰기(Ajax 처리)
	@ResponseBody    
	@RequestMapping(value="/addComment.up", method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String addComment(Fb_CommentVO commentvo) throws Throwable {

		int n = 0;
		try {
			// 댓글 및 원게시물 테이블의 댓글 개수 증가(update 1씩 증가)하기 
			n = service.addComment(commentvo);
			//System.out.println("n >>>>"+n);
		} catch (Throwable e) {
			e.printStackTrace();  // 콘솔에만 찍어준다.
		}
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("n", n);
		jsonObj.put("name_kr", commentvo.getName_kr());
		
		return jsonObj.toString();
	}	
	
	
	// 원게시물의 댓글을 페이징 처리해서 조회해오기(Ajax 처리)
	@ResponseBody     // return 되는 값은 View 단 페이지를 통해서 출력되는 것이 아니라 return 되어지는 값 그 자체를 웹브라우저에 바로 직접 쓰여지게 하는 것이다. JSON 결과물을 보일때는 css 태그 와 같은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문이다.
	@RequestMapping(value="/commentList.up", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8") // 단순히 view 단에 보여주는 것이므로 GET 방식으로 한다.
	public String commentList(HttpServletRequest request) { // Ajax 방식은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문에 항상 String 타입으로 해준다.
		
		String fk_fbno = request.getParameter("fk_fbno");
		String currentShowPageNo = request.getParameter("currentShowPageNo"); // 초기값 1
		
		if(currentShowPageNo == null) {
			currentShowPageNo = "1";
		}
		
		int sizePerPage = 3;   // 한 페이지당 보여줄 게시물 건수 
		int startRno = (( Integer.parseInt(currentShowPageNo) - 1) * sizePerPage) + 1;
	    int endRno = startRno + sizePerPage - 1;
		
	    Map<String, String> paraMap = new HashMap<>();
	    paraMap.put("fk_fbno", fk_fbno);
	    paraMap.put("startRno", String.valueOf(startRno));  // 시작하는 게시물 번호  ( int 타입인 startRno 을 String 타입으로 변환해서 넣어줌. )
	    paraMap.put("endRno", String.valueOf(endRno));      // 끝나는 게시물 번호
	    
	    List<Fb_CommentVO> commentList = service.getCommentListPaging(paraMap);
	    //System.out.println("commentList >>"+commentList);
	    
	    JSONArray jsonArr = new JSONArray();
	    
	    if(commentList != null) {
	    	for(Fb_CommentVO cmtvo: commentList) {  
	    		JSONObject jsonObj = new JSONObject();
	    		jsonObj.put("cno", cmtvo.getCno());
	    		jsonObj.put("name_kr", cmtvo.getName_kr());
	    		jsonObj.put("fk_employee_no", cmtvo.getFk_employee_no());
	    		jsonObj.put("position", cmtvo.getPosition());
	    		jsonObj.put("content", cmtvo.getContent());
	    		jsonObj.put("writedate", cmtvo.getWritedate());
	    		jsonArr.put(jsonObj);
	    	}// end of for--------------------
	    }
		
		return jsonArr.toString();
	}
	
	
	// 하나의 게시물당 댓글의 totalPage 수 알아오기(Ajax 처리)
	@ResponseBody     
	@RequestMapping(value="/commentTotalPage.up", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8") // 단순히 view 단에 보여주는 것이므로 GET 방식으로 한다.
	public String commentTotalPage(HttpServletRequest request) {
		
		String fk_fbno = request.getParameter("fk_fbno");
		String sizePerPage = request.getParameter("sizePerPage");
		
		Map<String, String> paraMap = new HashMap<>();
	    paraMap.put("fk_fbno", fk_fbno);
	    paraMap.put("sizePerPage", sizePerPage);
	    //System.out.println("sizePerPage >>" +sizePerPage);
	    
	    // 원글 글번호(parentSeq)에 해당하는 댓글의 totalPage 수 알아오기
	    int totalPage = service.commentTotalPage(paraMap);
	    //System.out.println("totalPage >>" +totalPage);
	    
	    JSONObject josnObj = new JSONObject();
	    josnObj.put("totalPage", totalPage);
	    
		return josnObj.toString();
	}
	
	
	// 본인 댓글 삭제하기(Ajax 처리)
	@ResponseBody    
	@RequestMapping(value="/delComment.up", method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String delComment(HttpServletRequest request) throws Throwable {

		
		String cno = request.getParameter("cno");
		
		int n = 0;
		try {
			n = service.delComment(cno);
			//System.out.println("댓글삭제 결과 n >>>>"+n);
		} catch (Throwable e) {
			e.printStackTrace();  // 콘솔에만 찍어준다.
		}
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("n", n);
		
		return jsonObj.toString();
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	@RequestMapping(value = "/board/myboard.up") public String
	myboard(HttpServletRequest request) {
		return "board/myboard.tiles"; 
	} */
	
	
	
	// == 로그인 또는 로그아웃을 했을 때 현재 보이던 그 페이지로 그대로 돌아가기 위한 메소드 생성 === //
	public void getCurrentURL(HttpServletRequest request) { // 해당 메소드 호출시 로그인 또는 로그아웃 이전에 활동하던 페이지로 돌아가도록 한다.
		HttpSession session = request.getSession();  // session 객체생성
		session.setAttribute("goBackURL", MyUtil.getCurrentURL(request)); // MyUtil.java 클래스의 getCurrentURL 메소드에서 받아온 request 를 session 에 저장해준다.
	}
	
	
	
}