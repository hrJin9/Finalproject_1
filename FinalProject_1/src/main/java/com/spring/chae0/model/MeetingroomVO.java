package com.spring.chae0.model;


public class MeetingroomVO {
	
	private String 	roomno;        	  // 회의실 번호
	private String 	room_name;     	  // 회의실 명
	private String 	room_info;     	  // 회의실 정보
	private String 	room_status;      // 회의실 상태 
	
	
	public MeetingroomVO() {} 
	
	


	public MeetingroomVO(String roomno, String room_name, String room_info, String room_status) {
		super();
		this.roomno = roomno;
		this.room_name = room_name;
		this.room_info = room_info;
		this.room_status = room_status;
	}




	public String getRoomno() {
		return roomno;
	}


	public void setRoomno(String roomno) {
		this.roomno = roomno;
	}


	public String getRoom_name() {
		return room_name;
	}


	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}


	public String getRoom_info() {
		return room_info;
	}


	public void setRoom_info(String room_info) {
		this.room_info = room_info;
	}


	public String getRoom_status() {
		return room_status;
	}


	public void setRoom_status(String room_status) {
		this.room_status = room_status;
	}

	
	
	
	
}
