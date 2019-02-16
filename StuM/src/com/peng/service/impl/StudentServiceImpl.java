package com.peng.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peng.dao.ClassMapper;
import com.peng.dao.CourseMapper;
import com.peng.dao.QuestionMapper;
import com.peng.dao.ScoreMapper;
import com.peng.dao.StudentMapper;
import com.peng.entity.Classes;
import com.peng.entity.Course;
import com.peng.entity.QueryVo;
import com.peng.entity.Question;
import com.peng.entity.Score;
import com.peng.entity.Student;
import com.peng.service.StudentService;
import com.peng.uitil.GetSchoolYear;

@Service
public class StudentServiceImpl implements StudentService {
	@Autowired
	private StudentMapper studentMapper;
	@Autowired
	private ClassMapper classMapper;
	@Autowired
	private CourseMapper courseMapper;
	@Autowired
	private QuestionMapper questionMapper;
	@Autowired
	private ScoreMapper scoreMapper;

	@Override
	public Student selectStuByIdAndPwd(Long stuid, String password) {
		// TODO Auto-generated method stub
		Student student = new Student();
		student.setStuid(stuid);
		student.setPassword(password);
		student = studentMapper.selectStuByIdAndPwd(student);

		return student;
	}

	@Override
	public String selectStuPwdByStuid(Long stuid) {
		// TODO Auto-generated method stub
		String pwd = studentMapper.selectStuPwdByStuid(stuid);

		return null;
	}

	@Override
	public void updatePwd(Student student) {
		// TODO Auto-generated method stub

		studentMapper.updatePwd(student);

	}

	@Override
	public Classes findClassByid(String id) {
		// TODO Auto-generated method stub
		return classMapper.findClassByid(id);
	}

	@Override
	public List<Course> findCourseList(Long id) {
		// TODO Auto-generated method stub
		List<Course> list = courseMapper.findCourseList(id);
		return list;
	}

	@Override
	public List<Question> selectQuestionById(String id) {
		// TODO Auto-generated method stub

		return questionMapper.selectQuestionById(id);
	}

	@Override
	public List<Score> findAllScoreByStuid(Long id) {
		// TODO Auto-generated method stub
		return scoreMapper.findAllScoreByStuid(id);
	}

	@Override
	public List<Course> findAllcourseNotCore(Long id) {
		// TODO Auto-generated method stub
		String year = GetSchoolYear.getParam();

		return courseMapper.findAllcourseNotCore(id, year);
	}

	@Override
	public void insertItemCourseStuSelect(Long stuid, String courseid) {
		// TODO Auto-generated method stub

		QueryVo queryVo = new QueryVo();
		queryVo.setUuid(UUID.randomUUID().toString().replaceAll("-", ""));
		queryVo.setStuid(stuid);
		queryVo.setCourseid(courseid);
		courseMapper.inertItemInStuCourseStuSelect(queryVo);
		scoreMapper.insertItemInScoreStuSelect(queryVo);

	}

	@Override
	public List<Course> selectCourseSelectedAndisOpen(Long stuid) {
		// TODO Auto-generated method stub

		return courseMapper.selectCourseSelectedAndisOpen(stuid);
	}

	@Override
	public void dropCourseStuSelected(Long stuid, String courseid) {
		// TODO Auto-generated method stub
		QueryVo queryVo = new QueryVo();
		queryVo.setCourseid(courseid);
		queryVo.setStuid(stuid);
		courseMapper.dropCourse(queryVo);
		scoreMapper.dropScore(queryVo);

	}

}
