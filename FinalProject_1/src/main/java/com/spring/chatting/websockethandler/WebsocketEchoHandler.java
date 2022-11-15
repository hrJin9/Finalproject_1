package com.spring.chatting.websockethandler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


// === #198. (웹채팅관련8) === //

public class WebsocketEchoHandler extends TextWebSocketHandler {

	// 웹소켓서버에 연결한 클라이언트를 저장하는 리스트
	private List<WebSocketSession> connectedUsers = new ArrayList<WebSocketSession>();

	// init-method
	public void init() throws Exception {
	}

	// === 클라이언트가 웹소켓서버에 연결했을때의 작업 처리하기 ===
	/*
	 * afterConnectionEstablished(WebSocketSession wsession) 메소드는 클라이언트가 웹소켓서버에 연결이
	 * 되어지면 자동으로 실행되는 메소드로서 WebSocket 연결이 열리고 사용이 준비될 때 호출되어지는(실행되어지는) 메소드이다.
	 */

	@Override
	public void afterConnectionEstablished(WebSocketSession wsession) throws Exception {

	}

	@Override
	public void handleTextMessage(WebSocketSession wsession, TextMessage message) throws Exception {

	}
	
	
	// === 클라이언트가 웹소켓서버와의 연결을 끊을때 작업 처리하기 ===
	/*
	 * afterConnectionClosed(WebSocketSession session, CloseStatus status) 메소드는
	 * 클라이언트가 연결을 끊었을 때 즉, WebSocket 연결이 닫혔을 때(채팅페이지가 닫히거나 채팅페이지에서 다른 페이지로 이동되는 경우)
	 * 자동으로 호출되어지는(실행되어지는) 메소드이다.
	 */
	@Override
    public void afterConnectionClosed(WebSocketSession wsession, CloseStatus status) throws Exception {
	}//end of afterConnectionClosed

}