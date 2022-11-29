package com.spring.chae0.model;


public class Calendar_largeVO {
	
	private String lgcatgono;   // 캘린더 대분류 번호
	private String lgcatgoname; // 캘린더 대분류 명
	
	
	
	public Calendar_largeVO() {}


	public Calendar_largeVO(String lgcatgono, String lgcatgoname) {
		super();
		this.lgcatgono = lgcatgono;
		this.lgcatgoname = lgcatgoname;
	}



	public String getLgcatgono() {
		return lgcatgono;
	}



	public void setLgcatgono(String lgcatgono) {
		this.lgcatgono = lgcatgono;
	}



	public String getLgcatgoname() {
		return lgcatgoname;
	}



	public void setLgcatgoname(String lgcatgoname) {
		this.lgcatgoname = lgcatgoname;
	}

	
	
}
