<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>샘플 애플리케이션</title>
</head>
<body>
<c:set var="name" value="game" />
<%@include file="../common/header.jsp" %>
<div class="container my-3">
	<h1 class="text-center">게임 목록 리스트</h1>
	
	<div class="row">
		<div class="col-12">
			<table class="table">
				<thead class="table-info">
				<tr>
					<th scope="col">#</th>
					<th scope="col">게임명</th>
					<th scope="col">제조사</th>
					<th scope="col">가격</th>
					<th scope="col">할인가격</th>
					<th scope="col">재고</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="game" items="${games }" varStatus="loop">
					<tr>
						<th scope="row">${loop.count }</th>
						<td><a class="text-decoration-none" href="detail?no=${game.no }">${game.name }</a></td>
						<td>${game.brand }</td>
						<td><fmt:formatNumber value="${game.price }" /> 원</td>
						<td><strong class="text-danger"><fmt:formatNumber value="${game.discountPrice }" /> 원</strong></td>
						<td>${game.stock }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

</script>
</body>
</html>