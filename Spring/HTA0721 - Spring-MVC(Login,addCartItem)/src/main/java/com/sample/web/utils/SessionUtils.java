package com.sample.web.utils;
/**
 * httpSession객체 획득/폐기, 속성값 추가/조회/삭제 기능을 제공하는 유틸리티 클래스다.
 * @author Ethan.jung
 *
 */

import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class SessionUtils {
	
	/**
	 * 지금 서버로 보낸 사용자의 세션객체를 가져온다.
	 * @return 세션객체
	 */
	private static HttpSession getSession(boolean create) {
		ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		return attributes.getRequest().getSession();
	}
	
	/**
	 * HttpSession에 속성을 추가한다.
	 * @param name 속성명
	 * @param value 속성값 혹은 객체
	 */
	public static void addAttributes(String name, Object value) {
		getSession(true).setAttribute(name, value);
	}
	
	/**
	 * HttpSession에 있는 지정된 속성을 반환한다.
	 * @param name 속성명
	 * @return
	 */
	public static Object getAttributes(String name) {
		return getSession(true).getAttribute(name);
	}
	
	/**
	 * HttpSession에 있는 지정된 속성명을 삭제한다.
	 * @param name 속성명
	 */
	public static void removeAttributes(String name) {
		getSession(true).removeAttribute(name);
	}
	
	/**
	 * HttpSession객체를 폐기한다.
	 */
	public static void destorySession() {
		HttpSession session = getSession(false);
		if (session != null) {
			session.invalidate();
		}
	}

}
