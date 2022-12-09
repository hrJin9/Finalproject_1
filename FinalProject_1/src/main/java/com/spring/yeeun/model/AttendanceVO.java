package com.spring.yeeun.model;

public class AttendanceVO {

	private String adno;            // 근태번호
	private String fk_employee_no;  // 사원번호
	private String adcatgo;         // 근태유형
	private String startTime;       // 시작시간
	private String endTime;         // 종료시간
	
	private String seldate;   // 선택한 날짜
	private String workTime;  // 근무 시간
	private String workMin;   // 근무 분
	private String totalTime; // 총 근무시간
	
	public AttendanceVO() {}

	public AttendanceVO(String adno, String fk_employee_no, String adcatgo, String startTime, String endTime,
			String seldate, String workTime, String workMin, String totalTime) {
		super();
		this.adno = adno;
		this.fk_employee_no = fk_employee_no;
		this.adcatgo = adcatgo;
		this.startTime = startTime;
		this.endTime = endTime;
		this.seldate = seldate;
		this.workTime = workTime;
		this.workMin = workMin;
		this.totalTime = totalTime;
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

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getSeldate() {
		return seldate;
	}

	public void setSeldate(String seldate) {
		this.seldate = seldate;
	}

	public String getWorkTime() {
		return workTime;
	}

	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}

	public String getWorkMin() {
		return workMin;
	}

	public void setWorkMin(String workMin) {
		this.workMin = workMin;
	}

	public String getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(String totalTime) {
		this.totalTime = totalTime;
	}

	
	
	
	
	
	
	
}
