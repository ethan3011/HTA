package com.sample.di.demo4;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringApp {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("context-di-demo4.xml");
		
		CloudDataBaseService service1 = context.getBean("service1", CloudDataBaseService.class);
		CloudDataBaseService service2 = context.getBean("service2", CloudDataBaseService.class);
		CloudDataBaseService service3 = context.getBean("service3", CloudDataBaseService.class);
		CloudDataBaseService service4 = context.getBean("service4", CloudDataBaseService.class);
		
		System.out.println("service1 사용");
		service1.config();
		
		System.out.println("service2 사용");
		service2.config();
		
		System.out.println("service3 사용");
		service3.config();
		
		System.out.println("service4 사용");
		service4.config();
	}
}
