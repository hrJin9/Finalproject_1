package com.spring.hyerin.model;

public class MessageSendVO {
	private String msno;
	private String fk_mno;
	private String receiver;
	private String ms_sendtime;
	private String ms_checktime;
	
	public MessageSendVO(){}

	public MessageSendVO(String msno, String fk_mno, String receiver, String ms_sendtime, String ms_checktime) {
		super();
		this.msno = msno;
		this.fk_mno = fk_mno;
		this.receiver = receiver;
		this.ms_sendtime = ms_sendtime;
		this.ms_checktime = ms_checktime;
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
	
	
	
	
}
