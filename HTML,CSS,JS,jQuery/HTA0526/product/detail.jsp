<%@page import="com.sample.vo.Product"%>
<%@page import="com.sample.dao.ProductDao"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Bootstrap 4 Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<%
	int itemNo = Integer.parseInt(request.getParameter("no"));
	
	ProductDao productDao = ProductDao.getInstance();
	Product product = productDao.getProductByNo(itemNo);
	
	%>
<div class="container">
	<%
		String navItem = "product";
	%>
<header>
	<%@include file="/common/header.jsp" %>
</header>
<main>
	<div class="row mb-3">
		<div class="col-12">
			<h3 class="border p-3 bg-light">
				상품 상세정보
			</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<table class="table table-bordered">
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="15%">
					<col width="35%">
				</colgroup>

			<tr>
				<th class="bg-light">상품번호</th><td><%=product.getNo() %></td>
				<th class="bg-light">등록일</th><td><%=product.getCreateDate() %></td>
			</tr>
			<tr>
				<th class="bg-light">제품명</th><td><%=product.getName() %></td>
				<th class="bg-light">카테고리</th><td><%=product.getCategory() %></td>
			</tr>
			<tr>
				<th class="bg-light">할인 가격</th><td><Strong class="text-danger"><%=product.getDiscountPrice() %> 원</Strong> </td>
				<th class="bg-light">가격</th><td><%=product.getPrice() %> 원</td>
			</tr>
			<tr>
				<th class="bg-light">재고수량</th><td><%=product.getStock() %> 개</td>
				<th class="bg-light">절판여부</th><td><Strong class="text-primary"><%=product.getSoldOut() %></Strong></td>
			</tr>
			</table>
		</div>
	</div>
	<div>
		<a href="modifyform.jsp?no=<%=product.getNo() %>" class="btn btn-warning">수정</a>
		<%
			if(product.getStock() == 0) {
		%>
		<a href="remove.jsp?no=<%=product.getNo() %>" class="btn btn-danger">삭제</a>
		<%		
			}
		%>
		<a href="list.jsp" class="btn btn-primary float-right" >목록</a>
	</div>
	


</main>
</div>
</body>
</html>