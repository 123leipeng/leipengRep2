package com.peng.controller;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.peng.entity.Classes;
import com.peng.entity.Course;
import com.peng.entity.Score;
import com.peng.entity.Student;
import com.peng.entity.Teacher;
import com.peng.exception.MyException;
import com.peng.service.TeacherService;
import com.peng.uitil.GetSchoolYear;

@Controller
public class TeacherController {
	@Autowired
	private TeacherService teacherService;

	@RequestMapping("/teacher")
	private String toLoginPage(String msg,Model model) {
		model.addAttribute("msg",msg);
		return "/WEB-INF/jsp/Teacher/login";
	}

	@RequestMapping("/teacher/quit")
	private String quit(HttpSession session){
		session.removeAttribute("teacher");
		return "redirect:/teacher";
	}
	
	@RequestMapping(value = "/teacher/login", method = RequestMethod.GET)
	private String loginGet(HttpSession session) {
		Teacher teacher = (Teacher) session.getAttribute("teacher");
		if (teacher == null) {
			return "/WEB-INF/jsp/Teacher/login";
		}

		return "/WEB-INF/jsp/Teacher/homePage";
	}

	@RequestMapping(value = "/teacher/login", method = RequestMethod.POST)
	private String login(Model model, String username, String password, HttpSession session) {
		Teacher teacher = null;
		session.removeAttribute("teacher");
		teacher = new Teacher();
		teacher.setTid(username);
		teacher.setPassword(password);
		teacher = teacherService.findTeacherByIdAndPwd(teacher);
		if (teacher == null) {
			model.addAttribute("msg", "1");
			return "redirect:/teacher";
		} else {
			session.setAttribute("teacher", teacher);
			return "/WEB-INF/jsp/Teacher/homePage";
		}

	}

	@RequestMapping("/admin/introduce")
	private String toIntroduce() {

		return "/WEB-INF/jsp/Teacher/introduce";
	}

	@RequestMapping("/admin/courseList")
	private String findCourseList(Model model, String id) {
		List<Course> list = teacherService.selectTeacherCourseList(id);
		model.addAttribute("list", list);
		return "/WEB-INF/jsp/Teacher/courseList";
	}

	@RequestMapping("/admin/selectClass")
	private String selectClass(Model model, String id) {
		if (id == null || id.equals("")) {
			return "/WEB-INF/jsp/Teacher/introduce";
		} else {
			Classes classes = teacherService.findClassByid(id);
			model.addAttribute("classes", classes);

			return "/WEB-INF/jsp/Teacher/classesInfo";
		}

	}

	@RequestMapping("/admin/selectStudentInClass")
	private String selectStudentInClass(Model model, String id) {
		List<Student> list = teacherService.selectStudentInClass(id);
		model.addAttribute("list", list);
		return "/WEB-INF/jsp/Teacher/studentInfo";
	}

	@RequestMapping("/admin/editStudent")
	private String editStudent(Long id, Model model) {
		Student student = teacherService.selectStuById(id);
		model.addAttribute("student", student);
		return "/WEB-INF/jsp/Teacher/editStudent";
	}

	@RequestMapping("/admin/updateStudent")
	private String updateStudent(Student student) {
		teacherService.updateStudent(student);
		return "/WEB-INF/jsp/Teacher/success";
	}

	@RequestMapping("/admin/selectStuInClass")
	private String selectStuInClass(String id, Model model) {
		List<Score> list = teacherService.selectStuInClass(id);
		model.addAttribute("list", list);
		return "/WEB-INF/jsp/Teacher/Score/studentScore";
	}

	@RequestMapping("/admin/editScore")
	private String editScore(String id, Model model) {
		Score score = teacherService.editScore(id);
		model.addAttribute("score", score);
		return "/WEB-INF/jsp/Teacher/Score/editScore";
	}

	@RequestMapping(value = "/admin/updateScore", method = RequestMethod.POST)
	@ResponseBody
	private void updateScore(Score score) {
		/* System.out.println(score); */
		System.out.println(score);
		teacherService.updateScore(score);
//	 return	"success";	
	}

	@RequestMapping("/admin/courseAddPage")
	private String courseAddPage() {
		return "/WEB-INF/jsp/Teacher/Course/courseAddPage";
	}

	@RequestMapping("/admin/addCourse0")
	private String addCourse0(Model model) {
		List<Classes> list = teacherService.findClassAlive();
		model.addAttribute("list", list);
		String param = GetSchoolYear.getParam();
		model.addAttribute("year", param);
		return "/WEB-INF/jsp/Teacher/Course/addCourse0";
	}

	@RequestMapping("/admin/addCourse1")
	private String addCourse1(Model model) {
		String param = GetSchoolYear.getParam();
		model.addAttribute("year", param);
		return "/WEB-INF/jsp/Teacher/Course/addCourse1";
	}

	@RequestMapping("/admin/toAddCourse1")
	@ResponseBody
	private void toaddCourse1(Model model, Course course, HttpSession session, HttpServletResponse response) {

		Teacher teacher = (Teacher) session.getAttribute("teacher");
		course.setCourseteacher(teacher.getTname());
		course.setCourseteacherid(teacher.getTid());
		course.setIsopen(true);
		course.setCourseid(UUID.randomUUID().toString().replaceAll("-", "").toUpperCase());
		try {
			teacherService.toAddCourse1(course);
		} catch (MyException e) {
			// TODO Auto-generated catch block
			response.setContentType("text/html;charset=UTF-8");

			try {
				ObjectMapper objectMapper = new ObjectMapper();
				String s = objectMapper.writeValueAsString(e);
				response.getWriter().print(s);
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}

	}

	@RequestMapping("/admin/toAddCourse0")
	@ResponseBody
	private void toAddCourse0(HttpSession session, Model model, HttpServletResponse response, Classes classes,
			Course course) {

		Teacher teacher = (Teacher) session.getAttribute("teacher");
		course.setCourseteacher(teacher.getTname());
		course.setCourseteacherid(teacher.getTid());
		course.setIsopen(true);
		course.setCourseid(UUID.randomUUID().toString().replaceAll("-", "").toUpperCase());
		try {
			teacherService.toAddCourse0(course, classes);
		} catch (MyException e) {
			// TODO Auto-generated catch block
			response.setContentType("text/html;charset=UTF-8");

			try {
				ObjectMapper objectMapper = new ObjectMapper();
				String s = objectMapper.writeValueAsString(e);
				response.getWriter().print(s);
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
	}
}