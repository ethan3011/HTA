package com.sample.di.demo6;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

@Primary
@Component
public class CloudDataWriter implements DataWriter{
	
	@Override
	public void writer(String content) {
		System.out.println("["+content+"] 를 클라우드에 저장합니다.");
	}
}
