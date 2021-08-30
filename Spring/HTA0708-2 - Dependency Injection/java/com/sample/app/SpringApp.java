package com.sample.app;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sample.dao.UserDao;
import com.sample.vo.User;

public class SpringApp {
	
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("context.jdbc.xml");
		
		UserDao userDao = context.getBean(UserDao.class);
		
		User user = new User();
		user.setId("gajua");
		user.setPassword("gaja1234");
		user.setName("가주아");
		user.setEmail("gajuaph@naver.com");
		user.setPhone("010-5959-5959");
		
		userDao.insertUser(user);
		
	}
}
