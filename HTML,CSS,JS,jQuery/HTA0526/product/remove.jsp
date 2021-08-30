<%@page import="com.sample.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

	int no = Integer.parseInt(request.getParameter("no"));

	ProductDao productDao = ProductDao.getInstance();
	
	productDao.deleteProduct(no);
	
	response.sendRedirect("list.jsp");

%>