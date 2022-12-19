package com.spring.yeeun.model;

public class BoardHeartVO {
	
	private String hno;        // 좋아요번호
	private String fk_bno;     // 게시판번호
	private String btype;   // 스크랩한 게시판 분류  0:공지, 1:자유
	private String fk_employee_no;  // 좋아요한 사원번호
	
	public BoardHeartVO() {}

	public BoardHeartVO(String hno, String fk_bno, String btype, String fk_employee_no) {
		super();
		this.hno = hno;
		this.fk_bno = fk_bno;
		this.btype = btype;
		this.fk_employee_no = fk_employee_no;
	}

	public String getHno() {
		return hno;
	}

	public void setHno(String hno) {
		this.hno = hno;
	}

	public String getFk_bno() {
		return fk_bno;
	}

	public void setFk_bno(String fk_bno) {
		this.fk_bno = fk_bno;
	}

	public String getBtype() {
		return btype;
	}

	public void setBtype(String btype) {
		this.btype = btype;
	}

	public String getFk_employee_no() {
		return fk_employee_no;
	}

	public void setFk_employee_no(String fk_employee_no) {
		this.fk_employee_no = fk_employee_no;
	}

	
	

}

