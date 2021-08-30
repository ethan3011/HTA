package com.sample.web;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/hello")
public class HelloServlet extends HttpServlet{
	
	
	// Servlet 객체가 생성후 서블릿 객체의 초기화를 담당하는 메소드다(1회)
	@Override
	public void init() throws ServletException {
		System.out.println("HelloServlet의 init()실행됨 ...");
		
	}
	
	
	// Servlet 객체가 폐기되기 전에 실행을 담당하는 메소드다.(1회)
	@Override
	public void destroy() {
		System.out.println("HelloServlet의 destroy()실행됨 ...");
		
	}
	
	// 클라이언트의 요청이 올 때마다 실행할 작업을 담당하는 메소드다.
	// 클라이언트의 요청을 처리하고, 적절한 응답을 제공하는 메소드다.
	/// Servlet 객체가 유지되는 동안 요청이 올때 마다 반복적으로 실행되는 메소드다.
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println("HelloServlet의 service(request, response) 실행됨...");
		
		// 요청파라미터 조회하기
		String userName = request.getParameter("name");
		
		// html 응답 컨텐츠 보내기
		
		// 응답컨텐츠의 컨텐츠 타입 지정하기
		response.setContentType("text/html; charset=utf-8");
		
		// 응답컨텐츠를 브라우저로 출력하는 출력스트림 획득하기
		PrintWriter out = response.getWriter();
		
		// 출력스트림으로 컨텐츠 출력하기
		out.println("<!doctype html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset=utf-8>");
		out.println("<title>서블릿 연습</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>서블릿 연습</h1>");
		out.println("<p>"+userName+"님 환영합니다.</p>");
		out.println("</body>");
		out.println("</html>");
		
	}

}
