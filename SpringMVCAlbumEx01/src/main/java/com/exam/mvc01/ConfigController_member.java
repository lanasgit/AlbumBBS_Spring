package com.exam.mvc01;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import albummodel1.BoardDAO;
import albummodel1.BoardTO;
import albummodel1.MemberDAO;
import albummodel1.MemberTO;

@Controller
public class ConfigController_member {
	@Autowired
	private DataSource dataSource;
	
	@RequestMapping("/signup.do")
	public String signUp(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		return "signup";
	}
	
	@RequestMapping("/signup_ok.do")
	public String signUpOk(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		int flag = 1;
		
		MemberTO to = new MemberTO();
		to.setId(request.getParameter("id"));
		to.setPassword(request.getParameter("password"));
		to.setName(request.getParameter("name"));
		to.setEmail("");
		if (!request.getParameter("email1").equals("") && !request.getParameter("email2").equals("")) {
			to.setEmail(request.getParameter("email1") + "@" + request.getParameter("email2"));
		}
		
		MemberDAO dao = new MemberDAO(dataSource);
		flag = dao.signUpOk(to);
		model.addAttribute("flag", flag);
		
		return "signup_ok";
	}
	
	@RequestMapping("/login.do")
	public String logIn(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		int flag = 1;
		
		MemberTO to = new MemberTO();
		to.setId(request.getParameter("id"));
		to.setPassword(request.getParameter("password"));
		
		MemberDAO dao = new MemberDAO(dataSource);
		flag = dao.logIn(to);
		
		model.addAttribute("flag", flag);
		model.addAttribute("id", request.getParameter("id"));
		
		return "login";
	}
	
	@RequestMapping("/logout.do")
	public String logOut(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		return "logout";
	}
	
}
