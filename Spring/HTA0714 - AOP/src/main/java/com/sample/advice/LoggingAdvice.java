package com.sample.advice;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

/*
 * @Aspect
 * 		- @Aspect를 적어 사용할수 있게 해준다.
 * 		- 스프링 컨테이너는 @Aspect Annotation이 지정된 클래스를 검색해서 Spring AOP 설정에 반영한다.
 */
@Aspect
@Component
public class LoggingAdvice {
	
	/*
	 * @Before
	 * 		- 공통 기능의 실행 싯점이다.
	 * 		- 결합지점(메소드 실행)의 메소드 실행 전에 실행되게 한다.
	 * execution
	 * 		- 메소드 실행시점에서 Advice의 적용규칙을 설정한다.
	 * 		- 항상 적용대상이 되는 메소드를 직접적으로 표현하는 적용규칙이여야한다.
	 * 	* com.sample.service.*.*(..)
	 * 		- *은 반환타입을 표시하며, void를 포함한 모든 값이다.
	 * 	JoinPoint
	 * 		- 공통기능이 적용되는 대상객체, 대상메소드에 대한 정보를 포함하고 있는 객체다.
	 */
	@Before("execution(* com.sample.service.*.*(..))")
	public void logging(JoinPoint joinPoint) {
		// 공통기능이 적용된 대상 객체의 클래스명
		String targetClassName = joinPoint.getTarget().getClass().getName();
		// 공통기능이 적용된 대상 메소드의 이름
		String methodName = joinPoint.getSignature().getName();
		// 공통기능이 적용된 대상 매개변수 값
		Object[] args = joinPoint.getArgs();
		
		System.out.println();
		System.out.println("#################### 로그 출력 ####################");
		System.out.println("클래스명(getTarget().getClass().getName() : " + targetClassName);
		System.out.println("메소드명 (getSignature().getName: " + methodName);
		System.out.println("매개변수값(.getArgs() : " + Arrays.toString(args));
	}
}
