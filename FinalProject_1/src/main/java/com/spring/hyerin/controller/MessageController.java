package com.spring.hyerin.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		mav.addObject("paraMap",paraMap);
		mav.setViewName("message/message_recieve.tiles");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = {"/getMgCnt.up","/getMsMgCnt.up"}, produces = "text/plain;charset=UTF-8")
	public String getMgCnt(HttpServletRequest request, ModelAndView mav) {
		String[] tabs = request.getParameterValues("tab");
		String receiver = request.getParameter("receiver"); // 받은 메시지일 경우
		String writer = request.getParameter("writer"); // 보낸메시지일 경우
		if(receiver == null) receiver = ""; // 보낸메시지일 경우
		if(writer == null) writer = "";
		
		JSONArray jsonarr = new JSONArray();
		for(String tab : tabs) {
			Map<String, String> paraMap = new HashMap<String, String>();
			paraMap.put("receiver",receiver);
			paraMap.put("writer",writer);
			paraMap.put("tab",tab);
			
			int mgCnt;
			if(!"".equals(receiver)) { //받은메시지일 경우 
				// 탭별 메시지 개수 알아오기
				mgCnt = service.getMgCnt(paraMap);
			} else {
				// 탭별 메시지 개수 알아오기
				mgCnt = service.getMsMgCnt(paraMap);
			}
			
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("mgCnt", mgCnt);
			
			jsonarr.put(jsonobj);
		}
		
		return jsonarr.toString();
	}//end of getMgCnt

	
	
	@ResponseBody
	@RequestMapping(value = "/mglist.up", method = {RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String mglist(HttpServletRequest request, ModelAndView mav) {
		
		// 탭정보 가져오기
		String tab = request.getParameter("tab"); // "all", "unread", "scrap"
		// 검색정보 가져오기
		String searchCondition = request.getParameter("searchCondition");
		String searchVal = request.getParameter("searchVal");
		if("all".equals(searchCondition)) searchCondition = "subject";
		if(searchVal == null) searchVal = ""; 
		
		// 로그인된 유저 정보(receiver) 가져오기
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginuser");
		String empno = emp.getEmployee_no();
		String curpage = request.getParameter("curpage");
		int sizePerPage = 10;
		if (curpage == null) curpage = "1";
		int startRno = ((Integer.parseInt(curpage) - 1) * sizePerPage) + 1;
		int endRno = startRno + sizePerPage - 1;
		
		// 맵에 정보값 넣어주기
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("tab", tab);
		paraMap.put("searchCondition", searchCondition);
		paraMap.put("searchVal", searchVal);
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
				jsonobj.put("content", MyUtil.secureCode(map.get("content")));
				jsonobj.put("sendtime", map.get("sendtime"));
				jsonobj.put("ms_checktime", map.get("ms_checktime"));
				jsonobj.put("filecnt", map.get("filecnt"));
				jsonobj.put("scrapstatus", map.get("scrap_status"));
				jsonobj.put("delete_status", map.get("delete_status"));
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
		
		// 검색정보 가져오기
		String searchCondition = request.getParameter("searchCondition");
		String searchVal = request.getParameter("searchVal");
		if("all".equals(searchCondition)) searchCondition = "subject";
		if(searchVal == null) searchVal = ""; 
		
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("tab",tab);
		paraMap.put("searchCondition", searchCondition);
		paraMap.put("searchVal", searchVal);
		paraMap.put("sizePerPage",sizePerPage);
		paraMap.put("empno",empno);
		
		// 메시지리스트의 총페이지수 알아오기
		int mgtotal = service.getmgtotal(paraMap);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("mgtotal", mgtotal);
		
		return jsonobj.toString();
	}//end of mgtotal
	
	
	@ResponseBody
	@RequestMapping(value = "/mg_sendlist.up", method = {RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String mg_sendlist(HttpServletRequest request, ModelAndView mav) {
		
		// 탭정보 가져오기
		String tab = request.getParameter("tab"); // "all", "unread", "scrap"
		// 검색정보 가져오기
		String searchCondition = request.getParameter("searchCondition");
		String searchVal = request.getParameter("searchVal");
		if("all".equals(searchCondition)) searchCondition = "subject";
		if(searchVal == null) searchVal = ""; 
		
		// 로그인된 유저 정보(receiver) 가져오기
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginuser");
		String empno = emp.getEmployee_no();
		String curpage = request.getParameter("curpage");
		int sizePerPage = 10;
		if (curpage == null) curpage = "1";
		int startRno = ((Integer.parseInt(curpage) - 1) * sizePerPage) + 1;
		int endRno = startRno + sizePerPage - 1;
		
		// 맵에 정보값 넣어주기
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("empno",empno);
		paraMap.put("tab", tab);
		paraMap.put("searchCondition", searchCondition);
		paraMap.put("searchVal", searchVal);
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		// 로그인유저의 메시지리스트 불러오기
		List<MessageVO> mvoList = service.getMsmvoList(paraMap);
		
		JSONArray jsonarr = new JSONArray();
		if(mvoList != null) {
			for(MessageVO mvo : mvoList) {
				JSONObject jsonobj = new JSONObject();
				jsonobj.put("mno", mvo.getMno());
				jsonobj.put("writer", mvo.getWriter());
				jsonobj.put("mgroup", mvo.getMgroup());
				jsonobj.put("reno", mvo.getReno());
				jsonobj.put("subject", mvo.getSubject());
				jsonobj.put("sendtime", mvo.getSendtime());
				jsonobj.put("depthno", mvo.getDepthno());
				jsonobj.put("writer_scrapstatus", mvo.getScrap_status());
				jsonobj.put("receiver_name", mvo.getReceiver_name());
				jsonobj.put("scrapstatus", mvo.getScrap_status());
				jsonobj.put("filecnt", mvo.getFilecnt());
				jsonarr.put(jsonobj);
			}//end of for
		}//end of if
		
		return jsonarr.toString();
		
	}//end of mg_sendlist
	
	
	@ResponseBody
	@RequestMapping(value = "/msmgtotal.up", method = {RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String msmgtotal(HttpServletRequest request, ModelAndView mav) {
		
		// 로그인된 유저 정보(receiver) 가져오기
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginuser");
		String empno = emp.getEmployee_no();
		String tab = request.getParameter("tab");
		String sizePerPage = request.getParameter("sizePerPage");
		
		// 검색정보 가져오기
		String searchCondition = request.getParameter("searchCondition");
		String searchVal = request.getParameter("searchVal");
		if("all".equals(searchCondition)) searchCondition = "subject";
		if(searchVal == null) searchVal = ""; 
		
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("tab",tab);
		paraMap.put("searchCondition", searchCondition);
		paraMap.put("searchVal", searchVal);
		paraMap.put("sizePerPage",sizePerPage);
		paraMap.put("empno",empno);
		
		// 메시지리스트의 총페이지수 알아오기
		int mgtotal = service.getMsmgtotal(paraMap);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("mgtotal", mgtotal);
		
		return jsonobj.toString();
	}//end of mgtotal
	
	
	
	@ResponseBody
	@RequestMapping(value = "/changeMgStatus.up", produces = "text/plain;charset=UTF-8")
	public String changeMgStatus(HttpServletRequest request, MessageSendVO msvo, ModelAndView mav) {
		
		//해당 메시지 읽음처리하기
		int n = service.changeMgStatus(msvo);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("n",n);
		
		return jsonobj.toString();
	}//end of selectOnemgReceivers
	
	
	@ResponseBody
	@RequestMapping(value = "/selectOnemg.up", method = {RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String selectOnemg(HttpServletRequest request, ModelAndView mav) {
		
		String mno = request.getParameter("mno");
		String receiver = request.getParameter("receiver");
		if(receiver == null) receiver = "";
		
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("mno",mno);
		paraMap.put("receiver",receiver);
		
		// 메시지 내용등 정보 알아오기
		MessageVO mvo = service.getmvo(paraMap);
		// 메시지 내용정보 저장하기
		JSONObject jsonobj = new JSONObject();
		try {
			jsonobj.put("mno", mvo.getMno());
			jsonobj.put("mgroup", mvo.getMgroup());
			jsonobj.put("reno", mvo.getReno());
			jsonobj.put("writer", mvo.getWriter());
			jsonobj.put("w_name", mvo.getW_name());
			jsonobj.put("w_dept", mvo.getW_dept());
			jsonobj.put("subject", mvo.getSubject());
			jsonobj.put("content", mvo.getContent());
			jsonobj.put("sendtime", mvo.getSendtime());
			jsonobj.put("depthno", mvo.getDepthno());
			jsonobj.put("scrapstatus", mvo.getScrap_status());
			jsonobj.put("profile_orginfilename", mvo.getProfile_orginfilename());
		} catch(Exception e) {
			return jsonobj.toString();
		}
		
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
	@RequestMapping(value = "/getmfile.up", method = {RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String getmfile(HttpServletRequest request, HttpServletResponse response ,ModelAndView mav) {
		String mno = request.getParameter("mno");
		
		// 한 메시지의 파일 정보 알아오기
		List<MessageFileVO> mfList = service.getmfile(mno);
		
		JSONArray jsonarr = new JSONArray();
		for(MessageFileVO mf : mfList) {
			
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("mfno", mf.getMfno());
			jsonobj.put("m_systemfilename", mf.getM_systemfilename());
			jsonobj.put("m_originfilename", mf.getM_originfilename());
			jsonobj.put("file_size", mf.getFile_size());
			jsonarr.put(jsonobj);
		}
		
		return jsonarr.toString();
	}//end of selectOnemgReceivers
	
	@ResponseBody
	@RequestMapping(value = "/getmgroupList.up", method = {RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String getmgroupList(HttpServletRequest request, HttpServletResponse response ,ModelAndView mav) {
		String mno = request.getParameter("mno");
		String receiver = request.getParameter("receiver");
		
		Map<String,String> paraMap = new HashMap<String, String>();
		paraMap.put("mno", mno);
		paraMap.put("receiver", receiver);
		
		// 관련메시지 3개  알아오기
		Map<String,String> mgroup = service.getmgroupList(paraMap);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("n_mno", mgroup.get("n_mno"));
		jsonobj.put("n_writer", mgroup.get("n_writer"));
		jsonobj.put("n_subject", mgroup.get("n_subject"));
		jsonobj.put("n_sendtime", mgroup.get("n_sendtime"));
		jsonobj.put("mno", mgroup.get("mno"));
		jsonobj.put("writer", mgroup.get("writer"));
		jsonobj.put("subject", mgroup.get("subject"));
		jsonobj.put("sendtime", mgroup.get("sendtime"));
		jsonobj.put("b_mno", mgroup.get("b_mno"));
		jsonobj.put("b_writer", mgroup.get("b_writer"));
		jsonobj.put("b_subject", mgroup.get("b_subject"));
		jsonobj.put("b_sendtime", mgroup.get("b_sendtime"));
		
		return jsonobj.toString();
	}//end of selectOnemgReceivers
	
	@ResponseBody
	@RequestMapping(value = {"/chxStatus.up","/SendchxStatus.up"}, produces = "text/plain;charset=UTF-8")
	public String chxStatus(HttpServletRequest request, HttpServletResponse response ,ModelAndView mav) {
		
		JSONObject jsonobj = new JSONObject();
		
		String[] mnoArr = request.getParameterValues("mnoArr");
		String receiver = request.getParameter("receiver"); 
		String condition = request.getParameter("condition"); // read, unread, scrap, delete
		if(receiver == null) receiver = ""; // 보낸 메시지일 경우
		
		int n = 0;
		if (mnoArr != null) {
			for(String mno : mnoArr) {
				Map<String,String> paraMap = new HashMap<String, String>();
				paraMap.put("receiver", receiver);
				paraMap.put("condition", condition);
				paraMap.put("mno", mno);
				try {
					//체크된 것 condition에 따라 상태 update해주기
					if(!"".equals(receiver)) {
						n = service.chxStatus(paraMap);
					}
					else {
						//보낸 메시지 => 체크된 것 condition에 따라 상태 update해주기
						n = service.sendchxStatus(paraMap);
					}
				} catch (Exception e) {
					n = 0;
					e.printStackTrace();
				}
				
			}//end of for
		}//end of if
		
		jsonobj.put("n", n);
		return jsonobj.toString();
	}//end of chxStatus
	
	
	@RequestMapping(value = "/mfDownload.up")
	public void mfDownload(HttpServletRequest request, HttpServletResponse response, MessageFileVO mfvo_y) {
		
		// 해당 메시지 파일의 정보 가져오기
		MessageFileVO mfvo = service.getmfvo(mfvo_y);
		
		response.setContentType("text/html; charset=UTF-8"); // 웹페이지로 찍어주겠다는 뜻
		PrintWriter out = null; // out은 웹브라우저에 기술하는 대상체
		try {
			
			if(mfvo.getM_systemfilename() == null) {
				out = response.getWriter();
				out.println("<script type='text/javasript'>alert('존재하지 않는 첨부파일입니다.'); </script>");
				return; // 종료
			}
			
			String fileName = mfvo.getM_systemfilename();
			String orgFilename = mfvo.getM_originfilename();
			
			HttpSession session = request.getSession();
			String root = session.getServletContext().getRealPath("/");
			String path = root + "resources" + File.separator + "files";
			
			boolean flag = false; // 파일다운로드 성공/실패를 알려주는 용도
			flag = fileManager.dofileDownload(fileName, orgFilename, path, response);
			if (!flag) { // false(다운로드 실패)일 경우 메시지 띄움
				out = response.getWriter();
				out.println("<script type='text/javasript'>alert('파일다운로드가 실패되었습니다.'); history.back(); </script>");
			}
		} catch (NumberFormatException | IOException e) {
			try {
				out = response.getWriter();
				out.println("<script type='text/javasript'>alert('파일다운로드가 불가능합니다.'); history.back(); </script>");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		
	}
	
	
	
	
	@RequestMapping(value = "/message/send.up")
	public ModelAndView rl_messageRecieve(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		mav.setViewName("message/message_send.tiles");
		return mav;
	}
	
	
	@RequestMapping(value = "/message/write.up")
	public ModelAndView rl_messageWrite(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		//답메시지일 경우
		String mgroup = request.getParameter("mgroup"); // 원메시지 및 그룹
		String reno = request.getParameter("reno"); //답메시지 번호
		String re_subject = request.getParameter("re_subject");
		String to = request.getParameter("to");
		String name = request.getParameter("name");
		String depthno = request.getParameter("depthno");
		
		if(mgroup == null) mgroup = "";
		if(reno == null) reno = "";
		if(re_subject == null) re_subject = "";
		else re_subject = "RE: " + re_subject;
		
		Map<String,String> paraMap = new HashMap<String, String>();
		paraMap.put("mgroup", mgroup);
		paraMap.put("reno", reno);
		paraMap.put("re_subject", re_subject);
		paraMap.put("to", to);
		paraMap.put("name", name);
		paraMap.put("depthno", depthno);
		
		mav.addObject("paraMap",paraMap);
		mav.setViewName("message/message_write.tiles");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getempname.up", produces = "text/plain;charset=UTF-8")
	public String getempname(HttpServletRequest request, HttpServletResponse response) {
		
		String[] empnoArr = request.getParameterValues("empnoArr");
		Map<String,String[]> paraMap = new HashMap<String, String[]>();
		paraMap.put("empnoArr", empnoArr);
		
		// empname, deptname 알아오기
		List<EmployeeVO> empList = service.getempname(paraMap);
		
		JSONArray jsonarr = new JSONArray();
		for(EmployeeVO emp : empList) {
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("name", emp.getName_kr());
			jsonobj.put("dept_name", emp.getDepartment_name());
			jsonarr.put(jsonobj);
		}
		
		return jsonarr.toString();
	}//end of getempname
	
	
	
	@RequestMapping(value = "/sendMessage.up", method = {RequestMethod.POST})
	public ModelAndView SendMessage(ModelAndView mav, MultipartHttpServletRequest mrequest, MultipartFile[] attaches, MessageVO mvo, MessageSendVO msvo) throws Exception {
		
		// mno 채번해오기
		String mno = service.getmno();
		
		// 1. 메시지 insert
		mvo.setMno(mno);
		if(!"".equals(mvo.getDepthno())) {
			mvo.setDepthno(String.valueOf( Integer.parseInt(mvo.getDepthno()) + 1 ));
		}
		
		int n = 0;
		try {
			n = service.addMessage(attaches, mrequest, msvo, mvo);
		} catch(Throwable e) {
			e.printStackTrace();
		}
		
		if(n==1) {
			mav.setViewName("message/message_send.tiles");
		} else {
			String loc = "/message/write.up";
			String message = "메시지 전송이 실패되었습니다.";
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
