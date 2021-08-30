<%@page import="com.sample.vo.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.sample.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>상품몰</title>
</head>
<body>
<%
	ProductDao productDao = ProductDao.getInstance();
	List<Product> products = productDao.getAllProducts();
%>
<div class="container">
	<%
		String navItem = "product";
	%>
	<header>
	<%@ include file="../common/header.jsp" %>
	</header>
	<div class="row mb-3">
		<div class="col-12">
			<h3 class="border p-3 bg-light">
				상품 목록
				<a href="form.jsp" class="btn btn-primary float-right">상품추가</a>
			</h3>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<div class="card">
				<div class="card-body pb-0">
					<table class="table">
						<colgroup>
							<col width="10%" />
							<col width="40%" />
							<col width="20%" />
							<col width="20%" />
							<col width="10%" />
						</colgroup>
						<thead>
							<tr>
								<th>순번</th>
								<th>이름</th>
								<th>제조회사</th>
								<th>가격</th>
								<th>재고</th>
							</tr>
						</thead>
						<tbody>
						<%
							if (products.isEmpty()) {
						%>
							<tr>
								<td colspan="5" class="text-center">상품이 존재하지 않습니다.</td>
							</tr>						
						<%
							} else {
								for (Product product : products) {
						%>
							<tr>
								<td><%=product.getNo() %></td>
								<td><a href="detail.jsp?no=<%=product.getNo()%>"><%=product.getName() %></a></td>
								<td><%=product.getMaker() %></td>
								<td><%=product.getPrice() %> 원</td>
								<td><%=product.getStock() %> 개</td>
							</tr>
						<%
								}
							}
						%>
							</tbody>
					</table>
				</div>
				<div class="card-body">
					<nav>
  						<ul class="pagination justify-content-center">
    						<li class="page-item"><a class="page-link" href="list.jsp?page=2">이전</a></li>
    						<li class="page-item"><a class="page-link" href="list.jsp?page=1">1</a></li>
    						<li class="page-item"><a class="page-link" href="list.jsp?page=2">2</a></li>
    						<li class="page-item active"><a class="page-link" href="list.jsp?page=3">3</a></li>
    						<li class="page-item"><a class="page-link" href="list.jsp?page=4">4</a></li>
    						<li class="page-item"><a class="page-link" href="list.jsp?page=5">5</a></li>
    						<li class="page-item"><a class="page-link" href="list.jsp?page=4">다음</a></li>
  						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>