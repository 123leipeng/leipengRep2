package com.peng.service;

import java.util.List;

import com.peng.entity.Classes;
import com.peng.entity.Course;
import com.peng.entity.Score;
import com.peng.entity.Student;
import com.peng.entity.Teacher;
import com.peng.exception.MyException;

public interface TeacherService {

	public Teacher findTeacherByIdAndPwd(Teacher teacher);

	public List<Course> selectTeacherCourseList(String id);

	public Classes findClassByid(String id);

	public List<Student> selectStudentInClass(String id);

	public Student selectStuById(Long id);

	public void updateStudent(Student student);

	public List<Score> selectStuInClass(String id);

	public Score editScore(String id);

	public void updateScore(Score score);

	public void toAddCourse1(Course course) throws MyException;

	public List<Classes> findClassAlive();

	public void toAddCourse0(Course course,Classes classes) throws MyException;

}
