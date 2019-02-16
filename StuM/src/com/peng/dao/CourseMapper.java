package com.peng.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peng.entity.Course;
import com.peng.entity.QueryVo;
import com.peng.entity.Student;

public interface CourseMapper {

	public List<Course> findCourseList(Long id);
	
	public List<Course>  selectTeacherCourseList(String id);
	
	public Course  selectTeacherCourseConflict(Course course);
	
	public void toAddCourse(Course course);
	
    public List<Course> findAllcourseNotCore(@Param("id")Long id,@Param("year")String year);
	
	public void inserStudentAndCourse(@Param("list")List<QueryVo> list);
	
	public void inertItemInStuCourseStuSelect(QueryVo queryVo);
	
	public List<Course> selectCourseSelectedAndisOpen(Long stuid);
	
	public void dropCourse(QueryVo queryVo);
}
