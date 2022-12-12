package com.spring.hyerin.model;

public class MessageFileVO {
	
	private String mfno;
	private String fk_mno;
	private String m_systemfilename;
	private String m_originfilename;
	private String file_size;
	
	public MessageFileVO() {}
	
	public MessageFileVO(String mfno, String fk_mno, String m_systemfilename, String m_originfilename,
			String file_size) {
		this.mfno = mfno;
		this.fk_mno = fk_mno;
		this.m_systemfilename = m_systemfilename;
		this.m_originfilename = m_originfilename;
		this.file_size = file_size;
	}
	public String getMfno() {
		return mfno;
	}
	public void setMfno(String mfno) {
		this.mfno = mfno;
	}
	public String getFk_mno() {
		return fk_mno;
	}
	public void setFk_mno(String fk_mno) {
		this.fk_mno = fk_mno;
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

	
	
}
