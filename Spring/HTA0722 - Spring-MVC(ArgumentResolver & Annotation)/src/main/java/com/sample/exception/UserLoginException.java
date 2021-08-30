package com.sample.exception;

public class UserLoginException extends SampleException{

	private static final long serialVersionUID = 7390693758610437722L;

	public UserLoginException(String title, String message) {
		super(message, title);
	}
}
