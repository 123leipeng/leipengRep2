package com.peng.entity;

import java.io.Serializable;

public class Academy implements Serializable{
	
	private String aid;     
	private String aname;                        
	private String address;
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}   
	
}
