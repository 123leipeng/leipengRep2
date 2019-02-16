package com.peng.entity;

import java.io.Serializable;

public class Teacher implements Serializable{

	private String tname;
	private String tid;
	private String tacademy;
	private String phone;
	private String phonetow;
	private String qq;
	private String emil;
	private String password;
	private String classes;
	
	
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getTacademy() {
		return tacademy;
	}
	public void setTacademy(String tacademy) {
		this.tacademy = tacademy;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPhonetow() {
		return phonetow;
	}
	public void setPhonetow(String phonetow) {
		this.phonetow = phonetow;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getEmil() {
		return emil;
	}
	public void setEmil(String emil) {
		this.emil = emil;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getClasses() {
		return classes;
	}
	public void setClasses(String classes) {
		this.classes = classes;
	}
	
	
}
