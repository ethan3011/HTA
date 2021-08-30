package com.sample.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/scope1")
public class ScopeTestServlet1 extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "홍길동");
		map.put("age", 30);
		map.put("tel", "010-1111-2222");
		map.put("address", "서울시 종로구 ");
		
		// Request Scope에 속성 저장하기
		request.setAttribute("req", map);
		
		// Session Scope에 속성 저장하기
		HttpSession session = request.getSession();
		session.setAttribute("ses", map);
		
		// ServletContext에 속성 저장하기
		ServletContext application = request.getServletContext();
		application.setAttribute("app", map);
		
		// 리다이렉트방식의 이동
		// score/view1.jsp를 재요청하기
		response.sendRedirect("scope/view1.jsp");
	}
}
