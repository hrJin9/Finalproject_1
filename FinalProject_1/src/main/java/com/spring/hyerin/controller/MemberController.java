package com.spring.hyerin.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.finalproject.common.AES256;
import com.spring.finalproject.common.FileManager;
import com.spring.finalproject.common.MailSendService;
import com.spring.finalproject.common.Sha256;
import com.spring.finalproject.service.InterFinalprojectService;
import com.spring.hyerin.model.DepartmentsVO;
import com.spring.hyerin.model.EmployeeVO;
import com.spring.hyerin.service.InterLoginService;
import com.spring.hyerin.service.InterMemberService;
import com.spring.hyerin.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private InterMemberService service;
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private AES256 aes;
	
	@Autowired
	private MailSendService mailService;
	
	
	@RequestMapping(value = "/memberRegister.up")
	public ModelAndView memberRegister(HttpServletRequest request, ModelAndView mav) {
		//부서정보 가져오기
		List<DepartmentsVO> deptvoList = service.getdept();
		
		mav.addObject("deptvoList", deptvoList);
		mav.setViewName("member/memberRegister");
		return mav;
	}
	
	@RequestMapping(value = "/myInfo_hr.up")
	public ModelAndView rl_myInfo_hr(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) throws Throwable {
		
		String empno = request.getParameter("empno");
		
		//해당 empno사원의 정보 가져오기
		EmployeeVO evo = service.getempvo(empno);
		
		evo.setEmail(aes.decrypt(evo.getEmail()));
		try {
			evo.setMobile(aes.decrypt(evo.getMobile()));
		} catch (Exception e) {	}
		
		mav.addObject("empno", empno);
		mav.addObject("evo", evo);
		mav.setViewName("member/myInfo_hr.tiles");
		return mav;
	}
	
	@RequestMapping(value = "/myInfo_personal.up")
	public String myInfo_personal(HttpServletRequest request) {
		return "member/myInfo_personal.tiles";
	}
	
	@RequestMapping(value = "/pwdChange.up")
	public ModelAndView pwdChange(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("member/pwdChange");
		return mav;
	}
	
	@RequestMapping(value = "/memberList.up")
	public ModelAndView memberList(HttpServletRequest request, ModelAndView mav) {
		//부서정보 가져오기
		List<DepartmentsVO> deptvoList = service.getdept();
		
		//부서, 팀의 정보 구해오기
		List<Map<String,String>> dtList = service.getdt();
		
		mav.addObject("deptvoList", deptvoList);
		mav.addObject("dtList", dtList);
		mav.setViewName("member/memberList.tiles");
		return mav;
	}
	
	@RequestMapping(value = "/memberInfo_hr.up")
	public ModelAndView memberInfo_hr(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) throws Throwable {

		String empno = request.getParameter("empno");
		if(empno == null) { // null값 들어오는 경우(장난)
			String loc = "javascript:history.back()";
			mav.addObject("loc",loc);
			mav.setViewName("msg");
		} else {
			//해당 empno사원의 정보 가져오기
			EmployeeVO evo = service.getempvo(empno);
			
			evo.setEmail(aes.decrypt(evo.getEmail()));
			try {
				evo.setMobile(aes.decrypt(evo.getMobile()));
			} catch (Exception e) {	}
			
			
			System.out.println("사번이 외... : " + evo.getName_kr());
			mav.addObject("empno", empno);
			mav.addObject("evo", evo);
			mav.setViewName("member/memberInfo_hr.tiles");
			
		}
		return mav;
	}
	
	@RequestMapping(value = "/memberInfo_personal.up")
	public ModelAndView memberInfo_personal(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) throws Throwable {
		String empno = request.getParameter("empno");
		if(empno == null) { // null값 들어오는 경우(장난)
			String loc = "javascript:history.back()";
			mav.addObject("loc",loc);
			mav.setViewName("msg");
		} else {
			//해당 empno사원의 정보 가져오기
			EmployeeVO evo = service.getempvo(empno);
			
			evo.setEmail(aes.decrypt(evo.getEmail()));
			try {
				evo.setMobile(aes.decrypt(evo.getMobile()));
			} catch (Exception e) {} 
			
			mav.addObject("empno", empno);
			mav.addObject("evo", evo);
			mav.setViewName("member/memberInfo_personal.tiles");
		}
		return mav;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/addProfile.up")
	public String addProfile(MultipartHttpServletRequest mrequest, @RequestParam("addprofile") MultipartFile attach) throws Exception{
		int n = 0;
		
		if(!attach.isEmpty()) {
			
			HttpSession session = mrequest.getSession();
			EmployeeVO empvo = (EmployeeVO)session.getAttribute("loginuser");
			String empno = empvo.getEmployee_no();
			
			String root = session.getServletContext().getRealPath("/");
			String path = root + "resources" + File.separator + "files";
			
			String newFileName = "";
			byte[] bytes = null;
			long fileSize = 0;
			
			
			try {
				bytes = attach.getBytes();
				String originalFileName = attach.getOriginalFilename();
				newFileName = fileManager.doFileUpload(bytes, originalFileName, path);
				fileSize = attach.getSize();
				
				Map<String, String> paraMap = new HashMap<String, String>();
				paraMap.put("profile_systemfilename",newFileName);
				paraMap.put("profile_orginfilename",originalFileName);
				paraMap.put("filesize",String.valueOf(fileSize));
				paraMap.put("employee_no",empno);
				
				//파일업로드해주기
				n = service.addProfile(paraMap);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}//end of if
		
		return String.valueOf(n);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/delImg.up")
	public String delImg(HttpServletRequest request){
		
		String profile_systemfilename = request.getParameter("profile_systemfilename");
		
		HttpSession session = request.getSession();
		String root = session.getServletContext().getRealPath("/");
		String path = root + "resources" + File.separator + "files";
		
		fileManager.doFileDelete(profile_systemfilename, path);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("n", 1);
		
		return jsonobj.toString();
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/getImg.up")
	public String getImg(HttpServletRequest request){
		
		String employee_no = request.getParameter("empno");
		
		//프로필 파일이름 알아오기
		String profile_systemfilename = service.getImg(employee_no);
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("profile_systemfilename",profile_systemfilename);
		
		
		return jsonobj.toString();
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/reSession.up")
	public String reSession(HttpServletRequest request){
		
		String profile_systemfilename = request.getParameter("profile_systemfilename");
		
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO)session.getAttribute("loginuser");
		loginuser.setProfile_systemfilename(profile_systemfilename);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("n", 1);
		
		return jsonobj.toString();
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/getWorkinghour.up")
	public String getWorkinghour(HttpServletRequest request){
		
		String employee_no = request.getParameter("employee_no");
		
		// 해당 사원의 오늘 근무시간 알아오기
		String s_working_min = service.getWorkinghour(employee_no);
		JSONObject jsonobj = new JSONObject();
		
		try {
			
			int working_min = Integer.parseInt(s_working_min);
			int working_h = working_min/60;
			int working_m = working_min%60;
			jsonobj.put("working_h", working_h);
			jsonobj.put("working_m", working_m);
			
		} catch (NumberFormatException e) { // 결과값이 없는 경우
			jsonobj.put("working_h", "");
		}
		return jsonobj.toString();
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/mailCheck.up")
	public String mailCheck(String email) {
		return mailService.joinEmail(email);
	}//end of mailCheck
	
	@RequestMapping(value="/memberRegisterEnd.up", method= {RequestMethod.POST})
	public ModelAndView memberRegisterEnd(HttpServletRequest request, ModelAndView mav, EmployeeVO evo) throws Throwable {
		
		evo.setEmail(aes.encrypt(evo.getEmail()));
		evo.setPasswd(Sha256.encrypt(evo.getPasswd()));
		
		// 사원번호 채번해오기
		String employee_no = service.getNewEmpno(evo.getFk_department_no());
		evo.setEmployee_no(employee_no);
		
		// 해당 정보로 사원테이블에 insert 해주기
		int n = service.memberRegister(evo);
		
		String message = "";
		String loc = "";
		
		if(n==1) {
			message = "회원가입해주셔서 감사합니다. 귀하의 아이디는 " + employee_no + "입니다.";
			loc = request.getContextPath() + "/login.up";
		} else {
			message = "회원가입이 실패하였습니다.";
			loc = "history.back()";
		}
		
		mav.addObject("message", message);
		mav.addObject("loc", loc);
		mav.setViewName("message");
		return mav;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/mailPwdCheck.up")
	public String mailPwdCheck(String email) {
		return mailService.findPwd(email);
	}//end of mailCheck
	
	
	@ResponseBody
	@RequestMapping(value="/getEmployeeInfo.up")
	public String getEmployeeInfo(HttpServletRequest request, EmployeeVO evo) throws Throwable{
		
		evo.setEmail(aes.encrypt(evo.getEmail()));

		//해당 정보의 사원 가져오기
		String employee_no = service.getEmployeeInfo(evo);
		if(employee_no == null) employee_no = "";
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("employee_no", employee_no);
		
		return jsonobj.toString();
	}//end of getEmployeeInfo
	
	
	@ResponseBody
	@RequestMapping(value="/getMyPassword.up")
	public String getMyPassword(HttpServletRequest request, @RequestParam String employee_no, @RequestParam String inputpasswd) throws Throwable{
		
		// employee_no의 비밀번호 알아오기
		String pwd = service.getMyPassword(employee_no);
		
		int n = 0;
		if(Sha256.encrypt(inputpasswd).equals(pwd)) {
			n = 1;
		} 
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("n", n);
		return jsonobj.toString();
	}
	
	
	@ResponseBody
	@RequestMapping(value="/updateMyPwd.up", method = RequestMethod.POST)
	public String updateMyPwd(@RequestParam Map<String,String> paraMap, HttpServletRequest request) {
		
		
		System.out.println("파라맵 newPasswd : " + paraMap.get("newPasswd"));
		
		paraMap.put("newPasswd", Sha256.encrypt(paraMap.get("newPasswd")));
		// 비밀번호 업데이트해주기
		int n = service.updateMyPwd(paraMap);
		
		
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("n", n);
		return jsonobj.toString();
	}
	
	
	
	
}
