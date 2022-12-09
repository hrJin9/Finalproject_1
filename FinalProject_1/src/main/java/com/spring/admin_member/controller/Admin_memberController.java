package com.spring.admin_member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.finalproject.common.AES256;
import com.spring.finalproject.common.MyUtil;
import com.spring.hyerin.model.DepartmentsVO;
import com.spring.hyerin.model.EmployeeVO;
import com.spring.hyerin.service.InterMemberService;

@Controller
public class Admin_memberController {
	
	@Autowired
	private InterMemberService service; 
	
	@Autowired
	private AES256 aes;

	@RequestMapping(value = "/admin_memberList.up")
	public ModelAndView admin_memberList(HttpServletRequest request, ModelAndView mav) throws Throwable{
		
		String dropCondition = request.getParameter("dc");
		String dropVal = request.getParameter("dv");
		
		String searchCondition = request.getParameter("sc");
		String searchVal = request.getParameter("sv");
		
		String s_sizePerPage = request.getParameter("sp");
		String s_cur = request.getParameter("cur");
		
		if(s_sizePerPage == null || !("20".equals(s_sizePerPage) || "40".equals(s_sizePerPage) || "80".equals(s_sizePerPage) ))
			s_sizePerPage = "20";
		if(s_cur == null)
			s_cur = "1";
		
		int sizePerPage = Integer.parseInt(s_sizePerPage);
		int cur = Integer.parseInt(s_cur);
		
//		System.out.println("s_sizePerPage: " + s_sizePerPage);
//		System.out.println("dropCondition: " + dropCondition);
//		System.out.println("dropVal: " + dropVal);
//		System.out.println("searchCondition: " + searchCondition);
//		System.out.println("searchVal: " + searchVal);
		
		//검색어 처리
		if(dropCondition == null || "".equals(dropCondition)) dropCondition = "";
		if(dropVal == null || "".equals(dropVal)) dropVal = "";
		
		if(searchCondition == null || "".equals(searchCondition)) searchCondition = "";
		
		if(searchVal == null || "".equals(searchVal) || searchVal.trim().isEmpty()) searchVal = "";
		if(searchVal != null) searchVal = searchVal.trim();
		
		if("email".equals(searchCondition) || "mobile".equals(searchCondition)) searchVal = aes.encrypt(searchVal);
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("searchCondition", searchCondition);
		paraMap.put("searchVal", searchVal);
		paraMap.put("dropCondition", dropCondition);
		paraMap.put("dropVal", dropVal);
		paraMap.put("sizePerPage", s_sizePerPage);
		
		// 구성원 리스트의 총 페이지수
		int totalCount = service.getEmpTotal(paraMap);
		int totalPage = (int) Math.ceil((double) totalCount / sizePerPage);
		
//		System.out.println("totalCount: " + totalCount);
		
		//페이지 처리
		try {
			if(cur < 1 || cur > totalPage)
				cur = 1;
		} catch(NumberFormatException e) {
			cur = 1;
		}
		
		int startRno = ((cur - 1) * sizePerPage) + 1;
		int endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		// 구성원리스트 가져오기
		List<EmployeeVO> evoList = service.getEmpList(paraMap);
		
		for(EmployeeVO evo : evoList) {
			evo.setEmail(aes.decrypt(evo.getEmail()));
			evo.setMobile(aes.decrypt(evo.getMobile()));
		}
		if("email".equals(searchCondition) || "mobile".equals(searchCondition)) searchVal = aes.decrypt(searchVal);
		
		//페이지바 만들기
		int blockSize = 10;
		int loop = 1;
		int pageNo = ((cur - 1) / blockSize) * blockSize + 1;
		
		
		String pageBarHTML = "<nav><ul class='pagination mg-pagebar'>";
		String url = "admin_memberList.up";
		
		// [맨처음][이전] 만들기
		if(pageNo != 1) {
			pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='처음' href='"+url+"?sc="+searchCondition+"&sv="+searchVal+"&dc="+dropCondition+"&dv="+dropVal+"&sp="+sizePerPage+"&cur=1'><span aria-hidden='true'>&laquo;</span></a></li>";
			pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='이전' href='"+url+"?sc="+searchCondition+"&sv="+searchVal+"&dc="+dropCondition+"&dv="+dropVal+"&sp="+sizePerPage+"&cur="+(pageNo-1)+"'><span aria-hidden='true'>&lt;</span></a></li>";
		}
		while( !(loop > blockSize || pageNo > totalPage) ) {
			if(pageNo == cur) {
				pageBarHTML += "<li class='page-item' style='cursor:not-allowed; font-weight: 700; '><a class='page-link' style='background-color: #4285f4; color: white !important;'><span aria-hidden='true'>"+pageNo+"</span></a></li>";
			}
			else {
				pageBarHTML += "<li class='page-item'><a class='page-link' href='"+url+"?sc="+searchCondition+"&sv="+searchVal+"&dc="+dropCondition+"&dv="+dropVal+"&sp="+sizePerPage+"&cur="+pageNo+"'>"+pageNo+"</a></li>";
			}
			
			loop++;
			pageNo++;
		}//end of while
		// [다음][마지막] 만들기
		if(pageNo <= totalPage) {
			pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='다음' href='"+url+"?sc="+searchCondition+"&sv="+searchVal+"&dc="+dropCondition+"&dv="+dropVal+"&sp="+sizePerPage+"&cur="+pageNo+"'><span aria-hidden='true'>&gt;</span></a></li>";
			pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='마지막' href='"+url+"?sc="+searchCondition+"&sv="+searchVal+"&dc="+dropCondition+"&dv="+dropVal+"&sp="+sizePerPage+"&cur="+totalPage+"'><span aria-hidden='true'>&raquo;</span></a></li>";
		}
		
		pageBarHTML += "</ul></nav>";
		
		String gobackURL = MyUtil.getCurrentURL(request);
		
		// 부서목록 가져오기
		List<DepartmentsVO> dvoList = service.getdeptname();
		
		// 직위목록 가져오기
		List<String> pList = service.getposition();
		
		// 고용형태 가져오기
		List<String> jtList = service.getjointype();
		
		
		// 검색조건, 검색어 뷰단에서 유지
		if (!"".equals(searchCondition) && !"".equals(searchVal) || !"".equals(dropVal)) {
			mav.addObject("paraMap", paraMap);
		}
		
		mav.addObject("totalCount",totalCount);
		mav.addObject("pageBar", pageBarHTML);
		mav.addObject("gobackURL", gobackURL.replaceAll("&", " "));
		mav.addObject("evoList",evoList);
		mav.addObject("dvoList",dvoList);
		mav.addObject("pList",pList);
		mav.addObject("jtList",jtList);
		
		mav.setViewName("admin/admin_memberList.tiles");
		return mav;
	}
	
	@RequestMapping(value = "/admin_memberAdd_hr.up")
	public ModelAndView admin_memberAdd_hr(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("admin/admin_memberAdd_hr.tiles");
		return mav;
	} 
	
	@RequestMapping(value = "/admin_memberAdd_personal.up")
	public ModelAndView admin_memberAdd_personal(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("admin/admin_memberAdd_personal.tiles");
		return mav;
	} 
	
	@RequestMapping(value = "/admin_memberView_hr.up")
	public ModelAndView admin_memberView_hr(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("admin/admin_memberView_hr.tiles");
		return mav;
	} 
	
	@RequestMapping(value = "/admin_memberView_personal.up")
	public ModelAndView admin_memberView_personal(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("admin/admin_memberView_personal.tiles");
		return mav;
	} 
	
	
}
