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
	List<Product> products = productDao.getAllProduct();
	


%>
<div class="container">
	<nav class="navbar navbar-expand-sm navbar-dark my-3 bg-primary">
    <a class="navbar-brand" href="/review-mybatis/index.jsp">HTA 몰</a>
      <div class="navbar-nav">
        <a class="nav-link"href="/review-mybatis/index.jsp">홈</a>
        <a class="nav-link active" aria-current="page" href="/review-mybatis/product/list.jsp">상품목록</a>
        <a class="nav-link " href="#">Link 3</a>
      </div>
</nav>          
	<div class="card">
		<h5 class="card-header">상품 목록</h5>
		<div class="card-body">
			<table class="table table-striped">
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
					for(Product pdc : products){
				%>
					<tr>
						<td><%=pdc.getNo() %></td>
						<td><%=pdc.getName() %></td>
						<td><%=pdc.getMaker() %></td>
						<td><%=pdc.getPrice() %>원</td>
						<td><%=pdc.getStock() %> 개</td>
					</tr>
				<%	
					}
				%>
				</tbody>
			</table>
		</div>
	</div>
</div>

</body>
</html>