package com.sample.advice;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import com.sample.exception.MallBusinessException;
import com.sample.service.UserService;

@Aspect
@Component
public class RunningTimeCheckAdvice {
	
	@Autowired
	UserService userService;
	
	@Around("within(com.sample.service.*)")
	public Object RunningTiemCheckAdvice(ProceedingJoinPoint joinPoint) throws Exception{
		StopWatch stopWatch = null;
		try {
			stopWatch = new StopWatch();
			stopWatch.start();
			
			Object obj = joinPoint.proceed();
			
			return obj;
			
		} catch (Throwable e) {
			
			throw new MallBusinessException("에러사항 : " + e.getMessage()); 
		} finally {
			stopWatch.stop();
			
			System.out.println("총 소요 시간 : " + stopWatch.getTotalTimeMillis() + "밀리초");
			System.out.println();
		}
	}
}
