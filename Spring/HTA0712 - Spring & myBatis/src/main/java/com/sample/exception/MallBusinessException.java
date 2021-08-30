package com.sample.exception;

public class MallBusinessException extends RuntimeException{
	
	/**
	 * 에러가 발생하였을때 사용할 메세지
	 * @param message 에러메세지
	 */
	public MallBusinessException(String message) {
		super(message);
	}
	
	/**
	 * 에러가 발생하면 사용할 메세지, 사유
	 * @param message 메세지
	 * @param cause 사유
	 */
	public MallBusinessException(String message, Throwable cause) {
		super(message, cause);
	}
}
