package com.spring.hyerin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.finalproject.common.FileManager;
import com.spring.finalproject.common.MyUtil;
import com.spring.hyerin.model.DepartmentsVO;
import com.spring.hyerin.model.EmployeeVO;
import com.spring.hyerin.model.MessageFileVO;
import com.spring.hyerin.model.MessageSendVO;
import com.spring.hyerin.model.MessageVO;
import com.spring.hyerin.service.InterMessageService;

@Controller
public class MessageController {
	
	@Autowired
	private InterMessageService service;
	
	@Autowired
	private FileManager fileManager;

	@RequestMapping(value = "/message.up")
	public ModelAndView rl_messageHome(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		String mno = request.getParameter("mno");
		if(mno == null) mno = "";
		
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("mno",mno);
		//현재 페이지 저장
		/*
		 * String cururl = getCurrentURL(request); if(cururl.contains("&tab")) { int
		 * firsttab = cururl.indexOf("&tab"); cururl =
		 * cururl.replaceAll(cururl.substring(firsttab), ""); }
		 * paraMap.put("cururl",cururl);
		 */
		
		mav.addObject("paraMap",paraMap);
		mav.setViewName("message/message_recieve.tiles");
		return mav;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/mglist.up", method = {RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String mglist(HttpServletRequest request, ModelAndView mav) {
		
		// 탭정보 가져오기
		String tab = request.getParameter("tab"); // "all", "unread", "scrap"
		
		// 로그인된 유저 정보(receiver) 가져오기
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginuser");
		String empno = emp.getEmployee_no();
		
		String curpage = request.getParameter("curpage");
		int sizePerPage = 2;
		if (curpage == null) curpage = "1";
		int startRno = ((Integer.parseInt(curpage) - 1) * sizePerPage) + 1;
		int endRno = startRno + sizePerPage - 1;
		
		// 맵에 정보값 넣어주기
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("tab", tab);
		paraMap.put("empno", empno);
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		// 로그인유저의 메시지리스트 불러오기
		List<Map<String,String>> mvoList = service.getmvoList(paraMap);
		
		JSONArray jsonarr = new JSONArray();
		if(mvoList != null) {
			for(Map<String,String> map : mvoList) {
				JSONObject jsonobj = new JSONObject();
				jsonobj.put("mno", map.get("mno"));
				jsonobj.put("writer", map.get("writer"));
				jsonobj.put("w_name", map.get("w_name"));
				jsonobj.put("w_deptname", map.get("w_deptname"));
				jsonobj.put("receiver", map.get(""));
				jsonobj.put("r_name", map.get("r_name"));
				jsonobj.put("r_deptname", map.get("r_deptname"));
				jsonobj.put("mgroup", map.get("mgroup"));
				jsonobj.put("reno", map.get("reno"));
				jsonobj.put("subject", map.get("subject"));
				jsonobj.put("content", map.get("content"));
				jsonobj.put("m_systemfilename", map.get("m_systemfilename"));
				jsonobj.put("m_originfilename", map.get("m_originfilename"));
				jsonobj.put("file_size", map.get("file_size"));
				jsonobj.put("ms_sendtime", map.get("ms_sendtime"));
				jsonobj.put("ms_checktime", map.get("ms_checktime"));
				
				jsonarr.put(jsonobj);
			}//end of for
		}//end of if
		
		return jsonarr.toString();
	}//end of mglist
	
	@ResponseBody
	@RequestMapping(value = "/mgtotal.up", method = {RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String mgtotal(HttpServletRequest request, ModelAndView mav) {
		
		// 로그인된 유저 정보(receiver) 가져오기
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginuser");
		String empno = emp.getEmployee_no();
		String tab = request.getParameter("tab");
		String sizePerPage = request.getParameter("sizePerPage");
		
		
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("tab",tab);
		paraMap.put("sizePerPage",sizePerPage);
		paraMap.put("empno",empno);
		
		// 메시지리스트의 총페이지수 알아오기
		int mgtotal = service.getmgtotal(paraMap);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("mgtotal", mgtotal);
		
		return jsonobj.toString();
	}//end of mgtotal
	
	
	@ResponseBody
	@RequestMapping(value = "/selectOnemg.up", method = {RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String selectOnemg(HttpServletRequest request, ModelAndView mav) {
		
		String mno = request.getParameter("mno");
		
		// 메시지 내용등 정보 알아오기
		MessageVO mvo = service.getmvo(mno);
		
		// 메시지 내용정보 저장하기
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("mno", mvo.getMno());
		jsonobj.put("reno", mvo.getReno());
		jsonobj.put("writer", mvo.getWriter());
		jsonobj.put("w_name", mvo.getW_name());
		jsonobj.put("w_dept", mvo.getW_dept());
		jsonobj.put("subject", mvo.getSubject());
		jsonobj.put("content", mvo.getContent());
		jsonobj.put("m_systemfilename", mvo.getM_systemfilename());
		jsonobj.put("m_originfilename", mvo.getM_originfilename());
		jsonobj.put("file_size", mvo.getFile_size());
		jsonobj.put("profile_orginfilename", mvo.getProfile_orginfilename());
		
		return jsonobj.toString();
	}//end of selectOnemg
	
	@ResponseBody
	@RequestMapping(value = "/selectOnemgReceivers.up", method = {RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String selectOnemgReceivers(HttpServletRequest request, ModelAndView mav) {
		String mno = request.getParameter("mno");
		
		// 메시지 수신자 정보 알아오기
		List<MessageSendVO> msvoList = service.getmsvoList(mno);
		
		JSONArray jsonarr = new JSONArray();
		// 메시지수신자정보 저장하기
		for(MessageSendVO msvo : msvoList) {
			JSONObject jsonobj_ms = new JSONObject();
			jsonobj_ms.put("fk_mno", msvo.getFk_mno());
			jsonobj_ms.put("receiver", msvo.getReceiver());
			jsonobj_ms.put("r_name", msvo.getR_name());
			jsonobj_ms.put("r_dept", msvo.getR_dept());
			jsonobj_ms.put("profile_orginfilename", msvo.getProfile_orginfilename());
			
			jsonarr.put(jsonobj_ms);
		}//end of for
		
		return jsonarr.toString();
	}//end of selectOnemgReceivers
	
	@ResponseBody
	@RequestMapping(value = "/getmstime.up", method = {RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String getmstime(HttpServletRequest request, ModelAndView mav) {
		String mno = request.getParameter("mno");
		
		// 메시지 보낸시간 알아오기
		String ms_sendtime = service.getmstime(mno);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("ms_sendtime", ms_sendtime);
		
		return jsonobj.toString();
	}//end of selectOnemgReceivers
	
	
	@RequestMapping(value = "/message/send.up")
	public ModelAndView messageRecieve(HttpServletRequest request, ModelAndView mav) {
		
		mav.setViewName("message/message_send.tiles");
		return mav;
	}
	
	@RequestMapping(value = "/message/temp.up")
	public ModelAndView messageTemp(HttpServletRequest request, ModelAndView mav) {
		
		mav.setViewName("message/message_temp.tiles");
		return mav;
	}
	
	@RequestMapping(value = "/message/write.up")
	public ModelAndView rl_messageWrite(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		//답메시지일 경우
		String mgroup = request.getParameter("mgroup"); // 원메시지 및 그룹
		String reno = request.getParameter("reno"); //답메시지 번호
		String re_subject = request.getParameter("subject");
		
		if(mgroup == null) mgroup = "";
		if(reno == null) reno = "";
		if(re_subject == null) re_subject = "";
		else re_subject = "RE: " + request.getParameter("subject");
		
//		System.out.println("mgroup: " + mgroup);
//		System.out.println("reno: " + reno);
//		System.out.println("re_subject: "+re_subject);
		
		mav.addObject("mgroup",mgroup);
		mav.addObject("reno",reno);
		mav.addObject("re_subject",re_subject);
		mav.setViewName("message/message_write.tiles");
		return mav;
	}
	
	
	
	@RequestMapping(value = "/sendMessage.up", method = {RequestMethod.POST})
	public ModelAndView SendMessage(ModelAndView mav, MultipartHttpServletRequest mrequest, MultipartFile[] attaches, MessageVO mvo, MessageSendVO msvo) throws Exception {
		
		// mno 채번해오기
		String mno = service.getmno();
		
		String reno = mvo.getReno();
		// 1. 메시지 insert
		if(reno != "") {
			mvo.setMgroup(mvo.getMgroup());
			mvo.setReno(reno);
		}
		mvo.setMno(mno);
		mvo.setWriter(mvo.getWriter());
		mvo.setSubject(mvo.getSubject());
		mvo.setContent(mvo.getContent());
		
		int n = 0;
		try {
			n = service.addMessage(attaches, mrequest, msvo, mvo);
		} catch(Throwable e) {
			e.printStackTrace();
		}
		
		if(n==1) {
			System.out.println("모두 성공");
			mav.setViewName("message/message_send.tiles");
		} else {
			String loc = "/message/write.up";
			String message = "실패";
			mav.addObject("log",mrequest.getContextPath() + loc);
			mav.addObject("message",message);
			mav.setViewName("msg");
		}
		return mav;
	}
	
	@RequestMapping(value = "/message/book.up")
	public ModelAndView messageBook(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("tiles/message/message_book");
		return mav;
	}
	
	@RequestMapping(value = "/message/memberList.up")
	public ModelAndView messageMemberList(HttpServletRequest request, ModelAndView mav) {
		
		//부서정보 가져오기
		List<DepartmentsVO> deptvoList = service.getdept();
		
		//부서, 팀의 정보 구해오기
		List<Map<String,String>> dtList = service.getdt();
		
		mav.addObject("deptvoList", deptvoList);
		mav.addObject("dtList", dtList);
		mav.setViewName("tiles/message/message_memberList");
		return mav;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/showEmpList.up", method = {RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String showEmpList(HttpServletRequest request, ModelAndView mav) {
		
		String searchCondition = request.getParameter("searchCondition");
		String searchVal = request.getParameter("searchVal");
		String teamVal = request.getParameter("teamVal");
		if(searchCondition == null) searchCondition = "";
		if(searchVal == null) searchVal = "";
		if(teamVal == null) teamVal = "";
		
		
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("searchCondition",searchCondition); // name_kr  role  position
		paraMap.put("searchVal",searchVal); // ''
		paraMap.put("teamVal",teamVal); // '' 
		
		
		//구성원 목록을 읽어오기
		List<EmployeeVO> empvoList = service.getEmpList(paraMap);
		
		JSONArray jsonarr = new JSONArray();
		
		System.out.println(empvoList.size());
		//구성원 목록 저장하기
		for(EmployeeVO empvo : empvoList) {
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("fk_department_no", empvo.getFk_department_no());
			jsonobj.put("department_name", empvo.getDepartment_name());
			jsonobj.put("fk_team_no", empvo.getFk_team_no());
			jsonobj.put("team_name", empvo.getTeam_name());
			jsonobj.put("employee_no", empvo.getEmployee_no());
			jsonobj.put("name_kr", empvo.getName_kr());
			jsonobj.put("role", empvo.getRole());
			jsonobj.put("position", empvo.getPosition());
			jsonobj.put("profile_systemfilename", empvo.getProfile_systemfilename());
			
			jsonarr.put(jsonobj);
		}//end of for
		
		return jsonarr.toString();
	}//end of showEmpList
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////
	public String getCurrentURL(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String url = MyUtil.getCurrentURL(request);
		session.setAttribute("goBackURL", url);
		return url;
	}
}
