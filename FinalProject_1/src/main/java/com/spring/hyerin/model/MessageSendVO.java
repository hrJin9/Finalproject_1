package com.spring.hyerin.model;

public class MessageSendVO {
	private String msno;
	private String fk_mno;
	private String receiver;
	private String ms_sendtime;
	private String ms_checktime;
	private String r_name;
	private String r_dept;
	private String profile_orginfilename;
	private String delete_status;
	private String scrap_status;
	
	public MessageSendVO(){}
	
	public MessageSendVO(String msno, String fk_mno, String receiver, String ms_sendtime, String ms_checktime,
			String r_name, String r_dept, String profile_orginfilename, String delete_status, String scrap_status) {
		this.msno = msno;
		this.fk_mno = fk_mno;
		this.receiver = receiver;
		this.ms_sendtime = ms_sendtime;
		this.ms_checktime = ms_checktime;
		this.r_name = r_name;
		this.r_dept = r_dept;
		this.profile_orginfilename = profile_orginfilename;
		this.delete_status = delete_status;
		this.scrap_status = scrap_status;
	}




	public String getMsno() {
		return msno;
	}

	public void setMsno(String msno) {
		this.msno = msno;
	}

	public String getFk_mno() {
		return fk_mno;
	}

	public void setFk_mno(String fk_mno) {
		this.fk_mno = fk_mno;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getMs_sendtime() {
		return ms_sendtime;
	}

	public void setMs_sendtime(String ms_sendtime) {
		this.ms_sendtime = ms_sendtime;
	}

	public String getMs_checktime() {
		return ms_checktime;
	}

	public void setMs_checktime(String ms_checktime) {
		this.ms_checktime = ms_checktime;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public String getR_dept() {
		return r_dept;
	}

	public void setR_dept(String r_dept) {
		this.r_dept = r_dept;
	}

	public String getProfile_orginfilename() {
		return profile_orginfilename;
	}

	public void setProfile_orginfilename(String profile_orginfilename) {
		this.profile_orginfilename = profile_orginfilename;
	}

	public String getDelete_status() {
		return delete_status;
	}

	public void setDelete_status(String delete_status) {
		this.delete_status = delete_status;
	}

	public String getScrap_status() {
		return scrap_status;
	}

	public void setScrap_status(String scrap_status) {
		this.scrap_status = scrap_status;
	}

	
	
	
	
}
