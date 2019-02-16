package com.peng.entity;

import java.io.Serializable;

public class Student implements Serializable {
 
	private String  idnum;              
	private String sname;   
	private String  sex;          
	private Long stuid ; 
	private String syd;           
	private String academy ;                     
	private String major;                     
	private String classes ;       
	private String rtime;   
	private String statu ; 
	private String phone;       
	private String phonetow;    
	private String qq;           
	private String emil;               
	private String address;                                           
	private String password;
	private String classesname;
	private String academyname;
	
	public String getClassesname() {
		return classesname;
	}
	public void setClassesname(String classesname) {
		this.classesname = classesname;
	}
	public String getAcademyname() {
		return academyname;
	}
	public void setAcademyname(String academyname) {
		this.academyname = academyname;
	}
	public String getIdnum() {
		return idnum;
	}
	public void setIdnum(String idnum) {
		this.idnum = idnum;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Long getStuid() {
		return stuid;
	}
	public void setStuid(Long stuid) {
		this.stuid = stuid;
	}
	public String getSyd() {
		return syd;
	}
	public void setSyd(String syd) {
		this.syd = syd;
	}
	public String getAcademy() {
		return academy;
	}
	public void setAcademy(String academy) {
		this.academy = academy;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getClasses() {
		return classes;
	}
	public void setClasses(String classes) {
		this.classes = classes;
	}
	public String getRtime() {
		return rtime;
	}
	public void setRtime(String rtime) {
		this.rtime = rtime;
	}
	public String getStatu() {
		return statu;
	}
	public void setStatu(String statu) {
		this.statu = statu;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Student [idnum=" + idnum + ", sname=" + sname + ", stuid=" + stuid + ", syd=" + syd + ", statu=" + statu
				+ ", phone=" + phone + ", phonetow=" + phonetow + ", qq=" + qq + ", emil=" + emil + ", address="
				+ address + "]";
	}

	
	 
	
	
}
