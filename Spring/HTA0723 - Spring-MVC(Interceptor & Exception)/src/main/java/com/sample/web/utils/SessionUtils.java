package com.sample.web.utils;

import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class SessionUtils {
	
	public static HttpSession getSession(boolean create) {
		ServletRequestAttributes attribute = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		return attribute.getRequest().getSession();
	}
	
	public static void addAttribute(String name, Object value) {
		getSession(true).setAttribute(name, value);
	}
	
	public static Object getAttribute(String name) {
		return getSession(true).getAttribute(name);
	}
	
	public static void removeAttribute(String name) {
		getSession(true).removeAttribute(name);
	}
	
	public static void destroySession() {
		HttpSession session = getSession(false);
		
		if(session != null) {
			session.invalidate();
		}
	}
}
