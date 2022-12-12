package com.spring.hyerin.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.finalproject.common.AES256;
import com.spring.finalproject.common.Sha256;
import com.spring.finalproject.service.InterFinalprojectService;
import com.spring.hyerin.model.EmployeeVO;
import com.spring.hyerin.service.InterLoginService;

@Controller
public class LoginController {
	@Autowired
	private InterLoginService service;
	
	@Autowired
	private AES256 aes;
	
	@RequestMapping(value = "/login.up")
	public ModelAndView login(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("login/login");
		return mav;
	}
	
	@RequestMapping(value = "/loginEnd.up", method= {RequestMethod.POST})
	public ModelAndView loginEnd(HttpServletRequest request, ModelAndView mav) throws Throwable  {
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("userid", userid);
		paraMap.put("pwd", Sha256.encrypt(passwd));
		
		// 로그인한 유저 알아보기
		EmployeeVO loginuser = service.getLoginMember(paraMap);
		
		if(loginuser == null) { //로그인 실패시
			String message = "아이디 또는 비밀번호를 다시 입력해주세요.";
			String loc = "javascript:history.back()";
			mav.addObject("message", message);
			mav.addObject("loc", loc);
			mav.setViewName("msg");
		} else { // 로그인성공시
			loginuser.setEmail(aes.decrypt(loginuser.getEmail()) );
			try {
				loginuser.setMobile(aes.decrypt(loginuser.getMobile()));
			} catch (Exception e) {
			}
			// 세션에 로그인유저 정보 저장하기
			HttpSession session = request.getSession();
			session.setAttribute("loginuser", loginuser);
			session.setAttribute("dayoff_cnt", loginuser.getDayoff_cnt());
			
			// 로그인하지 않고 접근한 경우
			String goBackURL = (String) session.getAttribute("goBackURL");
			if (goBackURL != null) { // 보던 페이지가 있는 경우
				mav.setViewName("redirect:" + goBackURL);
				session.removeAttribute("goBackURL"); // 세션에서 제거
			} else { //보던 페이지가 없는 경우
				mav.setViewName("redirect:/");
			}
		}
		return mav;
		
		
	}//end of loginEnd
	
	
	
	// 로그아웃 처리하기
	@RequestMapping(value = "/logout.up")
	public ModelAndView logout(HttpServletRequest request, ModelAndView mav) {
		// 로그아웃시 로그아웃 전에 보던 페이지로 이동
		HttpSession session = request.getSession();
		String goBackURL = (String) session.getAttribute("goBackURL");
		session.invalidate();
		
		String loc = "";
		if (goBackURL != null) {
			loc = request.getContextPath() + goBackURL;
		} else {
			loc = request.getContextPath() + "/login.up";
		}
		
		mav.addObject("loc", loc);
		mav.setViewName("msg"); // WEB-INF/views/msg.jsp
		return mav;
	}// end of logout
	
	
	
	@RequestMapping(value = "/login/pwdFind.up")
	public String pwdFind(HttpServletRequest request) {
		return "login/pwdFind";
	}
	
	@RequestMapping(value = "/login/pwdFind_update.up")
	public String pwdFind_update(HttpServletRequest request) {
		return "login/pwdFind_update";
	}
	
}
