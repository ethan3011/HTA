package com.sample.web.controller;

import org.apache.ibatis.annotations.Param;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sample.service.UserService;
import com.sample.vo.User;
import com.sample.web.form.UserRegisterForm;
import com.sample.web.utils.SessionUtils;

@Controller
public class MainController {
	
	private static Logger logger = LogManager.getLogger(MainController.class);
	
	@Autowired
	private UserService userService;
	
	@GetMapping(path = {"/", "/main"})
	public String main() {
		return "main";
	}
	
	@GetMapping("/register")
	public String registerform() {
		return "form";
	}
	
	@PostMapping("/register")
	public String registerUser(UserRegisterForm userRegisterForm) {
		
		logger.info("유저 정보 : " + userRegisterForm);
		User user = new User();
		BeanUtils.copyProperties(userRegisterForm, user);
		
		userService.registerUser(user);
		
		return "redirect:main";
	}
	
	@GetMapping("/login")
	public String loginform() {
		return "loginform";
	}
	
	@PostMapping("/login")
	public String login(@Param("id") String id,@Param("password") String password) {
		
		userService.login(id, password);
		
		return "redirect:main";
	}
	
	@GetMapping("/logout")
	public String logout() {
		SessionUtils.destorySession();
		return "redirect:main";
	}
}
