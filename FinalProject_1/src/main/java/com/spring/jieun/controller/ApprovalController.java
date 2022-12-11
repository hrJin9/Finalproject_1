package com.spring.jieun.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.spring.finalproject.common.FileManager;
import com.spring.finalproject.common.MyUtil;
import com.spring.hyerin.model.EmployeeVO;
import com.spring.jieun.model.ApprovalVO;
import com.spring.jieun.service.InterApprovalService;

@Controller
public class ApprovalController {
	@Autowired
	private InterApprovalService service;
	
	@Autowired // Type 에 따라 알아서 Bean 을 주입해준다 
	private FileManager fileManager; // 이미 빈으로 올라간 클래스
	
//	*** 문서리스트 *** 진행중인 내 문서 
	@RequestMapping(value = "/approval.up") 
	public ModelAndView rl_approval(HttpServletRequest request,HttpServletResponse response, ModelAndView mav) {
		
		List<ApprovalVO> approvalList = null ; // 글쓴게 없을수도 있으므로 
		
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO)session.getAttribute("loginuser");
		String employee_no = loginuser.getEmployee_no();
		//System.out.println("employee_no => "+employee_no);
		
		String searchStartday = request.getParameter("searchStartday");
		String searchEndday = request.getParameter("searchEndday");
		
		String bookmark = request.getParameter("bookmark");
		if(bookmark == null || "0".equals(bookmark)) {
			bookmark = "";
		}
//		System.out.println("bookmark => "+bookmark);
		
		if(searchStartday == null) {
			searchStartday = "";
		}
		if(searchEndday == null) {
			searchEndday = "";
		}
		
		
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");

		if(searchType == null || (!"subject".equals(searchType) && !"name".equals(searchType)) ) {
			// 장난처울경우 
			searchType="";
		}
		if(searchWord == null || "".equals(searchWord) || searchWord.trim().isEmpty() ) {
			searchWord = "";
		}
		if(searchWord != null) {
			searchWord = searchWord.trim();
			// "         " => ""
		}
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("employee_no", employee_no);
		paraMap.put("searchStartday", "");
		paraMap.put("searchEndday", "");
		
		paraMap.put("final_signyn", "0");
		paraMap.put("ap_type", "");
		paraMap.put("bookmark", "");
		
		//paraMap.put("searchType", searchType);
		//paraMap.put("searchWord", searchWord.trim());
		
		
		// 먼저 총게시물 건수(totalCount) 를 고해와야 한다.
		// 총 게시물 건수(totalCount)는 검색조건이 있을때와 없을때로 나뉘어진다. 
		int totalCount = 0;        // 총 게시물 건수
        int sizePerPage = 10;      // 한 페이지당 보여줄 게시물 건수 
        int currentShowPageNo = 0; // 현재 보여주는 페이지번호로서, 초기치로는 1페이지로 설정함.
        int totalPage = 0;         // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)
      
        int startRno = 0; // 시작 행번호
        int endRno = 0;   // 끝 행번호
        
        // 총게시물 건수(totalCount)
        totalCount = service.getMyApprovalTotalCount(paraMap);
//        System.out.println("~~~ totalCount:"+totalCount);

        totalPage = (int)Math.ceil( (double)totalCount/sizePerPage);
        
        if(str_currentShowPageNo == null) { 
        	// 게시판에 보여지는 초기화면 
        	currentShowPageNo = 1;
        }
        else {
        	try {
        		currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
        		if( currentShowPageNo < 1 || currentShowPageNo > totalPage) {
        			currentShowPageNo = 1;
        		}
        	}catch(NumberFormatException e) {
        		currentShowPageNo = 1;
        	}
        }
        
        // **** 가져올 게시글의 범위를 구한다.(공식임!!!) **** 
        startRno = ((currentShowPageNo - 1) * sizePerPage) + 1;
        endRno = startRno + sizePerPage - 1;
        
        paraMap.put("startRno", String.valueOf(startRno));
        paraMap.put("endRno", String.valueOf(endRno));
        
        approvalList = service.approvalListSearchWithPaging(paraMap);
        // 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한것)
        
        
        // 아래의 것은 검색대상 컬럼과 검색어를 뷰단 페이지에서 유지시키기 위한 것임 
 		if( !"".equals(searchWord) && !"".equals(searchType)  ) {
 			mav.addObject("paraMap",paraMap);
 		}
     	
 		
 		// === 페이지바 만들기 === //
 		int blockSize = 10;
 		// blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 개수이다.
 		
 		int loop = 1;

 		int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
 	      
 		
 		String pageBar = "<nav><ul class='pagination mg-pagebar'style='align-items: center;'>";
 		String url ="approval.up";
 		
 		// === [맨처음][이전] 만들기 === //
 		if(pageNo != 1) {
 			pageBar += "<li class='page-item'><a class='page-link'  aria-label='처음' href='"+url+"?searchStartday="+searchStartday+"&searchEndday="+searchEndday+"&currentShowPageNo=1'><span aria-hidden='true'>&laquo;</span></a></li>";
 			pageBar += "<li class='page-item'><a class='page-link'  aria-label='이전' href='"+url+"?searchStartday="+searchStartday+"&searchEndday="+searchEndday+"&currentShowPageNo="+(pageNo-1)+"'><span aria-hidden='true'>&lt;</span></a></li>";
 		}
 		
 		 
 		while( !(loop > blockSize || pageNo > totalPage) ) {
 			if(pageNo==currentShowPageNo) {
 				pageBar += "<li class='page-item' style='cursor:not-allowed; font-weight: 700; '><a class='page-link' style='background-color: #4285f4; color: white !important;'><span aria-hidden='true'>"+pageNo+"</span></a></li>";
 			}
 			else {
 				pageBar += "<li class='page-item'><a class='page-link' href='"+url+"?searchStartday="+searchStartday+"&searchEndday="+searchEndday+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
 			}
 			loop ++;
 			pageNo ++;
 		}// end of while()
 		
 		// === [다음][마지막] 만들기 === //
 		if(pageNo <= totalPage) {
 			pageBar += "<li class='page-item'><a class='page-link' aria-label='다음'href='"+url+"?searchStartday="+searchStartday+"&searchEndday="+searchEndday+"&currentShowPageNo="+pageNo+"'><span aria-hidden='true'>&gt;</span></a></li>";
 			pageBar += "<li class='page-item'><a class='page-link' aria-label='마지막' href='"+url+"?searchStartday="+searchStartday+"&searchEndday="+searchEndday+"&currentShowPageNo="+totalPage+"'><span aria-hidden='true'>&raquo;</span></a></li>";
 		}
 		
 		pageBar += "</ul></nav>";
 		mav.addObject("pageBar",pageBar);

 		//String gobackURL = MyUtil.getCurrentURL(request);
 		

 		//mav.addObject("gobackURL",gobackURL.replaceAll("&", " ")); // 웹 url에서 공백은 안쓰이기때문에 안쓰이는 공백으로 바꿔준다 
// 		System.out.println("~~~ 확인용 gobackURL : " + gobackURL);
 		
		// ===  페이징 처리를 한 검색어가 있는 전체 글목록 보여주기 끝 === //
		mav.addObject("approvalList",approvalList);
		mav.addObject("totalCount",totalCount);
		mav.setViewName("approval/approval.tiles");
		//  /WEB-INF/views/tiles1/board/list.jsp  파일을 생성한다.
		return mav;
	}	
//	*** 완료된 내문서 
	@RequestMapping(value = "/approval/processed.up") 
	public ModelAndView rl_approval_processed(HttpServletRequest request,HttpServletResponse response,ModelAndView mav) {
		
		List<ApprovalVO> approvalList = null ; // 글쓴게 없을수도 있으므로 
		
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO)session.getAttribute("loginuser");
		String employee_no = loginuser.getEmployee_no();
		//System.out.println("employee_no => "+employee_no);
		
		String bookmark = request.getParameter("bookmark");
		if(bookmark == null || "0".equals(bookmark)) {
			bookmark = "";
		}
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		if(searchType == null || (!"subject".equals(searchType) && !"name".equals(searchType)) ) {
			// 장난처울경우 
			searchType="";
		}
		if(searchWord == null || "".equals(searchWord) || searchWord.trim().isEmpty() ) {
			searchWord = "";
		}
		if(searchWord != null) {
			searchWord = searchWord.trim();
			// "         " => ""
		}
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("employee_no", employee_no);
		
		paraMap.put("searchStartday", "");
		paraMap.put("searchEndday", "");
		
		paraMap.put("final_signyn", "");
		paraMap.put("ap_type", "");
		paraMap.put("bookmark", "");
		
		//paraMap.put("searchType", searchType);
		//paraMap.put("searchWord", searchWord.trim());
		
		
		// 먼저 총게시물 건수(totalCount) 를 고해와야 한다.
		// 총 게시물 건수(totalCount)는 검색조건이 있을때와 없을때로 나뉘어진다. 
		int totalCount = 0;        // 총 게시물 건수
		int sizePerPage = 10;      // 한 페이지당 보여줄 게시물 건수 
		int currentShowPageNo = 0; // 현재 보여주는 페이지번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0;         // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)
		
		int startRno = 0; // 시작 행번호
		int endRno = 0;   // 끝 행번호
		
        // 총게시물 건수(totalCount)
		
        totalCount = service.getMyApprovalTotalCount(paraMap);
//		totalCount = service.getRequestedApprovalTotalCount(paraMap);
		System.out.println("~~~ totalCount:"+totalCount);
		
		totalPage = (int)Math.ceil( (double)totalCount/sizePerPage);
		
		if(str_currentShowPageNo == null) { 
			// 게시판에 보여지는 초기화면 
			currentShowPageNo = 1;
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				if( currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
			}catch(NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		// **** 가져올 게시글의 범위를 구한다.(공식임!!!) **** 
		startRno = ((currentShowPageNo - 1) * sizePerPage) + 1;
		endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		approvalList = service.approvalListSearchWithPaging(paraMap);
        // 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한것)
//		approvalList = service.requestedapprovalListPaging(paraMap);
		// 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한것)
		
		
		// 아래의 것은 검색대상 컬럼과 검색어를 뷰단 페이지에서 유지시키기 위한 것임 
		if( !"".equals(searchWord) && !"".equals(searchType)  ) {
			mav.addObject("paraMap",paraMap);
		}
		
		
		// === 페이지바 만들기 === //
		int blockSize = 10;
		// blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 개수이다.
		
		int loop = 1;
		
		int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
		
		
		String pageBar = "<ul style='list-style:none; '>";
		String url ="approval.up";
		
		// === [맨처음][이전] 만들기 === //
		if(pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?currentShowPageNo=1'>[맨처음]</a></li>";
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
		}
		
		
		while( !(loop > blockSize || pageNo > totalPage) ) {
			if(pageNo==currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt; border:solid 1px gray; color: red; padding: 2px 4px; '>"+pageNo+"</li>";
			}
			else {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
			}
			loop ++;
			pageNo ++;
		}// end of while()
		
		// === [다음][마지막] 만들기 === //
		if(pageNo <= totalPage) {
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+pageNo+"'>[다음]</a></li>";
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+totalPage+"'>[마지막]</a></li>";
		}
		
		pageBar += "</ul>";
		mav.addObject("pageBar",pageBar);
		
		//String gobackURL = MyUtil.getCurrentURL(request);
		
		
		//mav.addObject("gobackURL",gobackURL.replaceAll("&", " ")); // 웹 url에서 공백은 안쓰이기때문에 안쓰이는 공백으로 바꿔준다 
// 		System.out.println("~~~ 확인용 gobackURL : " + gobackURL);
		
		// ===  페이징 처리를 한 검색어가 있는 전체 글목록 보여주기 끝 === //
		
		// 내문서 진행중 갯수 가져오기 
		paraMap.put("final_signyn", "0");
		int pocessingCnt = service.getMyApprovalTotalCount(paraMap);
		
		mav.addObject("pocessingCnt",pocessingCnt);
		mav.addObject("approvalList",approvalList);
		mav.addObject("totalCount",totalCount);
		mav.setViewName("approval/approval_processed.tiles");
		return mav;
	}
//	*** 문서리스트 필터 ajax ***
	@ResponseBody
	@RequestMapping(value = "/approval/apList.up", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8") // 오로지 GET방식만 허락하는 것임.
	public String approval_myview(HttpServletRequest request,HttpServletResponse response) {
		List<ApprovalVO> approvalList = null ; // 글쓴게 없을수도 있으므로
		
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO)session.getAttribute("loginuser");
		String employee_no = loginuser.getEmployee_no();
		
		String searchStartday = request.getParameter("searchStartday");
//		System.out.println("searchStartday => "+searchStartday);
		String searchEndday = request.getParameter("searchEndday");
//		System.out.println("searchEndday => "+searchEndday);
		String final_signyn = request.getParameter("signyn");
		String ap_type = request.getParameter("ap_type");
//		System.out.println("ap_type => "+ap_type);
		String bookmark = request.getParameter("bookmark");
//		System.out.println("bookmark => "+bookmark);
		String searchType = request.getParameter("searchType");
//		System.out.println("searchType => "+searchType);
		String searchWord = request.getParameter("searchWord");
//		System.out.println("searchWord => "+searchWord); 
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		if(final_signyn == null || "전체".equals(final_signyn)) {
			final_signyn = "";
		}
		if(ap_type == null || "전체".equals(ap_type) ) {
			ap_type = "";
		}
		if(bookmark == null || "0".equals(bookmark)) {
			bookmark = "";
		}
		if(searchType == null ) {
			searchType = "";
		}
		if(searchWord == null ) {
			searchWord = "";
		}
//		
//		switch (final_signyn) {
//		case "진행":
//			final_signyn = "0";
//			break;
//		case "승인":
//			final_signyn = "1";
//			break;
//		case "반려":
//			final_signyn = "2";
//			break;
//		case "취소":
//			final_signyn = "3";
//			break;
//		}
		
//		System.out.println("final_signyn => "+final_signyn);
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("employee_no", employee_no);
		paraMap.put("searchStartday", searchStartday);
		paraMap.put("searchEndday", searchEndday);
		paraMap.put("final_signyn", final_signyn);
		paraMap.put("ap_type", ap_type);
		paraMap.put("bookmark", bookmark);
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);
		
		// 먼저 총게시물 건수(totalCount) 를 고해와야 한다.
		// 총 게시물 건수(totalCount)는 검색조건이 있을때와 없을때로 나뉘어진다. 
		int totalCount = 0;        // 총 게시물 건수
        int sizePerPage = 10;      // 한 페이지당 보여줄 게시물 건수 
        int currentShowPageNo = 0; // 현재 보여주는 페이지번호로서, 초기치로는 1페이지로 설정함.
        int totalPage = 0;         // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)
      
        int startRno = 0; // 시작 행번호
        int endRno = 0;   // 끝 행번호
        
        // 총게시물 건수(totalCount)
        totalCount = service.getMyApprovalTotalCount(paraMap);
        System.out.println("~~~ totalCount:"+totalCount);

        totalPage = (int)Math.ceil( (double)totalCount/sizePerPage);
        
        if(str_currentShowPageNo == null) { 
        	// 게시판에 보여지는 초기화면 
        	currentShowPageNo = 1;
        }
        else {
        	try {
        		currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
        		if( currentShowPageNo < 1 || currentShowPageNo > totalPage) {
        			currentShowPageNo = 1;
        		}
        	}catch(NumberFormatException e) {
        		currentShowPageNo = 1;
        	}
        }
        
        // **** 가져올 게시글의 범위를 구한다.(공식임!!!) **** 
        startRno = ((currentShowPageNo - 1) * sizePerPage) + 1;
        endRno = startRno + sizePerPage - 1;
        
        paraMap.put("startRno", String.valueOf(startRno));
        paraMap.put("endRno", String.valueOf(endRno));
        
        approvalList = service.approvalListSearchWithPaging(paraMap);
        // 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한것)
        
     	
 		
 		// === 페이지바 만들기 === //
 		int blockSize = 10;
 		// blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 개수이다.
 		
 		int loop = 1;

 		int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
 	      
 		
 		String pageBar = "<ul style='list-style:none; '>";
 		String url ="approval.up";
 		
 		// === [맨처음][이전] 만들기 === //
 		if(pageNo != 1) {
 			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?searchStartday="+searchStartday+"&searchEndday="+searchEndday+"&currentShowPageNo=1'>[맨처음]</a></li>";
 			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?searchStartday="+searchStartday+"&searchEndday="+searchEndday+"&currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
 		}
 		
 		 
 		while( !(loop > blockSize || pageNo > totalPage) ) {
 			if(pageNo==currentShowPageNo) {
 				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt; border:solid 1px gray; color: red; padding: 2px 4px; '>"+pageNo+"</li>";
 			}
 			else {
 				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='"+url+"?searchStartday="+searchStartday+"&searchEndday="+searchEndday+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
 			}
 			loop ++;
 			pageNo ++;
 		}// end of while()
 		
 		// === [다음][마지막] 만들기 === //
 		if(pageNo <= totalPage) {
 			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?searchStartday="+searchStartday+"&searchEndday="+searchEndday+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>";
 			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?searchStartday="+searchStartday+"&searchEndday="+searchEndday+"&currentShowPageNo="+totalPage+"'>[마지막]</a></li>";
 		}
 		
 		pageBar += "</ul>";
		
		JSONArray jsonarr = new JSONArray(); // []
		if(approvalList != null) {
			int i = 0; 
			for(ApprovalVO aprvo: approvalList) {
				JSONObject jsonobj = new JSONObject();
				jsonobj.put("ano", aprvo.getAno());
				jsonobj.put("fk_empno", aprvo.getFk_empno());
				jsonobj.put("ap_type", aprvo.getAp_type());
				jsonobj.put("title", aprvo.getTitle());
				jsonobj.put("final_signyn", aprvo.getFinal_signyn());
				jsonobj.put("ap_systemFileName", aprvo.getAp_systemFileName());
				jsonobj.put("feedbackcnt", aprvo.getFeedbackcnt());
				jsonobj.put("writeday", aprvo.getWriteday());
				jsonobj.put("bookmark", aprvo.getBookmark());
				jsonobj.put("name_kr", aprvo.getName_kr());
				
				if( i==0 ) {
					jsonobj.put("pageBar", pageBar);
				}
				else {
					jsonobj.put("pageBar", "0");
				}
				jsonarr.put(jsonobj);
				
				i++;
			}
		}
		return jsonarr.toString(); // "[]" 또는 "[{},{},{}]"
		
	}
	
//	*** 북마크 추가 업데이트 ***  
	@ResponseBody
	@RequestMapping(value = "/approval/addscrap.up", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8") // 오로지 GET방식만 허락하는 것임.
	public String approval_addscrap(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO)session.getAttribute("loginuser");
		String employee_no = loginuser.getEmployee_no();
		
		String ano = request.getParameter("ano");
		String yn = request.getParameter("yn");
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("ano", ano);
		paraMap.put("employee_no", employee_no);
		paraMap.put("yn", yn);
		int result = service.updateaddbookmark(paraMap);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result);
		return jsonobj.toString(); // "[]" 또는 "[{},{},{}]"
		
	}
	
	
	
	// 문서작성하기 페이지 
	@RequestMapping(value = "/approval/writing.up")
	public ModelAndView rl_approval_writing(HttpServletRequest request,HttpServletResponse response, ModelAndView mav) {
		mav.setViewName("approval/approval_writing.tiles");
		return mav;
	}
	
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	/**
	 * 파일이름 추출하기
	 * 1. 업로드한 파일의 확장자명 알아내기
	 * 2. (오늘날짜)_currentTimeMillis + 확장자 방식으로 파일명 생성
	 * 3. 파일 경로에 등록
	 * 4. 주소값 리턴 (https://localhost:8080/bombom/resources/upload/파일)
	 */
	
	@ResponseBody
	@RequestMapping(value = "/approval/image_upload.up", method = RequestMethod.POST, produces="text/plain;charset=UTF-8") // 오로지 GET방식만 허락하는 것임.
	public String imageUpload(@RequestParam("image")MultipartFile multipartFile,
							  @RequestParam String uri, HttpServletRequest request) {

		if(multipartFile.isEmpty()) {
			logger.warn("user_write image upload detected, but there's no file.");
			return "not found";
		}

		String directory = request.getSession().getServletContext().getRealPath("resources/upload/approval/");

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

		return url + request.getContextPath() + "/resources/upload/approval/" + newFileName;
	}
	
	@ResponseBody
	@RequestMapping(value = "/approval/view.up", method = RequestMethod.GET, produces="text/plain;charset=UTF-8") // 오로지 GET방식만 허락하는 것임.
	public String approval_view(HttpServletRequest request,HttpServletResponse response) {
		
		String ano = request.getParameter("ano");
		//System.out.println("anoval => "+ano);
		String ap_type = request.getParameter("ap_type");
		//System.out.println("ap_type => "+ap_type);
		
		ApprovalVO aprvo = null; 
		// 결재문서타입이 연차와 업무문서일경우 해당테이블과 결재테이블에서 정보를 가져와야한다. 
		if("연차".equals(ap_type)) {
			aprvo = service.getdayoffInfo(ano);
		}
		else if("업무".equals(ap_type)) {
			aprvo = service.getworkdocvoInfo(ano);
		}
		else {
			aprvo = service.getapprovalInfo(ano);
		}
		
		// 연차 or 업무, 결재 상세, 결재라인, 참조자  
		//Map<String,String> paraMap = new HashMap<>();
		//paraMap.put("ano", ano);
		// 결재문서타입이 연차와 업무문서일경우 해당테이블과 결재테이블에서 정보를 가져와야한다. 
		// 하나의 결재문서에 대한 정보 가져오기 
		//List<ApprovalVO> appvolist = service.getapprovalOneInfo(paraMap);
		
		JSONObject jsonobj = new JSONObject();
		if(aprvo != null) {
			jsonobj.put("ano", aprvo.getAno());
			jsonobj.put("fk_empno", aprvo.getFk_empno());
			jsonobj.put("ap_type", aprvo.getAp_type());
			jsonobj.put("title", aprvo.getTitle());
			jsonobj.put("content", aprvo.getContent());
			jsonobj.put("final_signyn", aprvo.getFinal_signyn());
			jsonobj.put("ap_systemFileName", aprvo.getAp_systemFileName());
			jsonobj.put("ap_originFileName", aprvo.getAp_originFileName());
			jsonobj.put("filesize", aprvo.getFilesize());
			jsonobj.put("preserveperiod", aprvo.getPreserveperiod());
			jsonobj.put("writeday", aprvo.getWriteday());
			jsonobj.put("modifyday", aprvo.getModifyday());
			jsonobj.put("bookmark", aprvo.getBookmark());
			jsonobj.put("fk_ano_refer", aprvo.getFk_ano_refer());
			jsonobj.put("name_kr", aprvo.getName_kr());
			if("연차".equals(ap_type)) {
				jsonobj.put("dono", aprvo.getDono());
				jsonobj.put("docnt", aprvo.getDocnt());
				jsonobj.put("docatgo", aprvo.getDocatgo());
				jsonobj.put("startdate", aprvo.getStartdate());
				jsonobj.put("enddate", aprvo.getEnddate());
			}
			else if("업무".equals(ap_type)) {
				jsonobj.put("wdno", aprvo.getWdno());
				jsonobj.put("executedate", aprvo.getExecutedate());
				jsonobj.put("deptname", aprvo.getDeptname());
			}
		}
		else {// 없는 문서번호 
			
		}
		return jsonobj.toString(); // "[]" 또는 "[{},{},{}]"
	}
	@ResponseBody
	@RequestMapping(value = "/approval/view_sign.up", method = RequestMethod.GET, produces="text/plain;charset=UTF-8") // 오로지 GET방식만 허락하는 것임.
	public String approval_viewline(HttpServletRequest request,HttpServletResponse response) {
		
		String ano = request.getParameter("ano");
		System.out.println("anoval => "+ano);
		
		// 한문서에 대해 결재라인리스트 가져오기 
		List<ApprovalVO> approvalList = service.getapprovalLine(ano);
		
		JSONArray jsonarr = new JSONArray(); // []
		if(approvalList != null) {
			int fbcnt = 0; 
			int i = 0; 
			for(ApprovalVO aprvo: approvalList) {
				JSONObject jsonobj = new JSONObject();
				jsonobj.put("ano", aprvo.getFk_ano());
				jsonobj.put("sign_empno", aprvo.getFk_sign_empno());
				jsonobj.put("signstep", aprvo.getSignstep());
				jsonobj.put("signyn",aprvo.getSignyn());
				jsonobj.put("signdate", aprvo.getSigndate());

				if(aprvo.getFeedback() != null)fbcnt++;
				
				jsonobj.put("feedback", aprvo.getFeedback());
				
				if((i+1)!=approvalList.size()) jsonobj.put("fbcnt", 0);
				else jsonobj.put("fbcnt", fbcnt);
				
				jsonobj.put("name_kr", aprvo.getName_kr());
				jsonobj.put("signemp_deptname", aprvo.getSignemp_deptname());
				jsonobj.put("signemp_position", aprvo.getSignemp_position());
				
				jsonarr.put(jsonobj);
				i++;
			}
		}
		return jsonarr.toString(); // "[]" 또는 "[{},{},{}]"
		
	}
	
	
	
	
	@RequestMapping(value = "/approval/mycancel.up")
	public ModelAndView approval_mycancel(HttpServletRequest request,ModelAndView mav) {
		String ano = request.getParameter("ano");
		System.out.println("ano=>"+ano);
		int n = service.updatecancelmyapproval(ano);
		
		String message = "";
		String loc ="";
		
		message = n==1?"결재신청이 취소 되었습니다!":"결재신청 취소를 실패했습니다."; 
		
		loc = request.getContextPath()+"/approval.up";
		mav.addObject("message", message);
		mav.addObject("loc", loc);
		mav.setViewName("msg");  
		return mav;
	}
	@RequestMapping(value = "/approval/memberList.up")
	public String approval_memberList(HttpServletRequest request) {
		return "tiles/approval/approval_memberList";
	}

	
	// *** 내 결재라인까지 온 문서 리스트 ***   
	@RequestMapping(value = "/approval/requested.up")
	public ModelAndView rl_approval_requested(HttpServletRequest request,HttpServletResponse response,ModelAndView mav) {

		List<ApprovalVO> approvalList = null ; // 글쓴게 없을수도 있으므로 
		
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO)session.getAttribute("loginuser");
		String employee_no = loginuser.getEmployee_no();
		//System.out.println("employee_no => "+employee_no);
		
		String bookmark = request.getParameter("bookmark");
		if(bookmark == null || "0".equals(bookmark)) {
			bookmark = "";
		}
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");

		if(searchType == null || (!"subject".equals(searchType) && !"name".equals(searchType)) ) {
			// 장난처울경우 
			searchType="";
		}
		if(searchWord == null || "".equals(searchWord) || searchWord.trim().isEmpty() ) {
			searchWord = "";
		}
		if(searchWord != null) {
			searchWord = searchWord.trim();
			// "         " => ""
		}
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("employee_no", employee_no);
		
		paraMap.put("searchStartday", "");
		paraMap.put("searchEndday", "");
		
		paraMap.put("final_signyn", "");
		paraMap.put("ap_type", "");
		paraMap.put("bookmark", "");
		
		//paraMap.put("searchType", searchType);
		//paraMap.put("searchWord", searchWord.trim());
		
		
		// 먼저 총게시물 건수(totalCount) 를 고해와야 한다.
		// 총 게시물 건수(totalCount)는 검색조건이 있을때와 없을때로 나뉘어진다. 
		int totalCount = 0;        // 총 게시물 건수
        int sizePerPage = 10;      // 한 페이지당 보여줄 게시물 건수 
        int currentShowPageNo = 0; // 현재 보여주는 페이지번호로서, 초기치로는 1페이지로 설정함.
        int totalPage = 0;         // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)
      
        int startRno = 0; // 시작 행번호
        int endRno = 0;   // 끝 행번호
        
        // 총게시물 건수(totalCount)
        totalCount = service.requestedtodoTotalCount(paraMap);

        totalPage = (int)Math.ceil( (double)totalCount/sizePerPage);
        
        if(str_currentShowPageNo == null) { 
        	// 게시판에 보여지는 초기화면 
        	currentShowPageNo = 1;
        }
        else {
        	try {
        		currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
        		if( currentShowPageNo < 1 || currentShowPageNo > totalPage) {
        			currentShowPageNo = 1;
        		}
        	}catch(NumberFormatException e) {
        		currentShowPageNo = 1;
        	}
        }
        
        // **** 가져올 게시글의 범위를 구한다.(공식임!!!) **** 
        startRno = ((currentShowPageNo - 1) * sizePerPage) + 1;
        endRno = startRno + sizePerPage - 1;
        
        paraMap.put("startRno", String.valueOf(startRno));
        paraMap.put("endRno", String.valueOf(endRno));
        
        approvalList = service.requestedtodoListPaging(paraMap);
        System.out.println("~~~ approvalList.size():"+approvalList.size());
        // 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한것)
        
        
        // 아래의 것은 검색대상 컬럼과 검색어를 뷰단 페이지에서 유지시키기 위한 것임 
 		if( !"".equals(searchWord) && !"".equals(searchType)  ) {
 			mav.addObject("paraMap",paraMap);
 		}
     	
 		
 		// === 페이지바 만들기 === //
 		int blockSize = 10;
 		// blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 개수이다.
 		
 		int loop = 1;

 		int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
 	      
 		
 		String pageBar = "<ul style='list-style:none; '>";
 		String url ="approval.up";
 		
 		// === [맨처음][이전] 만들기 === //
 		if(pageNo != 1) {
 			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?currentShowPageNo=1'>[맨처음]</a></li>";
 			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
 		}
 		
 		 
 		while( !(loop > blockSize || pageNo > totalPage) ) {
 			if(pageNo==currentShowPageNo) {
 				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt; border:solid 1px gray; color: red; padding: 2px 4px; '>"+pageNo+"</li>";
 			}
 			else {
 				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
 			}
 			loop ++;
 			pageNo ++;
 		}// end of while()
 		
 		// === [다음][마지막] 만들기 === //
 		if(pageNo <= totalPage) {
 			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+pageNo+"'>[다음]</a></li>";
 			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+totalPage+"'>[마지막]</a></li>";
 		}
 		
 		pageBar += "</ul>";
 		mav.addObject("pageBar",pageBar);

 		//String gobackURL = MyUtil.getCurrentURL(request);
 		

 		//mav.addObject("gobackURL",gobackURL.replaceAll("&", " ")); // 웹 url에서 공백은 안쓰이기때문에 안쓰이는 공백으로 바꿔준다 
// 		System.out.println("~~~ 확인용 gobackURL : " + gobackURL);
 		
		// ===  페이징 처리를 한 검색어가 있는 전체 글목록 보여주기 끝 === //
		mav.addObject("approvalList",approvalList);
		mav.setViewName("approval/approval_requested.tiles");
		return mav;
	}
	
	
	
	@RequestMapping(value = "/approval/requested/processing.up")
	public ModelAndView rl_approval_processing(HttpServletRequest request,HttpServletResponse response,ModelAndView mav) {
		
		List<ApprovalVO> approvalList = null ; // 글쓴게 없을수도 있으므로 
		
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO)session.getAttribute("loginuser");
		String employee_no = loginuser.getEmployee_no();
		//System.out.println("employee_no => "+employee_no);
		
		String bookmark = request.getParameter("bookmark");
		if(bookmark == null || "0".equals(bookmark)) {
			bookmark = "";
		}
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		if(searchType == null || (!"subject".equals(searchType) && !"name".equals(searchType)) ) {
			// 장난처울경우 
			searchType="";
		}
		if(searchWord == null || "".equals(searchWord) || searchWord.trim().isEmpty() ) {
			searchWord = "";
		}
		if(searchWord != null) {
			searchWord = searchWord.trim();
			// "         " => ""
		}
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("employee_no", employee_no);
		
		paraMap.put("searchStartday", "");
		paraMap.put("searchEndday", "");
		
		paraMap.put("final_signyn", "0");
		paraMap.put("ap_type", "");
		paraMap.put("bookmark", "");
		
		//paraMap.put("searchType", searchType);
		//paraMap.put("searchWord", searchWord.trim());
		
		
		// 먼저 총게시물 건수(totalCount) 를 고해와야 한다.
		// 총 게시물 건수(totalCount)는 검색조건이 있을때와 없을때로 나뉘어진다. 
		int totalCount = 0;        // 총 게시물 건수
		int sizePerPage = 10;      // 한 페이지당 보여줄 게시물 건수 
		int currentShowPageNo = 0; // 현재 보여주는 페이지번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0;         // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)
		
		int startRno = 0; // 시작 행번호
		int endRno = 0;   // 끝 행번호
		
		// 총게시물 건수(totalCount)
		totalCount = service.getRequestedApprovalTotalCount(paraMap);
		System.out.println("~~~ totalCount:"+totalCount);
		
		totalPage = (int)Math.ceil( (double)totalCount/sizePerPage);
		
		if(str_currentShowPageNo == null) { 
			// 게시판에 보여지는 초기화면 
			currentShowPageNo = 1;
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				if( currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
			}catch(NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		// **** 가져올 게시글의 범위를 구한다.(공식임!!!) **** 
		startRno = ((currentShowPageNo - 1) * sizePerPage) + 1;
		endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		approvalList = service.requestedapprovalListPaging(paraMap);
		// 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한것)
		
		
		// 아래의 것은 검색대상 컬럼과 검색어를 뷰단 페이지에서 유지시키기 위한 것임 
		if( !"".equals(searchWord) && !"".equals(searchType)  ) {
			mav.addObject("paraMap",paraMap);
		}
		
		
		// === 페이지바 만들기 === //
		int blockSize = 10;
		// blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 개수이다.
		
		int loop = 1;
		
		int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
		
		
		String pageBar = "<ul style='list-style:none; '>";
		String url ="approval.up";
		
		// === [맨처음][이전] 만들기 === //
		if(pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?currentShowPageNo=1'>[맨처음]</a></li>";
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
		}
		
		
		while( !(loop > blockSize || pageNo > totalPage) ) {
			if(pageNo==currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt; border:solid 1px gray; color: red; padding: 2px 4px; '>"+pageNo+"</li>";
			}
			else {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
			}
			loop ++;
			pageNo ++;
		}// end of while()
		
		// === [다음][마지막] 만들기 === //
		if(pageNo <= totalPage) {
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+pageNo+"'>[다음]</a></li>";
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+totalPage+"'>[마지막]</a></li>";
		}
		
		pageBar += "</ul>";
		mav.addObject("pageBar",pageBar);
		
		//String gobackURL = MyUtil.getCurrentURL(request);
		
		
		//mav.addObject("gobackURL",gobackURL.replaceAll("&", " ")); // 웹 url에서 공백은 안쓰이기때문에 안쓰이는 공백으로 바꿔준다 
// 		System.out.println("~~~ 확인용 gobackURL : " + gobackURL);
		
		// ===  페이징 처리를 한 검색어가 있는 전체 글목록 보여주기 끝 === //
		mav.addObject("approvalList",approvalList);
		mav.setViewName("approval/approval_requested_processing.tiles");
		return mav;
	}
	@RequestMapping(value = "/approval/requested/will.up")
	public ModelAndView rl_approval_will(HttpServletRequest request,HttpServletResponse response,ModelAndView mav) {
		
		List<ApprovalVO> approvalList = null ; // 글쓴게 없을수도 있으므로 
		
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO)session.getAttribute("loginuser");
		String employee_no = loginuser.getEmployee_no();
		//System.out.println("employee_no => "+employee_no);
		
		String bookmark = request.getParameter("bookmark");
		if(bookmark == null || "0".equals(bookmark)) {
			bookmark = "";
		}
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		if(searchType == null || (!"subject".equals(searchType) && !"name".equals(searchType)) ) {
			// 장난처울경우 
			searchType="";
		}
		if(searchWord == null || "".equals(searchWord) || searchWord.trim().isEmpty() ) {
			searchWord = "";
		}
		if(searchWord != null) {
			searchWord = searchWord.trim();
			// "         " => ""
		}
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("employee_no", employee_no);
		
		paraMap.put("searchStartday", "");
		paraMap.put("searchEndday", "");
		
		paraMap.put("final_signyn", "0");
		paraMap.put("ap_type", "");
		paraMap.put("bookmark", "");
		
		//paraMap.put("searchType", searchType);
		//paraMap.put("searchWord", searchWord.trim());
		
		
		// 먼저 총게시물 건수(totalCount) 를 고해와야 한다.
		// 총 게시물 건수(totalCount)는 검색조건이 있을때와 없을때로 나뉘어진다. 
		int totalCount = 0;        // 총 게시물 건수
		int sizePerPage = 10;      // 한 페이지당 보여줄 게시물 건수 
		int currentShowPageNo = 0; // 현재 보여주는 페이지번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0;         // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)
		
		int startRno = 0; // 시작 행번호
		int endRno = 0;   // 끝 행번호
		
		// 총게시물 건수(totalCount)
		totalCount = service.getRequestedApprovalTotalCount(paraMap);
		System.out.println("~~~ totalCount:"+totalCount);
		
		totalPage = (int)Math.ceil( (double)totalCount/sizePerPage);
		
		if(str_currentShowPageNo == null) { 
			// 게시판에 보여지는 초기화면 
			currentShowPageNo = 1;
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				if( currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
			}catch(NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		// **** 가져올 게시글의 범위를 구한다.(공식임!!!) **** 
		startRno = ((currentShowPageNo - 1) * sizePerPage) + 1;
		endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		approvalList = service.requestedapprovalListPaging(paraMap);
		// 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한것)
		
		
		// 아래의 것은 검색대상 컬럼과 검색어를 뷰단 페이지에서 유지시키기 위한 것임 
		if( !"".equals(searchWord) && !"".equals(searchType)  ) {
			mav.addObject("paraMap",paraMap);
		}
		
		
		// === 페이지바 만들기 === //
		int blockSize = 10;
		// blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 개수이다.
		
		int loop = 1;
		
		int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
		
		
		String pageBar = "<ul style='list-style:none; '>";
		String url ="approval.up";
		
		// === [맨처음][이전] 만들기 === //
		if(pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?currentShowPageNo=1'>[맨처음]</a></li>";
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
		}
		
		
		while( !(loop > blockSize || pageNo > totalPage) ) {
			if(pageNo==currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt; border:solid 1px gray; color: red; padding: 2px 4px; '>"+pageNo+"</li>";
			}
			else {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
			}
			loop ++;
			pageNo ++;
		}// end of while()
		
		// === [다음][마지막] 만들기 === //
		if(pageNo <= totalPage) {
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+pageNo+"'>[다음]</a></li>";
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+totalPage+"'>[마지막]</a></li>";
		}
		
		pageBar += "</ul>";
		mav.addObject("pageBar",pageBar);
		
		//String gobackURL = MyUtil.getCurrentURL(request);
		
		
		//mav.addObject("gobackURL",gobackURL.replaceAll("&", " ")); // 웹 url에서 공백은 안쓰이기때문에 안쓰이는 공백으로 바꿔준다 
// 		System.out.println("~~~ 확인용 gobackURL : " + gobackURL);
		
		// ===  페이징 처리를 한 검색어가 있는 전체 글목록 보여주기 끝 === //
		mav.addObject("approvalList",approvalList);
		mav.setViewName("approval/approval_requested_will.tiles");
		return mav;
	}
	
	@RequestMapping(value = "/approval/requested/refered.up")
	public ModelAndView rl_approval_refered(HttpServletRequest request,HttpServletResponse response,ModelAndView mav) {
		
		List<ApprovalVO> approvalList = null ; // 글쓴게 없을수도 있으므로 
		
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO)session.getAttribute("loginuser");
		String employee_no = loginuser.getEmployee_no();
		//System.out.println("employee_no => "+employee_no);
		
		String bookmark = request.getParameter("bookmark");
		if(bookmark == null || "0".equals(bookmark)) {
			bookmark = "";
		}
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		if(searchType == null || (!"subject".equals(searchType) && !"name".equals(searchType)) ) {
			// 장난처울경우 
			searchType="";
		}
		if(searchWord == null || "".equals(searchWord) || searchWord.trim().isEmpty() ) {
			searchWord = "";
		}
		if(searchWord != null) {
			searchWord = searchWord.trim();
			// "         " => ""
		}
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("employee_no", employee_no);
		
		paraMap.put("searchStartday", "");
		paraMap.put("searchEndday", "");
		
		paraMap.put("final_signyn", "");
		paraMap.put("ap_type", "");
		paraMap.put("bookmark", "");
		
		//paraMap.put("searchType", searchType);
		//paraMap.put("searchWord", searchWord.trim());
		
		
		// 먼저 총게시물 건수(totalCount) 를 고해와야 한다.
		// 총 게시물 건수(totalCount)는 검색조건이 있을때와 없을때로 나뉘어진다. 
		int totalCount = 0;        // 총 게시물 건수
		int sizePerPage = 10;      // 한 페이지당 보여줄 게시물 건수 
		int currentShowPageNo = 0; // 현재 보여주는 페이지번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0;         // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)
		
		int startRno = 0; // 시작 행번호
		int endRno = 0;   // 끝 행번호
		
		// 총게시물 건수(totalCount)
		totalCount = service.requestedtodoTotalCount(paraMap);
		System.out.println("~~~ totalCount:"+totalCount);
		
		totalPage = (int)Math.ceil( (double)totalCount/sizePerPage);
		
		if(str_currentShowPageNo == null) { 
			// 게시판에 보여지는 초기화면 
			currentShowPageNo = 1;
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				if( currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
			}catch(NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		// **** 가져올 게시글의 범위를 구한다.(공식임!!!) **** 
		startRno = ((currentShowPageNo - 1) * sizePerPage) + 1;
		endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		approvalList = service.requestedtodoListPaging(paraMap);
		// 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한것)
		
		
		// 아래의 것은 검색대상 컬럼과 검색어를 뷰단 페이지에서 유지시키기 위한 것임 
		if( !"".equals(searchWord) && !"".equals(searchType)  ) {
			mav.addObject("paraMap",paraMap);
		}
		
		
		// === 페이지바 만들기 === //
		int blockSize = 10;
		// blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 개수이다.
		
		int loop = 1;
		
		int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
		
		
		String pageBar = "<ul style='list-style:none; '>";
		String url ="approval.up";
		
		// === [맨처음][이전] 만들기 === //
		if(pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?currentShowPageNo=1'>[맨처음]</a></li>";
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
		}
		
		
		while( !(loop > blockSize || pageNo > totalPage) ) {
			if(pageNo==currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt; border:solid 1px gray; color: red; padding: 2px 4px; '>"+pageNo+"</li>";
			}
			else {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
			}
			loop ++;
			pageNo ++;
		}// end of while()
		
		// === [다음][마지막] 만들기 === //
		if(pageNo <= totalPage) {
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+pageNo+"'>[다음]</a></li>";
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+totalPage+"'>[마지막]</a></li>";
		}
		
		pageBar += "</ul>";
		mav.addObject("pageBar",pageBar);
		
		//String gobackURL = MyUtil.getCurrentURL(request);
		
		
		//mav.addObject("gobackURL",gobackURL.replaceAll("&", " ")); // 웹 url에서 공백은 안쓰이기때문에 안쓰이는 공백으로 바꿔준다 
// 		System.out.println("~~~ 확인용 gobackURL : " + gobackURL);
		
		// ===  페이징 처리를 한 검색어가 있는 전체 글목록 보여주기 끝 === //
		mav.addObject("approvalList",approvalList);
		mav.setViewName("approval/approval_requested_refered.tiles");
		return mav;
	}
	@RequestMapping(value = "/approval/goapprove.up")
	public ModelAndView goapprove(HttpServletRequest request,HttpServletResponse response,ModelAndView mav) {
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO)session.getAttribute("loginuser");
		String employee_no = loginuser.getEmployee_no();
		
		String anostring = request.getParameter("ano");
		String[] anoarr = anostring.split(",");
		int n = 0;
 	 	for(String ano:anoarr) {
 	 		System.out.println("컨트롤러 ano =>"+ano);
 	 		Map<String,String> paraMap = new HashMap<>();
 	 		paraMap.put("ano", ano);
 	 		paraMap.put("employee_no", employee_no);
 	 		n = service.updaterequestedapprove(paraMap); // 결재 승인으로 업댓 
 	 	}
 	 	String message = "";
 	 	message = n==1?"결재승인이 완료되었습니다!":"결재승인을 실패했습니다.";
		String loc ="";
		loc = request.getContextPath()+"/approval/requested.up";
		mav.addObject("message", message);
		mav.addObject("loc", loc);
		mav.setViewName("msg");  
		return mav;
	}
	@RequestMapping(value = "/approval/goreject.up")
	public ModelAndView goreject(HttpServletRequest request,HttpServletResponse response,ModelAndView mav) {
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO)session.getAttribute("loginuser");
		String employee_no = loginuser.getEmployee_no();
		String ano = request.getParameter("ano");
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("ano", ano);
		paraMap.put("employee_no", employee_no);
		
		int n = service.updaterequestedreject(paraMap); // 결재 반려로 업댓 
		String message = "";
		message = n==1?"결재반려가 완료되었습니다!":"결재반려를 실패했습니다.";
		String loc ="";
		loc = request.getContextPath()+"/approval/requested.up";
		mav.addObject("message", message);
		mav.addObject("loc", loc);
		mav.setViewName("msg");  
		return mav;
	}
	

	// 저장한 내 결재라인 가져오기 (Ajax)
	@ResponseBody
	@RequestMapping(value="/approval/loadsavedline.up", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8") 
	public String loadsavedline( HttpServletRequest request) {
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO)session.getAttribute("loginuser");
		String employee_no = loginuser.getEmployee_no();
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("employee_no", employee_no);
		
		List<ApprovalVO> lineList = service.loadsavedline(paraMap);
		JSONArray jsonarr = new JSONArray(); // []
		
		
		
		if(lineList  != null) {
			for(ApprovalVO line: lineList) {
				JSONObject jsonobj = new JSONObject();
				//jsonobj.put("word", word);
				jsonarr.put(jsonobj);
			}
		}
		
		return jsonarr.toString(); // "[]" 또는 "[{},{},{}]"
	}
	
	
	
	// 내 결재라인 저장하기 (Ajax)
	@ResponseBody
	@RequestMapping(value="/approval/getspno.up", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8") 
	public String getspno( HttpServletRequest request, HttpServletResponse response) {
		
		String spno = service.getspno();
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("spno", spno);
		
		return jsonobj.toString(); // "[]" 또는 "[{},{},{}]"
	}
	@ResponseBody
	@RequestMapping(value="/approval/savemyline.up", method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8") 
	public String savemyline( HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO)session.getAttribute("loginuser");
		String employee_no = loginuser.getEmployee_no();
		String signpath_name = request.getParameter("signpath_name");
		String signstep = request.getParameter("signstep");
		String signpath = request.getParameter("signpath");
		String signpath_no = request.getParameter("signpath_no");
		
//		System.out.println("signpath_name => "+signpath_name);
//		System.out.println("signpath => "+signpath); 
//		System.out.println("signstep => "+signstep); 
//		System.out.println("signpath_no => "+signpath_no); 
		
		
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("employee_no", employee_no);
		paraMap.put("signpath_name", signpath_name);
		paraMap.put("signstep", signstep);
		paraMap.put("signpatharr", signpath);
		paraMap.put("signpath_no", signpath_no);
		
		int result = service.savemyline(paraMap);
		
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result);
		
		return jsonobj.toString(); // "[]" 또는 "[{},{},{}]"
	}
	
	// 검색어 입력시 자동글 완성하기 (Ajax)
//	@ResponseBody
//	@RequestMapping(value="/approval/wordSearchShow.up", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8") 
//	public String wordSearchShow( HttpServletRequest request) {
//		
//		String searchType = request.getParameter("searchType");
//		String searchWord = request.getParameter("searchWord");
//		
//		Map<String,String> paraMap = new HashMap<>();
//		paraMap.put("searchType", searchType);
//		paraMap.put("searchWord", searchWord);
//		
//		List<String> wordList = service.wordSearchShow(paraMap);
//		JSONArray jsonarr = new JSONArray(); // []
//		
//		if(wordList  != null) {
//			for(String word: wordList) {
//				JSONObject jsonobj = new JSONObject();
//				jsonobj.put("word", word);
//				jsonarr.put(jsonobj);
//			}
//		}
//		
//		return jsonarr.toString(); // "[]" 또는 "[{},{},{}]"
//	}
		
		
	//////////////////////////////////////////////////////////////////////////////////////
	public String getCurrentURL(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String url = MyUtil.getCurrentURL(request);
		session.setAttribute("goBackURL", url);
		return url;
	}
}