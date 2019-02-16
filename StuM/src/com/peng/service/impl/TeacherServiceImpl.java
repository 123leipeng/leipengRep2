package com.peng.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peng.dao.ClassMapper;
import com.peng.dao.CourseMapper;
import com.peng.dao.ScoreMapper;
import com.peng.dao.StudentMapper;
import com.peng.dao.TeacherMapper;
import com.peng.entity.Classes;
import com.peng.entity.Course;
import com.peng.entity.QueryVo;
import com.peng.entity.Score;
import com.peng.entity.Student;
import com.peng.entity.Teacher;
import com.peng.exception.MyException;
import com.peng.service.TeacherService;

@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	private TeacherMapper teacherMapper;
	@Autowired
	private CourseMapper courseMapper;
	@Autowired
	private ClassMapper classMapper;
	@Autowired
	private StudentMapper studentMapper;
	@Autowired
	private ScoreMapper scoreMapper;

	@Override
	public Teacher findTeacherByIdAndPwd(Teacher teacher) {
		// TODO Auto-generated method stub
		return teacherMapper.findTeacherByIdAndPwd(teacher);
	}

	@Override
	public List<Course> selectTeacherCourseList(String id) {
		// TODO Auto-generated method stub
		return courseMapper.selectTeacherCourseList(id);
	}

	@Override
	public Classes findClassByid(String id) {
		// TODO Auto-generated method stub
		return classMapper.findClassByid(id);
	}

	@Override
	public List<Student> selectStudentInClass(String id) {
		// TODO Auto-generated method stub
		return studentMapper.selectStudentInClass(id);
	}

	@Override
	public Student selectStuById(Long id) {
		// TODO Auto-generated method stub
		return studentMapper.selectStuById(id);
	}

	@Override
	public void updateStudent(Student student) {
		// TODO Auto-generated method stub
		studentMapper.updateStudent(student);
	}

	@Override
	public List<Score> selectStuInClass(String id) {
		// TODO Auto-generated method stub
		List<Score> list = scoreMapper.selectStuInClass(id);
		return list;
	}

	@Override
	public Score editScore(String id) {
		// TODO Auto-generated method stub
		Score score = scoreMapper.editScore(id);
		return score;
	}

	@Override
	public void updateScore(Score score) {
		// TODO Auto-generated method stub
		scoreMapper.updateScore(score);

	}

	@Override
	public void toAddCourse1(Course course) throws MyException {
		// TODO Auto-generated method stub
		Course course1 = courseMapper.selectTeacherCourseConflict(course);
		if (course1 != null) {
			throw new MyException("添加失败:课程时间冲突");

		}
		courseMapper.toAddCourse(course);

	}

	@Override
	public List<Classes> findClassAlive() {
		// TODO Auto-generated method stub
		return classMapper.findClassAlive();
	}

	@Override
	public void toAddCourse0(Course course, Classes classes) throws MyException {
		// TODO Auto-generated method stub

		Course course1 = courseMapper.selectTeacherCourseConflict(course);
		if (course1 != null) {
			throw new MyException("添加失败:课程时间冲突");

		} else {
			courseMapper.toAddCourse(course);
			List<Student> students = studentMapper.selectStudentInClass(classes.getCid());
			List<QueryVo> list = new ArrayList<>();
			for (Student student : students) {
				QueryVo queryVo = new QueryVo();
				queryVo.setStuid(student.getStuid());
				queryVo.setCourseid(course.getCourseid());
				queryVo.setUuid(UUID.randomUUID().toString().replaceAll("-", ""));
				list.add(queryVo);
			}
			courseMapper.inserStudentAndCourse(list);
			scoreMapper.insertScoreWithAddCourse(list);
		}

	}

}
