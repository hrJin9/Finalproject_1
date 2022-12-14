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
		String receiver = request.getParameter("receiver"); // ?????? ???????????? ??????
		String writer = request.getParameter("writer"); // ?????????????????? ??????
		if(receiver == null) receiver = ""; // ?????????????????? ??????
		if(writer == null) writer = "";
		
		JSONArray jsonarr = new JSONArray();
		for(String tab : tabs) {
			Map<String, String> paraMap = new HashMap<String, String>();
			paraMap.put("receiver",receiver);
			paraMap.put("writer",writer);
			paraMap.put("tab",tab);
			
			int mgCnt;
			if(!"".equals(receiver)) { //?????????????????? ?????? 
				// ?????? ????????? ?????? ????????????
				mgCnt = service.getMgCnt(paraMap);
			} else {
				// ?????? ????????? ?????? ????????????
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
		
		// ????????? ????????????
		String tab = request.getParameter("tab"); // "all", "unread", "scrap"
		// ???????????? ????????????
		String searchCondition = request.getParameter("searchCondition");
		String searchVal = request.getParameter("searchVal");
		if("all".equals(searchCondition)) searchCondition = "subject";
		if(searchVal == null) searchVal = ""; 
		
		// ???????????? ?????? ??????(receiver) ????????????
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginuser");
		String empno = emp.getEmployee_no();
		String curpage = request.getParameter("curpage");
		int sizePerPage = 10;
		if (curpage == null) curpage = "1";
		int startRno = ((Integer.parseInt(curpage) - 1) * sizePerPage) + 1;
		int endRno = startRno + sizePerPage - 1;
		
		// ?????? ????????? ????????????
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("tab", tab);
		paraMap.put("searchCondition", searchCondition);
		paraMap.put("searchVal", searchVal);
		paraMap.put("empno", empno);
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		// ?????????????????? ?????????????????? ????????????
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
		
		// ???????????? ?????? ??????(receiver) ????????????
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginuser");
		String empno = emp.getEmployee_no();
		String tab = request.getParameter("tab");
		String sizePerPage = request.getParameter("sizePerPage");
		
		// ???????????? ????????????
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
		
		// ????????????????????? ??????????????? ????????????
		int mgtotal = service.getmgtotal(paraMap);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("mgtotal", mgtotal);
		
		return jsonobj.toString();
	}//end of mgtotal
	
	
	@ResponseBody
	@RequestMapping(value = "/mg_sendlist.up", method = {RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String mg_sendlist(HttpServletRequest request, ModelAndView mav) {
		
		// ????????? ????????????
		String tab = request.getParameter("tab"); // "all", "unread", "scrap"
		// ???????????? ????????????
		String searchCondition = request.getParameter("searchCondition");
		String searchVal = request.getParameter("searchVal");
		if("all".equals(searchCondition)) searchCondition = "subject";
		if(searchVal == null) searchVal = ""; 
		
		// ???????????? ?????? ??????(receiver) ????????????
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginuser");
		String empno = emp.getEmployee_no();
		String curpage = request.getParameter("curpage");
		int sizePerPage = 10;
		if (curpage == null) curpage = "1";
		int startRno = ((Integer.parseInt(curpage) - 1) * sizePerPage) + 1;
		int endRno = startRno + sizePerPage - 1;
		
		// ?????? ????????? ????????????
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("empno",empno);
		paraMap.put("tab", tab);
		paraMap.put("searchCondition", searchCondition);
		paraMap.put("searchVal", searchVal);
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		// ?????????????????? ?????????????????? ????????????
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
		
		// ???????????? ?????? ??????(receiver) ????????????
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginuser");
		String empno = emp.getEmployee_no();
		String tab = request.getParameter("tab");
		String sizePerPage = request.getParameter("sizePerPage");
		
		// ???????????? ????????????
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
		
		// ????????????????????? ??????????????? ????????????
		int mgtotal = service.getMsmgtotal(paraMap);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("mgtotal", mgtotal);
		
		return jsonobj.toString();
	}//end of mgtotal
	
	
	
	@ResponseBody
	@RequestMapping(value = "/changeMgStatus.up", produces = "text/plain;charset=UTF-8")
	public String changeMgStatus(HttpServletRequest request, MessageSendVO msvo, ModelAndView mav) {
		
		//?????? ????????? ??????????????????
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
		
		// ????????? ????????? ?????? ????????????
		MessageVO mvo = service.getmvo(paraMap);
		// ????????? ???????????? ????????????
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
		
		// ????????? ????????? ?????? ????????????
		List<MessageSendVO> msvoList = service.getmsvoList(mno);
		
		JSONArray jsonarr = new JSONArray();
		// ???????????????????????? ????????????
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
		
		// ??? ???????????? ?????? ?????? ????????????
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
		
		// ??????????????? 3???  ????????????
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
		if(receiver == null) receiver = ""; // ?????? ???????????? ??????
		
		int n = 0;
		if (mnoArr != null) {
			for(String mno : mnoArr) {
				Map<String,String> paraMap = new HashMap<String, String>();
				paraMap.put("receiver", receiver);
				paraMap.put("condition", condition);
				paraMap.put("mno", mno);
				try {
					//????????? ??? condition??? ?????? ?????? update?????????
					if(!"".equals(receiver)) {
						n = service.chxStatus(paraMap);
					}
					else {
						//?????? ????????? => ????????? ??? condition??? ?????? ?????? update?????????
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
		
		// ?????? ????????? ????????? ?????? ????????????
		MessageFileVO mfvo = service.getmfvo(mfvo_y);
		
		response.setContentType("text/html; charset=UTF-8"); // ??????????????? ?????????????????? ???
		PrintWriter out = null; // out??? ?????????????????? ???????????? ?????????
		try {
			
			if(mfvo.getM_systemfilename() == null) {
				out = response.getWriter();
				out.println("<script type='text/javasript'>alert('???????????? ?????? ?????????????????????.'); </script>");
				return; // ??????
			}
			
			String fileName = mfvo.getM_systemfilename();
			String orgFilename = mfvo.getM_originfilename();
			
			HttpSession session = request.getSession();
			String root = session.getServletContext().getRealPath("/");
			String path = root + "resources" + File.separator + "files";
			
			boolean flag = false; // ?????????????????? ??????/????????? ???????????? ??????
			flag = fileManager.dofileDownload(fileName, orgFilename, path, response);
			if (!flag) { // false(???????????? ??????)??? ?????? ????????? ??????
				out = response.getWriter();
				out.println("<script type='text/javasript'>alert('????????????????????? ?????????????????????.'); history.back(); </script>");
			}
		} catch (NumberFormatException | IOException e) {
			try {
				out = response.getWriter();
				out.println("<script type='text/javasript'>alert('????????????????????? ??????????????????.'); history.back(); </script>");
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
		
		//??????????????? ??????
		String mgroup = request.getParameter("mgroup"); // ???????????? ??? ??????
		String reno = request.getParameter("reno"); //???????????? ??????
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
		
		// empname, deptname ????????????
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
		
		// mno ???????????????
		String mno = service.getmno();
		
		// 1. ????????? insert
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
			String message = "????????? ????????? ?????????????????????.";
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
		
		//???????????? ????????????
		List<DepartmentsVO> deptvoList = service.getdept();
		
		//??????, ?????? ?????? ????????????
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
		
		
		//????????? ????????? ????????????
		List<EmployeeVO> empvoList = service.getEmpList(paraMap);
		
		JSONArray jsonarr = new JSONArray();
		
		//????????? ?????? ????????????
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
