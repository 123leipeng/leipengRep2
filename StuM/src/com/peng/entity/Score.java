package com.peng.entity;

import java.io.Serializable;

public class Score implements Serializable {

	private String scoreid;
	private String courseid;
	private Long stuid;
	private Double paperscore;
	private Double usualscore;
	private Double allscore;
	private Course course;
	private Boolean isalter; 
	private Student student;
	
	
	@Override
	public String toString() {
		return "Score [scoreid=" + scoreid + ", courseid=" + courseid + ", stuid=" + stuid + ", paperscore="
				+ paperscore + ", usualscore=" + usualscore + ", allscore=" + allscore + ", course=" + course
				+ ", isalter=" + isalter + ", student=" + student + "]";
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Boolean getIsalter() {
		return isalter;
	}

	public void setIsalter(Boolean isalter) {
		this.isalter = isalter;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public String getScoreid() {
		return scoreid;
	}

	public void setScoreid(String scoreid) {
		this.scoreid = scoreid;
	}

	public String getCourseid() {
		return courseid;
	}

	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}

	public Long getStuid() {
		return stuid;
	}

	public void setStuid(Long stuid) {
		this.stuid = stuid;
	}

	public Double getPaperscore() {
		return paperscore;
	}

	public void setPaperscore(Double paperscore) {
		this.paperscore = paperscore;
	}

	public Double getUsualscore() {
		return usualscore;
	}

	public void setUsualscore(Double usualscore) {
		this.usualscore = usualscore;
	}

	public Double getAllscore() {
		return allscore;
	}

	public void setAllscore(Double allscore) {
		this.allscore = allscore;
	}

}
