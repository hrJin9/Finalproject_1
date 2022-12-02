package com.spring.yeeun.model;

public class AttendanceVO {

	private String adno;         // 근태번호
	private String fk_employee_no;  // 사원번호
	private String adcatgo;      // 근태종류
	private String startdate;    // 시작시간
	private String enddate;      // 종료시간
	
	public AttendanceVO() {}

	public AttendanceVO(String adno, String fk_employee_no, String adcatgo, String startdate, String enddate) {
		super();
		this.adno = adno;
		this.fk_employee_no = fk_employee_no;
		this.adcatgo = adcatgo;
		this.startdate = startdate;
		this.enddate = enddate;
	}

	public String getAdno() {
		return adno;
	}

	public void setAdno(String adno) {
		this.adno = adno;
	}

	public String getFk_employee_no() {
		return fk_employee_no;
	}

	public void setFk_employee_no(String fk_employee_no) {
		this.fk_employee_no = fk_employee_no;
	}

	public String getAdcatgo() {
		return adcatgo;
	}

	public void setAdcatgo(String adcatgo) {
		this.adcatgo = adcatgo;
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
	
	
	
	
}
