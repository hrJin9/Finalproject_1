package com.spring.chae0.model;


public class Calendar_smallVO {
	
	private String smcatgono;   	 // 캘린더 소분류 번호
	private String fk_lgcatgono;     // 캘린더 대분류 번호
	private String smcatgoname;      // 캘린더 소분류 명
	private String fk_employee_no;   // 캘린더 소분류 작성자 유저아이디(사원번호)
	
	
	public Calendar_smallVO() {}

	public Calendar_smallVO(String smcatgono, String fk_lgcatgono, String smcatgoname, String fk_employee_no) {
		super();
		this.smcatgono = smcatgono;
		this.fk_lgcatgono = fk_lgcatgono;
		this.smcatgoname = smcatgoname;
		this.fk_employee_no = fk_employee_no;
	}



	public String getSmcatgono() {
		return smcatgono;
	}

	public void setSmcatgono(String smcatgono) {
		this.smcatgono = smcatgono;
	}

	public String getFk_lgcatgono() {
		return fk_lgcatgono;
	}

	public void setFk_lgcatgono(String fk_lgcatgono) {
		this.fk_lgcatgono = fk_lgcatgono;
	}

	public String getSmcatgoname() {
		return smcatgoname;
	}

	public void setSmcatgoname(String smcatgoname) {
		this.smcatgoname = smcatgoname;
	}

	public String getFk_employee_no() {
		return fk_employee_no;
	}

	public void setFk_employee_no(String fk_employee_no) {
		this.fk_employee_no = fk_employee_no;
	}

	
	
	
	
}
