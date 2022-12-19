package com.spring.jieun.model;

public class AlarmVO {

	
	private String amno; 		  //알람시퀀스 
	private String from_empname; //알람 보낸 사원이름 
	private String to_empno;	 //받은 사원번호 
	private String ctgy ; 			//알람분류(	1-1:게시판공지등록, 1-2:게시판쓴글댓글, 1-3:게시판댓글 대댓글
		                          //		2-1:결재상신    , 2-2:승인반려알림 
		                          //		3:메시지수신 )
	private String linkno; 			// 글번호(각테이블 pk)
	private String readyn; 			//알림 읽었는지 유무 (0:안읽음 1:읽음)
	private String ctnt; 			//내용 
	private String registerdate; 	//등록날짜  
	
	
	public String getRegisterdate() {
		return registerdate;
	}
	public void setRegisterdate(String registerdate) {
		this.registerdate = registerdate;
	}
	public String getCtnt() {
		return ctnt;
	}
	public void setCtnt(String ctnt) {
		this.ctnt = ctnt;
	}
	public String getAmno() {
		return amno;
	}
	public void setAmno(String amno) {
		this.amno = amno;
	}
	public String getFrom_empname() {
		return from_empname;
	}
	public void setFrom_empname(String from_empname) {
		this.from_empname = from_empname;
	}
	public String getTo_empno() {
		return to_empno;
	}
	public void setTo_empno(String to_empno) {
		this.to_empno = to_empno;
	}
	public String getCtgy() {
		return ctgy;
	}
	public void setCtgy(String ctgy) {
		this.ctgy = ctgy;
	}
	public String getLinkno() {
		return linkno;
	}
	public void setLinkno(String linkno) {
		this.linkno = linkno;
	}
	public String getReadyn() {
		return readyn;
	}
	public void setReadyn(String readyn) {
		this.readyn = readyn;
	}
	
	
	
}
