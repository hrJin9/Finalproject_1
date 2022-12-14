package com.spring.jieun.model;

public class WorkDocVO {

	private String wdno;            // 업무기안문서번호
	private String fk_employee_no;  // 문서작성 사원번호
	private String fk_ano; 			// 결재문서번호  --> 결재문서 insert할때 채번해서 한번에 넣기 
	private String executedate; 	// 업무시행일
	private String deptname; 		// 협조부서
	
	public String getWdno() {
		return wdno;
	}
	public void setWdno(String wdno) {
		this.wdno = wdno;
	}
	public String getFk_employee_no() {
		return fk_employee_no;
	}
	public void setFk_employee_no(String fk_employee_no) {
		this.fk_employee_no = fk_employee_no;
	}
	public String getFk_ano() {
		return fk_ano;
	}
	public void setFk_ano(String fk_ano) {
		this.fk_ano = fk_ano;
	}
	public String getExecutedate() {
		return executedate;
	}
	public void setExecutedate(String executedate) {
		this.executedate = executedate;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
}
