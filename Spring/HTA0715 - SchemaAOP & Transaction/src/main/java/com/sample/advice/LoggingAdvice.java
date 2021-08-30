package com.sample.advice;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAdvice {
	
	@Before("execution(* com.sample.service.*Service.*(..))")
	public void Logging(JoinPoint joinPoint) {
		String className = joinPoint.getTarget().getClass().getName();
		String methodName = joinPoint.getSignature().getName();
		Object[] args = joinPoint.getArgs();
		
		System.out.println("### 로그출력 ###");
		System.out.println("클래스명 : " + className);
		System.out.println("메소드명 : " + methodName);
		System.out.println("매개변수값 : " + Arrays.toString(args));
	}

}
