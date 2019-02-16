package com.peng.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peng.entity.Classes;
import com.peng.entity.Course;
import com.peng.entity.Question;
import com.peng.entity.Score;
import com.peng.entity.Student;

public interface StudentService {

	public Student selectStuByIdAndPwd(Long stuid , String password);
	
	public String selectStuPwdByStuid(Long stuid);
	
	public void updatePwd(Student student);
	
	public Classes findClassByid(String id);
	
	public List<Course> findCourseList(Long id);
	
	public List<Question> selectQuestionById(String id);
	
	public List<Score> findAllScoreByStuid(Long id);
	
	 public List<Course> findAllcourseNotCore(Long id);
	 
	 public void insertItemCourseStuSelect(Long stuid,String courseid);
	 
	 public List<Course> selectCourseSelectedAndisOpen(Long stuid);
	 
	 public void dropCourseStuSelected(Long stuid ,String courseid);
}
