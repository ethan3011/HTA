package com.sample.web.advice;

import org.springframework.dao.DataAccessException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.sample.exception.SampleException;

@ControllerAdvice
public class GlobalExceptionHandlerAdvice {
	
	@ExceptionHandler(SampleException.class)
	public String handleSampleException(SampleException ex, Model model) {
		model.addAttribute("error", ex);
		ex.printStackTrace();
		return "error/business";
	}
	
	@ExceptionHandler(DataAccessException.class)
	public String handleDataAccessException(DataAccessException ex) {
		ex.printStackTrace();
		return "error/db";
	}
	
	@ExceptionHandler(Exception.class)
	public String handleException(Exception ex) {
		ex.printStackTrace();
		return "error/server";
	}
}
