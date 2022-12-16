package com.spring.news.websockethandler;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	//로그인 한 인원 전체
	private List<WebSocketSession> connectedUsers = new ArrayList<WebSocketSession>();
	// 1:1로 할 경우
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	// init-metod
//	public void init() throws Exception{}
	
	//서버에 접속이 성공 했을때
	@Override
	public void afterConnectionEstablished(WebSocketSession wsession) throws Exception {//클라이언트와 서버가 연결
		logger.info("Socket 연결");
		System.out.println("Socket 연결");
		connectedUsers.add(wsession);// 쌓아두기
		logger.info(currentUserName(wsession));//현재 접속한 사람
		String senderId = currentUserName(wsession);
		userSessionsMap.put(senderId,wsession);
	}
	
	//소켓에 메세지를 보냈을때
	@Override
	protected void handleTextMessage(WebSocketSession wsession, TextMessage message) throws Exception {// 메시지

		//protocol : cmd , 댓글작성자, 게시글 작성자 , seq (reply , user2 , user1 , 12)
		
		String msg = message.getPayload(); // => 자바스크립트 객체를 String 으로 변환
		if(!msg.isEmpty()) {
			String[] strs = msg.split(",");
			
			if(strs != null && strs.length == 5) {
				String cmd = strs[0]; // 분류 
				String caller = strs[1]; // 보낸이 
				String receiver = strs[2];// 받는이 
				String receiverEmail = strs[3]; // 
				String seq = strs[4]; // 문서번호(시퀀스) 
				
				// 받는이가 로그인해있으면   
				WebSocketSession boardWriterSession = userSessionsMap.get(receiverEmail);
				
				if("approval_add".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(
										"<a type='external' href='thumbsup/approval/requested'>" + caller + "님이 결재상신을 했습니다.</a>");
					boardWriterSession.sendMessage(tmpMsg);
//				
//				}else if("follow".equals(cmd) && boardWriterSession != null) {
//					TextMessage tmpMsg = new TextMessage(caller + "님이 " + receiver +
//							 "님을 팔로우를 시작했습니다.");
//					boardWriterSession.sendMessage(tmpMsg);
//					
//				}else if("scrap".equals(cmd) && boardWriterSession != null) {
//					TextMessage tmpMsg = new TextMessage(caller + "님이 " +
//										//변수를 하나더 보낼수 없어서 receiver 변수에 member_seq를 넣어서 썼다.
//										"<a type='external' href='/mentor/essayboard/essayboardView?pg=1&seq="+seq+"&mentors="+ receiver +"'>" + seq + "</a>번 에세이를 스크랩 했습니다.");
//					boardWriterSession.sendMessage(tmpMsg);
				}
			}
			// 모임 신청 했을때
//			if(strs != null && strs.length == 5) {
//				String cmd = strs[0];
//				String mentee_name = strs[1];
//				String mentor_email = strs[2];
//				String meetingboard_seq = strs[3];
//				String participation_seq = strs[4];
//				
//				// 모임 작성한 멘토가 로그인 해있으면
//				WebSocketSession mentorSession = userSessionsMap.get(mentor_email);
//				if(cmd.equals("apply") && mentorSession != null) {
//					TextMessage tmpMsg = new TextMessage(
//							mentee_name + "님이 모임을 신청했습니다. " +"<a type='external' href='/mentor/participation/participationView?mseq="+ meetingboard_seq +"&pseq="+ participation_seq +"'>신청서 보기</a>");
//					mentorSession.sendMessage(tmpMsg);
//				}
//			}
		}
	}
	//연결 해제될때
	@Override
	public void afterConnectionClosed(WebSocketSession wsession, CloseStatus status) throws Exception {//연결 해제
		logger.info("Socket 끊음");
		connectedUsers.remove(wsession);
		userSessionsMap.remove(currentUserName(wsession),wsession);
	}

	//웹소켓 사원아이디 가져오기
	private String currentUserName(WebSocketSession wsession) {
		Map<String, Object> httpSession = wsession.getAttributes();
		EmployeeVO loginUser = (EmployeeVO)httpSession.get("loginuser");
		
		if(loginUser == null) {
			String empno = wsession.getId();
			return empno;
		}
		String empno = loginUser.getEmployee_no();
		return empno;
		
	}
}
