package com.peng.dao;

import java.util.List;

import com.peng.entity.Student;

public interface StudentMapper {

	public Student selectStuByIdAndPwd(Student student);
	public String selectStuPwdByStuid(Long stuid);
	public void updatePwd(Student student);
	public List<Student> selectStudentInClass(String id);
	public Student selectStuById(Long stuid);
	public void updateStudent(Student student);
	
}
