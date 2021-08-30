package com.sample.web.controller;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.service.UserService;
import com.sample.vo.User;
import com.sample.web.annotation.LoginUser;


@Controller
@RequestMapping("/my")
public class UserController {
	Logger logger = LogManager.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/info")
	public String detail(@LoginUser User user, Model model) {
		logger.info("로그인 된 유저  정보 확인" + user);
		
		Map<String, Object> userDetail = userService.GetUserDetail(user.getId());
		// 여러개 가능
		model.addAttribute("user",userDetail.get("user"));
		
		return "user/info" ;
	}
}
