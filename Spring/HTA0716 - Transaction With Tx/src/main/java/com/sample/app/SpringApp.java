package com.sample.app;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sample.service.UserService;
import com.sample.vo.User;

public class SpringApp {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("spring/context-tx-annotation.xml");
		UserService userService = context.getBean(UserService.class);
		
		User user = User.builder().id("김치는맛있다").password("zxcv1234").phone("010-kimchi-masarap").email("masarapangkimchi@gmail.com").name("김치정복자").build();
		userService.addNewUser(user);
		
	}
}
