package com.sample.di.demo6;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringApp {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("context-di-demo6.xml");
		
		DataSaver dataSaver = context.getBean(DataSaver.class);
		dataSaver.saver("컨텐츠다");
		
		Databackup dataBackup = context.getBean(Databackup.class);
		dataBackup.backUp("백업이다");
	}
}
