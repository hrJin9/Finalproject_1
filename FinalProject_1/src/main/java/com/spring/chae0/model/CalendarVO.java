package com.spring.chae0.model;


public class CalendarVO {
	
	private String 	calno;  		  // 일정관리 번호(캘린더번호)
	private String 	startdate;       // 시작일자
	private String 	enddate;         // 종료일자
	private String 	subject;         // 제목
	private String 	content;         // 내용
	private String 	place;           // 장소
	private String 	color;           // 반복주기
	private String 	joinuser;        // 공유자		
	private String 	fk_smcatgono;    // 캘린더 소분류 번호
	private String 	fk_lgcatgono;    // 캘린더 대분류 번호
	private String 	fk_employee_no;  // 캘린더 일정 작성자 유저아이디(사원번호)
	private String 	c_authority;     // 권한
	
	
	public CalendarVO() {}

	public CalendarVO(String calno, String startdate, String enddate, String subject, String content, String place,
			String color, String joinuser, String fk_smcatgono, String fk_lgcatgono, String fk_employee_no,
			String c_authority) {
		super();
		this.calno = calno;
		this.startdate = startdate;
		this.enddate = enddate;
		this.subject = subject;
		this.content = content;
		this.place = place;
		this.color = color;
		this.joinuser = joinuser;
		this.fk_smcatgono = fk_smcatgono;
		this.fk_lgcatgono = fk_lgcatgono;
		this.fk_employee_no = fk_employee_no;
		this.c_authority = c_authority;
	}
	
	

	public String getCalno() {
		return calno;
	}

	public void setCalno(String calno) {
		this.calno = calno;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getJoinuser() {
		return joinuser;
	}

	public void setJoinuser(String joinuser) {
		this.joinuser = joinuser;
	}

	public String getFk_smcatgono() {
		return fk_smcatgono;
	}

	public void setFk_smcatgono(String fk_smcatgono) {
		this.fk_smcatgono = fk_smcatgono;
	}

	public String getFk_lgcatgono() {
		return fk_lgcatgono;
	}

	public void setFk_lgcatgono(String fk_lgcatgono) {
		this.fk_lgcatgono = fk_lgcatgono;
	}

	public String getFk_employee_no() {
		return fk_employee_no;
	}

	public void setFk_employee_no(String fk_employee_no) {
		this.fk_employee_no = fk_employee_no;
	}

	public String getC_authority() {
		return c_authority;
	}

	public void setC_authority(String c_authority) {
		this.c_authority = c_authority;
	}
	
	
	
	
}
