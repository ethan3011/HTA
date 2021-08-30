<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<div class="container">
	<div class="row mb-3">
		<div class="col-6">
			<h3>숫자 포맷팅</h3>
			
			<p>잔액 : ${balance }</p>
			<p>잔액 : <c:out value="${balance }" />
			<p>잔액 : <fmt:formatNumber value="${balance }" />원</p>
		</div>
		<div class="col-6">
			<h3>날짜 포맷팅</h3>
			
			<p>날짜 : ${today }</p>
			<p>날짜 : <c:out value="${today }" />
			<p>날짜 : <c:out value="${today }" />
			<p>날짜 : <fmt:formatDate value="${today }" pattern="yyyy-MM-dd" /></p>
			<p>날짜 : <fmt:formatDate value="${today }" pattern="yyyy-MM-dd hh:mm:ss" /></p>
			<p>날짜 : <fmt:formatDate value="${today }" pattern="yyyy년 M월 d일 EEEE a h시 m분 s초" /></p>
		</div>
	</div>
</div>

</body>
</html>