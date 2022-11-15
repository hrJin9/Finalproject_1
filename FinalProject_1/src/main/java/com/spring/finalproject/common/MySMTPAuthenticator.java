package com.spring.finalproject.common;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

//=== #187. Spring Scheduler(스프링스케줄러5) 를 사용한 email 발송 => email을 보내주는 클래스 생성
public class MySMTPAuthenticator extends Authenticator {

	@Override
	public PasswordAuthentication getPasswordAuthentication() {
		
		// Gmail 의 경우 @gmail.com 을 제외한 아이디만 입력한다.
		return new PasswordAuthentication("testhyerin25","xndotuxgpenikyhd");
		// "자기것" 은 Goole에 로그인 하기 위한 앱비밀번호 이다.
	}
	
}
