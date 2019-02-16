package com.peng.entity;

import java.io.Serializable;

public class Course implements Serializable {

	private String courseid;
	private String coursename;
	private Integer coursescore;
	private String courseteacher;
	private String courseteacherid;
	private Integer courseday;
	private Integer coursetime;
	private String courseyear;
	private Boolean isopen;
	private int coursetype;

	
	public int getCoursetype() {
		return coursetype;
	}

	public void setCoursetype(int coursetype) {
		this.coursetype = coursetype;
	}

	public Boolean getIsopen() {
		return isopen;
	}

	public void setIsopen(Boolean isopen) {
		this.isopen = isopen;
	}

	public String getCourseyear() {
		return courseyear;
	}

	public void setCourseyear(String courseyear) {
		this.courseyear = courseyear;
	}

	public String getCourseid() {
		return courseid;
	}

	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public Integer getCoursescore() {
		return coursescore;
	}

	public void setCoursescore(Integer coursescore) {
		this.coursescore = coursescore;
	}

	public String getCourseteacher() {
		return courseteacher;
	}

	public void setCourseteacher(String courseteacher) {
		this.courseteacher = courseteacher;
	}

	public String getCourseteacherid() {
		return courseteacherid;
	}

	public void setCourseteacherid(String courseteacherid) {
		this.courseteacherid = courseteacherid;
	}

	public Integer getCourseday() {
		return courseday;
	}

	public void setCourseday(Integer courseday) {
		this.courseday = courseday;
	}

	public Integer getCoursetime() {
		return coursetime;
	}

	public void setCoursetime(Integer coursetime) {
		this.coursetime = coursetime;
	}

	@Override
	public String toString() {
		return "Course [courseid=" + courseid + ", coursename=" + coursename + ", coursescore=" + coursescore
				+ ", courseteacher=" + courseteacher + ", courseteacherid=" + courseteacherid + ", courseday="
				+ courseday + ", coursetime=" + coursetime + ", courseyear=" + courseyear + ", isopen=" + isopen
				+ ", coursetype=" + coursetype + "]";
	}

	

}
