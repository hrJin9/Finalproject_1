package com.spring.schedule.model;

public class Calendar_large_category_VO {

	private String lgcatgono;   // 캘린더 대분류 번호
	private String lgcatgoname; // 캘린더 대분류 명
	
	
	 
	public Calendar_large_category_VO() {}


	public Calendar_large_category_VO(String lgcatgono, String lgcatgoname) {
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
