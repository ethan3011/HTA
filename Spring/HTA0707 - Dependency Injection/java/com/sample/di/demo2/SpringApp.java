package com.sample.di.demo2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringApp {

	public static void main(String[] args) {
		
		ApplicationContext container = new ClassPathXmlApplicationContext("context-di-demo2.xml");
		
		OrderService service = container.getBean("orderService", OrderService.class);
		System.out.println("################################################################");
		service.order();
		System.out.println("################################################################");
		service.cancel();
	}
}
