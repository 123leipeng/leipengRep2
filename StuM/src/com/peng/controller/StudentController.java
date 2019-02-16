package com.peng.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.peng.entity.Classes;
import com.peng.entity.Course;
import com.peng.entity.Question;
import com.peng.entity.Score;
import com.peng.entity.Student;
import com.peng.service.StudentService;

@Controller
public class StudentController {

	@Autowired
	private StudentService studentService;
	
	@RequestMapping("/student")
	private String studentHome() {
		return "/WEB-INF/jsp/homePage";
	}

	@RequestMapping("/student/info")
	private String stuInfo() {
		return "/WEB-INF/jsp/MyInfo/MyInfo";
	}

	@RequestMapping("/student/updatepwd")
	private String updatepwd() {

		return "/WEB-INF/jsp/User/Account/ChangePasswd";
	}

	@RequestMapping(value = "/student/changepwd")
	private String changepwd(Model model, String oldpwd, String newpwd, String newpwd2, HttpSession session) {
		System.out.println(oldpwd);
		System.out.println(newpwd);
		System.out.println(newpwd2);
		Student student = (Student) session.getAttribute("student");
		String password = student.getPassword();
		if (oldpwd.equals(password)) {
			if (newpwd.equals(newpwd2)) {
				student.setPassword(newpwd);
				try {
					studentService.updatePwd(student);
					session.removeAttribute("student");
					return "redirect:/";
				} catch (Exception e) {
					// TODO: handle exception
					model.addAttribute("msg", "修改密码失败");
					return "/WEB-INF/jsp/User/Account/ChangePasswd";
				}
			} else {
				model.addAttribute("msg", "两次密码不一致");
				return "/WEB-INF/jsp/User/Account/ChangePasswd";
			}

		} else {
			model.addAttribute("msg", "旧密码错误");
			return "/WEB-INF/jsp/User/Account/ChangePasswd";
		}

	}

	@RequestMapping("student/exit")
	private String exit(Model model, HttpSession session) {
		Student student = (Student) session.getAttribute("student");
		session.removeAttribute("student");
		return "/index";
	}

	@RequestMapping("/student/classInfo")
	private String classInfo(Model model, HttpSession session) {
		Student student = (Student) session.getAttribute("student");
		String id = student.getClasses();
		Classes classes = studentService.findClassByid(id);
		model.addAttribute("classes", classes);
		return "/WEB-INF/jsp/MyInfo/ClassInfo";
	}

	@RequestMapping("/student/course")
	private String courseList(Model model, Long id) {

		List<Course> list = studentService.findCourseList(id);
		model.addAttribute("list", list);

		return "/WEB-INF/jsp/EducationCenter/Course";
	}

	@RequestMapping("/student/coursetest")
	private String courseTest(Model model, Long id) {

		List<Course> list = studentService.findCourseList(id);
		model.addAttribute("list", list);

		return "/WEB-INF/jsp/EducationCenter/CourseTest";
	}

	@RequestMapping("/student/findscore")
	private String findScore(Model model, Long id) {

		List<Score> list = studentService.findAllScoreByStuid(id);
		model.addAttribute("list", list);
		return "/WEB-INF/jsp/EducationCenter/CourseScore";
	}

	@RequestMapping("/student/findAllcourseNotCore")
	private String findAllcourseNotCore(Model model, HttpSession session) {
		Student student = (Student) session.getAttribute("student");
		Long stuid = student.getStuid();
		List<Course> list = studentService.findAllcourseNotCore(stuid);
		model.addAttribute("list", list);
		return "/WEB-INF/jsp/SelectCourseCenter/UnCoreCourse";
	}
	
	@RequestMapping("/student/selectCourse")
	private ModelAndView selectCourse(String courseid,HttpSession session){
		ModelAndView model = new ModelAndView();
		Student student = (Student) session.getAttribute("student");
		Long stuid = student.getStuid();
		studentService.insertItemCourseStuSelect(stuid, courseid);
		model.setViewName("redirect:/student/findAllcourseNotCore");
		return model;
	}
	
	@RequestMapping("/student/selectedUnCoreCourse")
	private String selectedUnCoreCourse(HttpSession session,Model model){
		Student student = (Student) session.getAttribute("student");
		List<Course> list = studentService.selectCourseSelectedAndisOpen(student.getStuid());
		model.addAttribute("list", list);	
		return "/WEB-INF/jsp/SelectCourseCenter/SelectedCourse";
	}
	
	@RequestMapping("/student/dropCourse")
	private String dropCourse(String courseid,HttpSession session,Model model){
		Student student =  (Student) session.getAttribute("student");
		studentService.dropCourseStuSelected(student.getStuid(), courseid);
		List<Course> list = studentService.selectCourseSelectedAndisOpen(student.getStuid());
		model.addAttribute("list", list);	
		return "/WEB-INF/jsp/SelectCourseCenter/SelectedCourse";
	}
	

}
