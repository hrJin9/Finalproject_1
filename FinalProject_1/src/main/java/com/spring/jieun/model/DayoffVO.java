package com.spring.jieun.model;

public class DayoffVO {

	
	private String dono;         // 연차번호
	private int fk_employee_no;  // 사원번호
	private String fk_ano;  // 결재문서번호  --> 결재문서 insert할때 채번해서 한번에 넣기 
	private int docnt;           // 연차수
	private String docatgo;      //  연차유형
	private String startdate;    //  연차시작일
	private String enddate;      //  연차종료일

	public DayoffVO() {}

	public DayoffVO(String dono, int fk_employee_no, String fk_ano, int docnt, String docatgo, String startdate,
			String enddate) {
		super();
		this.dono = dono;
		this.fk_employee_no = fk_employee_no;
		this.fk_ano = fk_ano;
		this.docnt = docnt;
		this.docatgo = docatgo;
		this.startdate = startdate;
		this.enddate = enddate;
	}

	public String getDono() {
		return dono;
	}

	public void setDono(String dono) {
		this.dono = dono;
	}

	public int getFk_employee_no() {
		return fk_employee_no;
	}

	public void setFk_employee_no(int fk_employee_no) {
		this.fk_employee_no = fk_employee_no;
	}

	public String getFk_ano() {
		return fk_ano;
	}

	public void setFk_ano(String fk_ano) {
		this.fk_ano = fk_ano;
	}

	public int getDocnt() {
		return docnt;
	}

	public void setDocnt(int docnt) {
		this.docnt = docnt;
	}

	public String getDocatgo() {
		return docatgo;
	}

	public void setDocatgo(String docatgo) {
		this.docatgo = docatgo;
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

