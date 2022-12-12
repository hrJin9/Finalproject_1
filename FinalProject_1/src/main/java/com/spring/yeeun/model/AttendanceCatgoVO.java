package com.spring.yeeun.model;

public class AttendanceCatgoVO {

	public int adcatgono;   // 근태종류번호
	public String adcatgo;  // 근태종류
	
	
	public AttendanceCatgoVO() {}

	public AttendanceCatgoVO(int adcatgono, String adcatgo) {
		super();
		this.adcatgono = adcatgono;
		this.adcatgo = adcatgo;
	}

	public int getAdcatgono() {
		return adcatgono;
	}

	public void setAdcatgono(int adcatgono) {
		this.adcatgono = adcatgono;
	}

	public String getAdcatgo() {
		return adcatgo;
	}

	public void setAdcatgo(String adcatgo) {
		this.adcatgo = adcatgo;
	}
	
	
	
}

