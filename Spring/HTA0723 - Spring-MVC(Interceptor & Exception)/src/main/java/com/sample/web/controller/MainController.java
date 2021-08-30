package com.sample.web.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sample.exception.UserLoginException;
import com.sample.exception.UserRegisterException;
import com.sample.service.UserService;
import com.sample.vo.User;
import com.sample.web.form.UserRegisterForm;
import com.sample.web.utils.SessionUtils;

@Controller
public class MainController {
	
	Logger logger = LogManager.getLogger(MainController.class);
	
	@Autowired
	private UserService userService;
	
	@ExceptionHandler(UserLoginException.class)
	public String handleUserLoginException(UserLoginException ex, Model model) {
		ex.printStackTrace();
		model.addAttribute("error", ex);
		return "loginform";
		
	}
	@ExceptionHandler(UserRegisterException.class)
	public String handleUserRegisterException(UserRegisterException ex, Model model) {
		ex.printStackTrace();
		model.addAttribute("error", ex);
		return "form";
	}
	
	@GetMapping(path = {"/", "/main"})
	public String main() {
		return "main";
	}
	
	@GetMapping("/login")
	public String loginform() {
		return "loginform";
	}
	@PostMapping("/login")
	public String login(@RequestParam("id") String userId, @RequestParam("password") String userPassword) {
		userService.login(userId, userPassword);
		
		String returnPath = (String)SessionUtils.getAttribute("returnPath");
		SessionUtils.removeAttribute("returnPath");
		
		if(returnPath != null) {
			return "redirect:" + returnPath;
		}
		
		return "redirect:main";
	}
	
	@GetMapping("/register")
	public String regsiterform() {
		return "form";
	}
	@PostMapping("/register")
	public String regsiter(UserRegisterForm userRegisterForm) {
		
		User user = new User();
		BeanUtils.copyProperties(userRegisterForm, user);
		logger.info("입력받은 유저 정보  : " + userRegisterForm);
		
		userService.addNewUser(user);
		
		return "redirect:main";
	}
	
	@GetMapping("/logout")
	public String logout() {
		SessionUtils.destroySession();
		return "main";
	}
	
	
}
