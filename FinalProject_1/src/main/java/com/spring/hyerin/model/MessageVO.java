package com.spring.hyerin.model;

import org.springframework.web.multipart.MultipartFile;

public class MessageVO {
	
	private String mno;
	private String writer;
	private String mgroup;
	private String reno;
	private String subject;
	private String content;
	private String m_systemfilename;
	private String m_originfilename;
	private String file_size;
	private String status;
	private String w_name;
	private String w_dept;
	private String profile_orginfilename;
	
	
	private MultipartFile attach;
	
	
	public MessageVO() {}
	
	public MessageVO(String mno, String writer, String mgroup, String reno, String subject, String content,
			String m_systemfilename, String m_originfilename, String file_size, String status, MultipartFile attach) {
		super();
		this.mno = mno;
		this.writer = writer;
		this.mgroup = mgroup;
		this.reno = reno;
		this.subject = subject;
		this.content = content;
		this.m_systemfilename = m_systemfilename;
		this.m_originfilename = m_originfilename;
		this.file_size = file_size;
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

	public String getM_systemfilename() {
		return m_systemfilename;
	}

	public void setM_systemfilename(String m_systemfilename) {
		this.m_systemfilename = m_systemfilename;
	}

	public String getM_originfilename() {
		return m_originfilename;
	}

	public void setM_originfilename(String m_originfilename) {
		this.m_originfilename = m_originfilename;
	}

	public String getFile_size() {
		return file_size;
	}

	public void setFile_size(String file_size) {
		this.file_size = file_size;
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
	
	
	
	
	
	
	
}
