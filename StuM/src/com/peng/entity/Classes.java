package com.peng.entity;

import java.io.Serializable;

public class Classes implements Serializable {
	private String cid;
	private String cacademy;
	private String cname;
	private String qq;
	private String slogan;
	private String cyear;
	private String cacademyname;
	private String cemil;
	private Teacher teacher;
	
	
	
	@Override
	public String toString() {
		return "Classes [cid=" + cid + ", cname=" + cname + "]";
	}

	
	public String getCemil() {
		return cemil;
	}


	public void setCemil(String cemil) {
		this.cemil = cemil;
	}


	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public String getCacademyname() {
		return cacademyname;
	}

	public void setCacademyname(String cacademyname) {
		this.cacademyname = cacademyname;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getCacademy() {
		return cacademy;
	}

	public void setCacademy(String cacademy) {
		this.cacademy = cacademy;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getSlogan() {
		return slogan;
	}

	public void setSlogan(String slogan) {
		this.slogan = slogan;
	}

	public String getCyear() {
		return cyear;
	}

	public void setCyear(String cyear) {
		this.cyear = cyear;
	}

}
