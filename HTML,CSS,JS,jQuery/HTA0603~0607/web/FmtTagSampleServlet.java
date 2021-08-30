package com.sample.web;

import java.io.IOException;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/fmt")
public class FmtTagSampleServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setAttribute("balance", 100000000);
		request.setAttribute("today", new Date());
		
		request.getRequestDispatcher("/jstl/fmt.jsp").forward(request, response);
		
	}
}
