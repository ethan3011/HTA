package com.sample.exception;

public class SampleException extends RuntimeException{

	private static final long serialVersionUID = -4097518922262503980L;
	
	// 에러 제목
	private String title;
	
	public SampleException(String title, String message) {
		super(message);
		this.title = title;
	}
	public String getTitle() {
		return title;
	}
}
