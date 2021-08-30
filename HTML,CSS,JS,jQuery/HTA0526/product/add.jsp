
<%@page import="com.sample.vo.Product"%>
<%@page import="com.sample.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String category = request.getParameter("cateogry");
	String name = request.getParameter("name");
	String maker = request.getParameter("maker");
	int price = Integer.parseInt(request.getParameter("price"));
	
	Product item = new Product();
	
	item.setCategory(category);
	item.setName(name);
	item.setMaker(maker);
	item.setPrice(price);
	item.setDiscountPrice((int)Math.round(price*0.9));

	ProductDao productDao = ProductDao.getInstance();
	productDao.insertProduct(item);
	
	response.sendRedirect("list.jsp");
	
	
%>
