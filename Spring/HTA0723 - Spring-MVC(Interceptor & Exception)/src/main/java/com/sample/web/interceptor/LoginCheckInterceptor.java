package com.sample.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.core.MethodParameter;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import com.sample.web.annotation.LoginUser;
import com.sample.web.utils.SessionUtils;

public class LoginCheckInterceptor implements HandlerInterceptor{
	
	Logger logger = LogManager.getLogger(LoginCheckInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HandlerMethod handleMethod = (HandlerMethod) handler;
		MethodParameter[] methodParameters = handleMethod.getMethodParameters();
		
		boolean hasLoginUserAnnotation = false;
		for(MethodParameter parameter : methodParameters) {
			if(parameter.getParameterAnnotation(LoginUser.class) != null) {
				hasLoginUserAnnotation = true;
				break;
			}
		}
		
		if(hasLoginUserAnnotation && SessionUtils.getAttribute("LOGINED_USER") == null) {
			
			String requestURI = request.getRequestURI();
			requestURI = requestURI.replace("/HTA0723", "");
			String queryString = request.getQueryString();
			
			String returnPath = requestURI + (queryString != null ? "?"+queryString : "");
			request.getSession().setAttribute("returnPath", returnPath);
			
			
			response.sendRedirect("/HTA0723/login?error=deny");
			return false;
		}
		return true;
	}
}
