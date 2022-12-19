package com.spring.news.websockethandler;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.spring.hyerin.model.EmployeeVO;

public class EchoHandler extends TextWebSocketHandler{
//
//
//	@Autowired
//	private AlarmDAO alarmDAO;
//	public void setAlarmDAO(AlarmDAO alarmDAO) {
//		this.alarmDAO = alarmDAO;
//	}
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	
	// 로그인중인 개별유저
	Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
	//로그인 한 전체
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
		
	// init-metod
//	public void init() throws Exception{}
	
	//서버에 접속이 성공 했을때
	@Override
	public void afterConnectionEstablished(WebSocketSession wsession) throws Exception {//클라이언트와 서버가 연결
		sessions.add(wsession);
		
		String senderId = getMemberId(wsession); // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
		if(senderId!=null) {	// 로그인 값이 있는 경우만
			System.out.println(senderId + " 연결 됨");
			users.put(senderId, wsession);   // 로그인중 개별유저 저장
		}
		
	}
	
	//소켓에 메세지를 보냈을때
	@Override
	protected void handleTextMessage(WebSocketSession wsession, TextMessage message) throws Exception {// 메시지
		
		String senderId = getMemberId(wsession);
		// 특정 유저에게 보내기(보내는이)
		System.out.println("senderId => "+senderId);
		//protocol : cmd , 댓글작성자, 게시글 작성자 , seq (reply , user2 , user1 , 12)
		String msg = message.getPayload(); // => 자바스크립트 객체를 String 으로 변환
		if(msg!= null) {
			String[] strs = msg.split(",");
			
			if(strs != null && strs.length == 5) {
				String ctgy = strs[0]; // 분류 
				String ctnt = strs[1]; // 내용 
				String from_Empname = strs[2]; // 보낸이 이름  
				String to_Empno = strs[3];// 받는이 사원번호 
				String linkno = strs[4]; // 문서번호(pk) 
				
				// 받는이가 로그인해있으면   
				WebSocketSession targetSession = users.get(to_Empno);  // 메시지를 받을 세션 조회
				
//				알람분류(1-1:게시판공지등록, 1-2:게시판쓴글댓글, 1-3:게시판댓글 대댓글
//                     2-1:결재상신    , 2-2:승인알림, 	   2-3:반려알림  
//                     3-1:메시지수신 )
//				text = "<a type='external' href='thumbsup/approval/requested'>" + from_Empname + "님이 새로운 공지글을 게시했어요.</a>";
				
				String ctgy_str = "";
				String text ="";
				// 실시간 접속시
				if(targetSession!=null) {
					
					switch (ctgy) {
					case "1-1":
						ctgy_str = "공지등록";
						text = from_Empname + "님이 새로운 공지글을 게시했어요.";
						break;
					case "1-2":
						ctgy_str = "댓글";
						text = from_Empname + "님이 댓글을 달았어요.";
						break;
					case "1-3":
						ctgy_str = "대댓글";
						text = from_Empname + "님이 대댓글을 달았어요.";
						break;
					case "2-1":
						ctgy_str = "결재상신";
						text = from_Empname + "님이 '"+ ctnt +"'의 승인을 요청했어요.";
						break;
					case "2-2":
						ctgy_str = "승인";
						text = ctnt + "'이 승인이 완료되었어요.";
						break;
					case "2-3":
						ctgy_str = "반려";
						text = ctnt + "'이 반려되었어요.";
						break;
					case "3-1":
						ctgy_str = "메시지수신";
						text = from_Empname + "님이 메시지를 남겼어요.";
						break;
					}
				
					// '비품신청'의 승인이 완료되었습니다.
					//TextMessage tmpMsg = new TextMessage("<a target='_blank' href='"+ url +"'>[<b>" + type + "</b>] " + content + "</a>" );
					TextMessage tmpMsg = new TextMessage(text);
					System.out.println("tmpMsg => "+ tmpMsg);
					targetSession.sendMessage(tmpMsg);
				}
			}
			
		}
	}
	//연결 해제될때
	@Override
	public void afterConnectionClosed(WebSocketSession wsession, CloseStatus status) throws Exception {
		String senderId = getMemberId(wsession);
		if(senderId!=null) {	// 로그인 값이 있는 경우만
			//log(senderId + " 연결 종료됨");
			System.out.println(senderId + " 연결 종료됨");
			users.remove(senderId);
			sessions.remove(wsession);
		}
	}

	
	
	private String getMemberId(WebSocketSession wsession) throws Exception {
		Map<String, Object> httpSession = wsession.getAttributes();
		EmployeeVO loginUser = (EmployeeVO)httpSession.get("loginuser");
		String m_id = null;
		if(loginUser != null) {
			m_id = loginUser.getEmployee_no();
		} 
		//System.out.println("m_id => "+m_id);
		return m_id==null? null: m_id;
	}
}
