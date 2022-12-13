package com.spring.yeeun.model;

public class BoardHeartVO {
	
	private String hno;              // 좋아요번호
	private String bno;              // 게시판번호
	private String fk_employee_no;   // 좋아요한 사원번호
	
	public BoardHeartVO() {}

	public BoardHeartVO(String hno, String bno, String fk_employee_no) {
		super();
		this.hno = hno;
		this.bno = bno;
		this.fk_employee_no = fk_employee_no;
	}

	public String getHno() {
		return hno;
	}

	public void setHno(String hno) {
		this.hno = hno;
	}

	public String getBno() {
		return bno;
	}

	public void setBno(String bno) {
		this.bno = bno;
	}

	public String getFk_employee_no() {
		return fk_employee_no;
	}

	public void setFk_employee_no(String fk_employee_no) {
		this.fk_employee_no = fk_employee_no;
	}

	

}

