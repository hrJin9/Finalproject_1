package com.spring.finalproject.common;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailSendService {
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	
	private int authNumber;
	//난수 만들기
	public void makeRandomNumber() {
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		authNumber = checkNum;
	}
	
	//이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) { 
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	//이메일 보낼 양식
	public String joinEmail(String email) {
		makeRandomNumber();
		String setFrom = "flexhyerin@gmail.com";
		String toMail = email;
		String title = "[Thumbs up] 회원가입 인증 이메일 입니다.";
		String content = 
			"Thumbs up에 방문해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
	        "<br><br>" + 
		    "회원가입 인증 번호는 <span style='color:#4285f4; font-size: 15pt; font-weight: bold;'>" + authNumber + "</span>입니다." + 
		    "<br>" + 
		    "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
	
	//이메일 보낼 양식
	public String changeEmail(String email) {
		makeRandomNumber();
		String setFrom = "flexhyerin@gmail.com";
		String toMail = email;
		String title = "[Thumbs up] 이메일변경 인증 이메일입니다.";
		String content = 
						"<br><br>" + 
						"비밀번호 변경 인증 번호는  <span style='color:#4285f4; font-size: 15pt; font-weight: bold;'>" + authNumber + "</span>입니다." + 
						"<br>" + 
						"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
	
	
	
}
