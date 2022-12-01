package com.spring.jieun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.finalproject.common.FileManager;
import com.spring.hyerin.model.EmployeeVO;
import com.spring.jieun.model.ApprovalVO;
import com.spring.jieun.service.InterApprovalService;

@Controller
public class ApprovalController {
	@Autowired
	private InterApprovalService service;
	
	@Autowired // Type 에 따라 알아서 Bean 을 주입해준다 
	private FileManager fileManager; // 이미 빈으로 올라간 클래스
	
	@RequestMapping(value = "/approval.up") 
	public ModelAndView rl_approval(HttpServletRequest request,HttpServletResponse response, ModelAndView mav) {
		
		List<ApprovalVO> approvalList = null ; // 글쓴게 없을수도 있으므로 
		
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO)session.getAttribute("loginuser");
		String employee_no = loginuser.getEmployee_no();
		//System.out.println("employee_no => "+employee_no);
		
		String searchStartday = request.getParameter("searchStartday");
		String searchEndday = request.getParameter("searchEndday");
		
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
		paraMap.put("searchStartday", searchStartday);
		paraMap.put("searchEndday", searchEndday);
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
		
		mav.setViewName("approval/approval.tiles");
		//  /WEB-INF/views/tiles1/board/list.jsp  파일을 생성한다.
		return mav;
	}	
	
	@ResponseBody
	@RequestMapping(value = "/approval/myList.up", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8") // 오로지 GET방식만 허락하는 것임.
	public String approval_myview(HttpServletRequest request,HttpServletResponse response) {
		List<ApprovalVO> approvalList = null ; // 글쓴게 없을수도 있으므로
		
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO)session.getAttribute("loginuser");
		String employee_no = loginuser.getEmployee_no();
		
		String searchStartday = request.getParameter("searchStartday");
		System.out.println("searchStartday => "+searchStartday);
		String searchEndday = request.getParameter("searchEndday");
		System.out.println("searchEndday => "+searchEndday);
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("employee_no", employee_no);
		paraMap.put("searchStartday", searchStartday);
		paraMap.put("searchEndday", searchEndday);
		
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
	
	
	
	
	@RequestMapping(value = "/approval/writing.up")
	public String approval_writing(HttpServletRequest request) {
		return "/approval/approval_writing.tiles";
	}
	
	
	
	@RequestMapping(value = "/approval/memberList.up")
	public ModelAndView approval_memberList(HttpServletRequest request, ModelAndView mav) {
		
		mav.setViewName("tiles/approval/approval_memberList");
		return mav;
	}

	
	
	
}