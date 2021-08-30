<%@page import="com.sample.vo.Product"%>
<%@page import="com.sample.dao.ProductDao"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	/*
		1. modifyform.jsp에서 제출한 모든 값을 요청객체에서 요청파라미터값으로 획득한다.
		2. ProductDao객체를 획득한다.
		3. ProductDao객체의 getProductByNo(상품번호)를 실행해서 상품번호에 해당하는 상품정보를 조회한다.
		4. 데이터베이스에서 조회한 상품정보에 수정폼으로부터 획득한 정보를 대입해서 제품의 정보를 변경한다.
		5. ProdocutDao객체의 updateProduct(변경된 정보를 포함하고 있는 상품정보)를 실행해서
		   데이터베이스에서 해당 상품정보를 갱신한다.
		6. 브라우저에 갱신된 상품상제정보를 요청하는 URL(detail.jsp?no=상품번호)을 응답으로 보낸다.
	*/
		int no = Integer.parseInt(request.getParameter("no"));
		String category = request.getParameter("category");
		String name = request.getParameter("name");
		String maker = request.getParameter("maker");
		int price = Integer.parseInt(request.getParameter("price"));
		int discountPrice = Integer.parseInt(request.getParameter("discountPrice"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		String soldOut = request.getParameter("soldOut");
		
		if(soldOut.equals("Y")){
			stock = 0;
		}
		
		if(stock == 0){
			soldOut = "Y";
		}
		
		ProductDao productDao = ProductDao.getInstance();
		
		Product product = productDao.getProductByNo(no);
		product.setNo(no);
		product.setCategory(category);
		product.setName(name);
		product.setMaker(maker);
		product.setPrice(price);
		product.setDiscountPrice(discountPrice);
		product.setStock(stock);
		product.setSoldOut(soldOut);
		
		productDao.updateProduct(product);
		response.sendRedirect("detail.jsp?no=" + no);
%>



