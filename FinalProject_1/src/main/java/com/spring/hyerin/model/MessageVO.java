package com.spring.hyerin.model;

import org.springframework.web.multipart.MultipartFile;

public class MessageVO {
	
	private String mno;
	private String writer;
	private String mgroup;
	private String reno;
	private String subject;
	private String content;
	private String sendtime;
	private String scrap_status;
	private String depthno;
	private String w_name;
	private String w_dept;
	private String profile_orginfilename;
	private String filecnt;
	private String delete_status;
	private String receiver_name;
	
	
	private MultipartFile attach;
	
	
	public MessageVO() {}
	
	

	public MessageVO(String mno, String writer, String mgroup, String reno, String subject, String content,
			String sendtime, String scrap_status, String depthno, String w_name, String w_dept,
			String profile_orginfilename, String filecnt, String delete_status, String receiver_name,
			MultipartFile attach) {
		this.mno = mno;
		this.writer = writer;
		this.mgroup = mgroup;
		this.reno = reno;
		this.subject = subject;
		this.content = content;
		this.sendtime = sendtime;
		this.scrap_status = scrap_status;
		this.depthno = depthno;
		this.w_name = w_name;
		this.w_dept = w_dept;
		this.profile_orginfilename = profile_orginfilename;
		this.filecnt = filecnt;
		this.delete_status = delete_status;
		this.receiver_name = receiver_name;
		this.attach = attach;
	}




	public String getMno() {
		return mno;
	}


	public void setMno(String mno) {
		this.mno = mno;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getMgroup() {
		return mgroup;
	}


	public void setMgroup(String mgroup) {
		this.mgroup = mgroup;
	}


	public String getReno() {
		return reno;
	}


	public void setReno(String reno) {
		this.reno = reno;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getSendtime() {
		return sendtime;
	}


	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}


	public String getScrap_status() {
		return scrap_status;
	}


	public void setScrap_status(String scrap_status) {
		this.scrap_status = scrap_status;
	}


	public String getDepthno() {
		return depthno;
	}


	public void setDepthno(String depthno) {
		this.depthno = depthno;
	}


	public String getW_name() {
		return w_name;
	}


	public void setW_name(String w_name) {
		this.w_name = w_name;
	}


	public String getW_dept() {
		return w_dept;
	}


	public void setW_dept(String w_dept) {
		this.w_dept = w_dept;
	}


	public String getProfile_orginfilename() {
		return profile_orginfilename;
	}


	public void setProfile_orginfilename(String profile_orginfilename) {
		this.profile_orginfilename = profile_orginfilename;
	}


	public String getFilecnt() {
		return filecnt;
	}


	public void setFilecnt(String filecnt) {
		this.filecnt = filecnt;
	}


	public String getDelete_status() {
		return delete_status;
	}


	public void setDelete_status(String delete_status) {
		this.delete_status = delete_status;
	}


	public String getReceiver_name() {
		return receiver_name;
	}


	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}


	public MultipartFile getAttach() {
		return attach;
	}


	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}
}
	
	