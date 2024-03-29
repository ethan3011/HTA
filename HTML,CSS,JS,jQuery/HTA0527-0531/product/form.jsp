<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>HTA Mall :: 상품</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
<%
	String navItem = "product";
%>
	<header>
		<%@ include file="../common/header.jsp" %>
	</header>
	<main>
		<div class="row mb-3">	<!-- mb-3은 margin bottom 을 3만큼 설정한다. -->
			<div class="col-12">
				<h3 class="border p-3 bg-light ">새 상품 등록 폼 </h3>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<form method="post" action="add.jsp" class="border p-3 light">
					<div class="form-group">
						<label>상품 카테고리</label>
						<select class="form-control" name="cateogry">
							<option value="가전">가전제품</option>
							<option value="가구">가구</option>
							<option value="주방">주방용품</option>
							<option value="컴퓨터">컴퓨터/노트북</option>
							<option value="모바일">스마트폰/태블릿</option>
							<option value="사무실">사무용품</option>
							<option value="기타">기타</option>
						</select>
					</div>
					<div class="form-group">
						<label>상품이름</label>
						<input type="text" class="form-control" name="name" />
					</div>
					<div class="form-group">
						<label>제조사</label>
						<input type="text" class="form-control" name="maker" />
					</div>
					<div class="form-group">
						<label>가격</label>
						<input type="number" class="form-control" name="price" min="5000" value="5000" maxlength="1500000" step="1000" />
					</div>
					<div>
						<a href="list.jsp" class="btn btn-secondary">취소</a>
						<button type="submit" class="btn btn-primary">등록</button>
					</div>
				</form>
			</div>
		</div>
	</main>
	<footer>
	
	</footer>
	

</div>
</body>
</html>