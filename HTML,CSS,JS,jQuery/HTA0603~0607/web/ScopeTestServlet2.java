package com.sample.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/scope2")
public class ScopeTestServlet2 extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "홍길동");
		map.put("age", 30);
		map.put("tel", "010-1111-2222");
		map.put("address", "서울시 종로구 ");
		
		// request Scope에 속성 저장하기
		request.setAttribute("req2", map);
		
		// session Scope에 속성 저장하기
		HttpSession session = request.getSession();
		session.setAttribute("ses2", map);
		
		// Application Scope에 속성 저장하기
		ServletContext application = this.getServletContext();
		application.setAttribute("app2", map);
		
		//Forward 방식으로 이동하기
		RequestDispatcher dispatcher = request.getRequestDispatcher("/scope/view2.jsp");
		dispatcher.forward(request, response);
	}
}
