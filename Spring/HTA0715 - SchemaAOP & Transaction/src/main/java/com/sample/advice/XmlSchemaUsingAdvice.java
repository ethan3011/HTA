package com.sample.advice;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;

import com.sample.exception.MallBusinessException;

public class XmlSchemaUsingAdvice {
	
	public void beforeTargetMethod(JoinPoint joinPoint) {
		System.out.println("beforeTargetMethod() is running !");
	}
	
	public void afterReturningTargetMethod(JoinPoint joinPoint, Object returnValue) {
		System.out.println("afterReturningTargetMethod() is running !");
		System.out.println("실행하는 메소드 명 : " + returnValue);
	}
	
	public void afterThrowingTargetMethod(JoinPoint joinPoint, Exception exception) {
		System.out.println("afterThrowingTargetException() is running !");
		System.out.println("예외명 : " + exception);
		System.out.println("예외 메세지 : " + exception.getMessage());
		
		throw new MallBusinessException("에러에러발생발생");
	}
	
	public void afterTargetMethod(JoinPoint joinPoint) {
		System.out.println("afterTargetMethod() is running !");
	}
	
	
	public Object aroundTargetMethod(ProceedingJoinPoint joinPoint){
		
		try {
			System.out.println("aroundTargetMethod 메소드 실행 전 !");
			Object obj = joinPoint.proceed();
			System.out.println("aroundTargetMethod 메소드 실행 후 !");
			
			return obj;
		} catch (Throwable e) {
			
			System.out.println("aroundTargetMethod 예외실행시 !");
			throw new MallBusinessException(e.getMessage());
		} finally {
			System.out.println("정상/예외 메소드 실행 종료시 !");
			System.out.println();
		}
	}
}
