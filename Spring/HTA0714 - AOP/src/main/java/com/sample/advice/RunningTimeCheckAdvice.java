package com.sample.advice;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import com.sample.exception.MallBusinessException;

@Aspect
@Component
public class RunningTimeCheckAdvice {
	
	/*
	 * @Around
	 * 		- @Around는 내부에서 메소드를 반드시 실행/반환 해야한다.(void일 경우 null반환)
	 * 		- Transaction 에 보통 사용되며 메소드 실행 전/후, 예외발생, finally 부분에 사용할 수 있다.
	 * within(com.sample.service.*Service)
	 * 		- com.sample.service에 Service로 끝나는 객체 안에 있는 메소드가 모두 선택된다.
	 * ProceedingJoinPoint
	 * 		- 공통 기능이 적용되는 객체이며 정보를 담고있고 객체를 실행시킬수 도 있다.
	 */
	@Around("within(com.sample.service.*Service)")
	public Object RunningTimeCheck(ProceedingJoinPoint joinPoint) throws Exception{
		// before advice 구역
		StopWatch stopWatch = null;
		try {
			stopWatch = new StopWatch();
			stopWatch.start();
			// 실행구역 (UserService, ProductService)
			Object value = joinPoint.proceed();
		
			// after returning advice 메소드 정상종료시 실행구역
			return value;
			
		}catch(Throwable cause){
			
			// 예외 발생시 실행될 구역 after throwing advice
			throw new MallBusinessException("에러가 발생하였습니다", cause);
		}finally {
			// 메소드가 종료가 될 경우 실행되는 구역(오류상관X) after advice
			stopWatch.stop();
			long sc = stopWatch.getTotalTimeMillis();
			System.out.println("총 소요 시간 : " + sc + "밀리초");
		}
	} 
}
