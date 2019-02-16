package com.peng.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.peng.entity.Student;
import com.peng.service.StudentService;

@Controller
public class LoginController {
	@Autowired
	private StudentService studentService;

	@RequestMapping("/login/homePage")
	public String login(Model model, String stuid, String password, HttpSession session) {
		if (stuid != null || password != null) {
			session.removeAttribute("student");
		}else {
			return "/index";
		}
		Long stuidl = null;
		Student student = null;
		student = (Student) session.getAttribute("student");
		if (student == null) {

			try {
				stuidl = Long.valueOf(stuid);
			} catch (Exception e) {
				// TODO: handle exception

				model.addAttribute("message", "学号格式不正确");
				model.addAttribute("stuid", stuid);
				model.addAttribute("password", password);
				return "/index";
			}

			student = studentService.selectStuByIdAndPwd(stuidl, password);

			if (student == null) {
				model.addAttribute("message", "学号或密码错误");
				model.addAttribute("stuid", stuid);
				model.addAttribute("password", password);
				return "/index";
			} else {
				session.setAttribute("student", student);
				return "/WEB-INF/jsp/homePage";
			}
		}
		return "/WEB-INF/jsp/homePage";

	}
	
	@RequestMapping("/login")
	private String toLogin() {
		
		return "redirect:/";
	}

}
