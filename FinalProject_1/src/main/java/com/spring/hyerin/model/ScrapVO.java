package com.spring.hyerin.model;

public class ScrapVO {
	private String sno;
	private String tno;
	private String fk_employee_no;
	
	public ScrapVO() {}
	
	public ScrapVO(String sno, String tno, String fk_employee_no) {
		super();
		this.sno = sno;
		this.tno = tno;
		this.fk_employee_no = fk_employee_no;
	}


	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}

	public String getFk_employee_no() {
		return fk_employee_no;
	}
	public void setFk_employee_no(String fk_employee_no) {
		this.fk_employee_no = fk_employee_no;
	}
	
	
	
	
}
