package com.sample.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

public class LoggingInterceptor implements HandlerInterceptor{
	
	Logger logger = LogManager.getLogger(LoggingInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("preHandle() 실행됨 !");
		HandlerMethod handleMethod = (HandlerMethod) handler;
		
		String methodName = handleMethod.getMethod().getName();
		
		logger.info("클라이언트의 요청을 처리하는 핸들러메소드의 이름 : " + methodName);
		
		return true;
	}

}
