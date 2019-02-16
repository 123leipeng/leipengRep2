package com.peng.entity;

import java.io.Serializable;

public class Question implements Serializable {

	private String qid;
	private Integer qnum;
	private String courseid;
	private String coursename;
	private Integer qscore;
	private Character qanswer;
	private String problem;
	private String A;
	private String B;
	private String C;
	private String D;
	public String getQid() {
		return qid;
	}
	public void setQid(String qid) {
		this.qid = qid;
	}
	public Integer getQnum() {
		return qnum;
	}
	public void setQnum(Integer qnum) {
		this.qnum = qnum;
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
	public Integer getQscore() {
		return qscore;
	}
	public void setQscore(Integer qscore) {
		this.qscore = qscore;
	}
	public Character getQanswer() {
		return qanswer;
	}
	public void setQanswer(Character qanswer) {
		this.qanswer = qanswer;
	}
	public String getProblem() {
		return problem;
	}
	public void setProblem(String problem) {
		this.problem = problem;
	}
	public String getA() {
		return A;
	}
	public void setA(String a) {
		A = a;
	}
	public String getB() {
		return B;
	}
	public void setB(String b) {
		B = b;
	}
	public String getC() {
		return C;
	}
	public void setC(String c) {
		C = c;
	}
	public String getD() {
		return D;
	}
	public void setD(String d) {
		D = d;
	}
	@Override
	public String toString() {
		return "Question [problem=" + problem + "]";
	}
	
	
	

}
