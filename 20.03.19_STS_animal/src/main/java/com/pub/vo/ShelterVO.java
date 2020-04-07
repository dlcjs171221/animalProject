package com.pub.vo;

public class ShelterVO {

	private String s_idx,s_area,s_name,s_tel,s_addr;
	
	public ShelterVO(){};

	public ShelterVO(String s_idx, String s_area, String s_name, String s_tel, String s_addr) {
		this.s_idx = s_idx;
		this.s_area = s_area;
		this.s_name = s_name;
		this.s_tel = s_tel;
		this.s_addr = s_addr;
	}

	public String getS_idx() {
		return s_idx;
	}

	public void setS_idx(String s_idx) {
		this.s_idx = s_idx;
	}

	public String getS_area() {
		return s_area;
	}

	public void setS_area(String s_area) {
		this.s_area = s_area;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getS_tel() {
		return s_tel;
	}

	public void setS_tel(String s_tel) {
		this.s_tel = s_tel;
	}

	public String getS_addr() {
		return s_addr;
	}

	public void setS_addr(String s_addr) {
		this.s_addr = s_addr;
	}
	
	
}
