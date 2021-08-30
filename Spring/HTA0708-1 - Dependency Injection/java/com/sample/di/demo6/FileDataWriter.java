package com.sample.di.demo6;

import org.springframework.stereotype.Component;

@Component
public class FileDataWriter implements DataWriter{
	
	@Override
	public void writer(String content) {
		System.out.println("["+content+"] 를 FileData로 기록합니다.");
	}

}
