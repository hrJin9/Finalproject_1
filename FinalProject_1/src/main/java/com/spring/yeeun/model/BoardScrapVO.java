package com.spring.yeeun.model;

public class BoardScrapVO {
	private String sno;     // 스크랩번호
	private String fk_bno;  // 스크랩한 게시물번호(공지, 자유)
	private String btype;   // 스크랩한 게시판 분류  0:공지, 1:자유
	private String fk_employee_no;  // 스크랩한 사원번호
	
	public BoardScrapVO() {}

	public BoardScrapVO(String sno, String fk_bno, String btype, String fk_employee_no) {
		super();
		this.sno = sno;
		this.fk_bno = fk_bno;
		this.btype = btype;
		this.fk_employee_no = fk_employee_no;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
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
