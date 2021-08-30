<%@page import="com.sample.vo.Product"%>
<%@page import="com.sample.dao.ProductDao"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	/*
		1.요청객체에 모든 요청 파라미터값(카테고리, 제품명, 제조사, 가격)을 조회한다.
		2. Product객체를 생성해서 요청파라미터값을 저장한다.
			* 할인가격(정수값)은 정상가격에서 10% 할인된 가격이다.
		3. SAMPLE_PRODUCTS 테이블에 대한 CRUD 기능이 구현된 ProductDao객체를 획득한다.
		4. ProductDao객체의 InsertProduct(새제품정보)를 실행해서 새 상품을 등록한다.
		5. 브라우저에게 재요청할 URL(list.jsp)을 응답으로 보낸다.
	*/
	String category = request.getParameter("cateogry");
	String name = request.getParameter("name");
	String maker = request.getParameter("maker");
	int price = Integer.parseInt(request.getParameter("price"));
	int discountPrice = (int)Math.round(price*0.9);
	
	Product product = new Product();
	product.setCategory(category);
	product.setName(name);
	product.setMaker(maker);
	product.setPrice(price);
	product.setDiscountPrice(discountPrice);
	
	ProductDao productDao = ProductDao.getInstance();
	productDao.insertProduct(product);
	
	response.sendRedirect("list.jsp");
%>