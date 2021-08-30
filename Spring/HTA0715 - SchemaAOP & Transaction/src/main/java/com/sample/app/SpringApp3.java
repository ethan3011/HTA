package com.sample.app;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sample.service.UserService;
import com.sample.vo.User;

public class SpringApp3 {

	public static void main(String[] args) {
		// Transaction
		ApplicationContext context = new ClassPathXmlApplicationContext("spring/transaction.xml");
		UserService userService = context.getBean(UserService.class);
		
		User user = User.builder().id("하하하").name("하하하").password("zxcv1234").phone("하하하").email("하하하").build();
		
		userService.addnewUser(user);
		
	}
}
