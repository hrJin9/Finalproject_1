package com.spring.chae0.model;


public class Meetingroom_reservationVO {
	
	private String 	reserno;			//회의실 예약번호
	private String 	r_date;				// 회의실 예약일
	private String 	startdate;			// 시작일자
	private String 	enddate;			// 종료일자 
	private String 	r_content;			// 예약내용
	private String 	r_status;			// 예약상태
	private String 	r_application;		// 신청일 
	private String 	fk_roomno;			// 회의실 번호  
	private String 	fk_employee_no;		// 사원번호
	
	
	
	public Meetingroom_reservationVO() {}


	public Meetingroom_reservationVO(String reserno, String r_date, String startdate, String enddate,
			String r_content, String r_status, String r_application, String fk_roomno, String fk_employee_no) {
		super();
		this.reserno = reserno;
		this.r_date = r_date;
		this.startdate = startdate;
		this.enddate = enddate;
		this.r_content = r_content;
		this.r_status = r_status;
		this.r_application = r_application;
		this.fk_roomno = fk_roomno;
		this.fk_employee_no = fk_employee_no;
	}





	public String getReserno() {
		return reserno;
	}



	public void setReserno(String reserno) {
		this.reserno = reserno;
	}



	public String getR_date() {
		return r_date;
	}



	public void setR_date(String r_date) {
		this.r_date = r_date;
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


	public String getR_content() {
		return r_content;
	}



	public void setR_content(String r_content) {
		this.r_content = r_content;
	}



	public String getR_status() {
		return r_status;
	}



	public void setR_status(String r_status) {
		this.r_status = r_status;
	}



	public String getR_application() {
		return r_application;
	}



	public void setR_application(String r_application) {
		this.r_application = r_application;
	}



	public String getFk_roomno() {
		return fk_roomno;
	}



	public void setFk_roomno(String fk_roomno) {
		this.fk_roomno = fk_roomno;
	}



	public String getFk_employee_no() {
		return fk_employee_no;
	}



	public void setFk_employee_no(String fk_employee_no) {
		this.fk_employee_no = fk_employee_no;
	} 
	

	
	
	
	
	
}
