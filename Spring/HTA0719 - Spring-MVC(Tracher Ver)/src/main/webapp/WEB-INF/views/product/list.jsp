<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>판매중인 전체 상품 리스트</h1>
	<table style="width: 100%; ">
		<thead>
			<tr>
				<th>번호</th>
				<th>상품</th>
				<th>제조사</th>
				<th>가격</th>
				<th>재고</th>
			</tr>
		</thead>
		<tbody class="text-center">
			<c:forEach var="product" items="${products }">
				<tr>	
					<td>${product.no }</td>
					<td>${product.name }</td>
					<td>${product.maker }</td>
					<td>${product.price }</td>
					<td>${product.stock }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>