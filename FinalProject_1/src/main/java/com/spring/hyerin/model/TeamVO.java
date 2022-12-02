package com.spring.hyerin.model;

public class TeamVO {
	
	private String team_no;
	private String team_name;
	private String fk_department_no;
	private String manager_no;
	private String delete_status;
	
	public TeamVO() {}
	
	public TeamVO(String team_no, String team_name, String fk_department_no, String manager_no, String delete_status) {
		super();
		this.team_no = team_no;
		this.team_name = team_name;
		this.fk_department_no = fk_department_no;
		this.manager_no = manager_no;
		this.delete_status = delete_status;
	}
	public String getTeam_no() {
		return team_no;
	}
	public void setTeam_no(String team_no) {
		this.team_no = team_no;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public String getFk_department_no() {
		return fk_department_no;
	}
	public void setFk_department_no(String fk_department_no) {
		this.fk_department_no = fk_department_no;
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
