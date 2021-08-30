package com.sample.advice;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import com.sample.exception.MallBusinessException;

@Aspect
@Component
public class AspectUsingAdvice {
	
	/*
	 *  @Before
	 *  	- 대상 메소드가 실행되기 전에 실행되는 advice 이다.
	 *  	- 인증, 로그출력, 권환확인 등에 이용된다.
	 *  	- JoinPoint 객체를 매개변수로 제공받을 수 있다.
	 *  	- advice의 적용대상, 메소드명, 메소드의 매개변수 값을 조회할 수 있다.
	 */
	
	@Before("execution(* com.sample.service.*.*(..))")
	public void beforeTargetMethod(JoinPoint joinPoint) {
		System.out.println("beforeTargetMethod() is running !");
	}
	/*
	 * @AfterReturning(pointcut = "", returning="returnValue)
	 * 		- 대상 메소드가 정상적으로 죵료시 실행되는 advice 이다.
	 * 		- JoinPoint 객체와 returnValue 객체를 매개변수로 제공받을 수 있다.
	 * 		- advice의 적용대상, 메소드명, 메소드의 매개변수 값을 조회할 수 있다.
	 * 		- returnValue로 해당 메소드가 반환하는 값을 조회할 수 있다.(변경은 불가능하다)

	 */
	
	@AfterReturning(pointcut = "execution(* com.sample.service.*.*(..))", returning = "returnValue")
	public void afterReturningTargetMethod(JoinPoint joinPoint, Object returnValue) {
		System.out.println("afterReturningTargetMethod() is running !");
		System.out.println("실행하는 메소드 명 : " + returnValue);
	}
	
	/*
	 * @AfterThrowing(pointcut = "", throwing = "exception")
	 * 		- 대상 메소드가 예외발생시 실행되는 advice이다.
	 * 		- JoinPoint 객체와 Exception 객체를 매개변수로 제공받을 수 있다.
	 * 		- advice의 적용대상, 메소드명, 메소드의 매개변수 값을 조회할 수 있다.
	 * 		- 예외발생시 예외값을 전달받을수 있고 사용자지정 예외도 사용할 수 있다.
	 * 		- 어플리케이션 실행과정에서 다양한 예외를 사용자지정 예외로 변경할 때 주로 사용된다.
	 */
	@AfterThrowing(pointcut = "execution(* com.sample.service.*.*(..))", throwing = "exception")
	public void afterThrowingTargetMethod(JoinPoint joinPoint, Exception exception) {
		System.out.println("afterThrowingTargetException() is running !");
		System.out.println("예외명 : " + exception);
		System.out.println("예외 메세지 : " + exception.getMessage());
		
		throw new MallBusinessException("에러에러발생발생");
	}
	
	/*
	 * @After
	 * 		- 대상 메소드가 정상/예외 상관없이 종료되면 실행되는 advice이다.
	 * 		- JoinPoint를 매개변수로 전달받을 수 있다.
	 * 		- advice의 적용대상, 메소드명, 메소드의 매개변수 값을 제공받을 수 있다.
	 */
	@After("execution(* com.sample.service.*.*(..))")
	public void afterTargetMethod(JoinPoint joinPoint) {
		System.out.println("afterTargetMethod() is running !");
	}
	
	/*
	 * @Around
	 * 		- 대상 메소드의 전/후 에 모두 사용할 있다.
	 * 		- ProceedingJoinPoint를 매개변수로 전달받을 수 있다.
	 * 		- advice의 적용대상, 메소드명, 메소드의 매개변수 값을 조회할 수 있다.
	 * 		- 대상메소드를 직접 실행시킬수 있고 결과값을 전달받을 수도 있다.
	 * 		- 대상 메소드의 실행여부를 조작할 수 있고 반환값도 변경할 수 있다.
	 * 		- Before, AfterReturning, AfterThrowing, After 등 모두 흉내낼 수 있다.
	 * 		- transaction,실행시칸체크에 주로 사용된다.
	 */
	@Around("execution(* com.sample.service.*.*(..))")
	public Object AroundTargetMethod(ProceedingJoinPoint joinPoint) throws Throwable {
		
		Object obj = joinPoint.proceed();
		System.out.println();
		return obj;
	}
}
