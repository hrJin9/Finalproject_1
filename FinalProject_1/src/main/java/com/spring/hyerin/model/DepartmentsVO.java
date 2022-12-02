package com.spring.hyerin.model;

public class DepartmentsVO {
	
	private String department_no;
	private String department_name;
	private String manager_no;
	private String delete_status;
	
	
	public DepartmentsVO() {}
	
	public DepartmentsVO(String department_no, String department_name, String manager_no, String delete_status) {
		super();
		this.department_no = department_no;
		this.department_name = department_name;
		this.manager_no = manager_no;
		this.delete_status = delete_status;
	}
	public String getDepartment_no() {
		return department_no;
	}
	public void setDepartment_no(String department_no) {
		this.department_no = department_no;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public String getManager_no() {
		return manager_no;
	}
	public void setManager_no(String manager_no) {
		this.manager_no = manager_no;
	}
	public String getDelete_status() {
		return delete_status;
	}
	public void setDelete_status(String delete_status) {
		this.delete_status = delete_status;
	}
	
	
	
	
}
