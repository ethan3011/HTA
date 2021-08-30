package com.sample.di.demo8;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringApp {

	public static void main(String[] args) {
		ApplicationContext content = new ClassPathXmlApplicationContext("contnet-di-demo8.xml");
		Sample sample = content.getBean("sample", Sample.class);
		
		sample.printCategories();
		sample.printSnsList();
		
		sample.printMapSns("insta");
		sample.printMapSns("facebook");
		
	}
}
