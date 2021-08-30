package com.sample.di.demo3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringApp {

	public static void main(String[] args) {
		
		ApplicationContext container = new ClassPathXmlApplicationContext("context-di-demo3.xml");
		
		EventService service = container.getBean("eventService", EventService.class);
		
		service.noticeEvent("감자가 제철", "싸고 저렴한 감자가 왔어요");
		
		SystemAlertService alert = container.getBean("alterService", SystemAlertService.class);
		
		alert.alert("DB에러", "데이터 베이스 연결이 끊어졌습니다.", "오라클DB 11G");
		
	}
}