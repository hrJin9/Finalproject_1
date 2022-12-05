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
	private String status;
	private String depthno;
	private String w_name;
	private String w_dept;
	private String profile_orginfilename;
	private String filecnt;
	private String scrapstatus;
	private String writer_scrapstatus;
	
	
	private MultipartFile attach;
	
	
	public MessageVO() {}
	
	public MessageVO(String mno, String writer, String mgroup, String reno, String subject, String content,
			String status, MultipartFile attach) {
		this.mno = mno;
		this.writer = writer;
		this.mgroup = mgroup;
		this.reno = reno;
		this.subject = subject;
		this.content = content;
		this.status = status;
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


	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public MultipartFile getAttach() {
		return attach;
	}

	public void setAttach(MultipartFile attach) {
		this.attach = attach;
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

	public String getSendtime() {
		return sendtime;
	}

	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}

	public String getDepthno() {
		return depthno;
	}

	public void setDepthno(String depthno) {
		this.depthno = depthno;
	}

	public String getScrapstatus() {
		return scrapstatus;
	}

	public void setScrapstatus(String scrapstatus) {
		this.scrapstatus = scrapstatus;
	}

	public String getWriter_scrapstatus() {
		return writer_scrapstatus;
	}

	public void setWriter_scrapstatus(String writer_scrapstatus) {
		this.writer_scrapstatus = writer_scrapstatus;
	}
	
	
	
	
	
	
	
}
