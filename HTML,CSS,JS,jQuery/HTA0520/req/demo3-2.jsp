<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTA0520 Review</title>
</head>
<body>

	<%
		String category = request.getParameter("category");
		String no = request.getParameter("no");
	%>
	
	<h1>요청 파라미터값 조회하기</h1>

	<p> 카테고리 : <%=category %></p>
	<p> 상품번호 : <%=no %></p>

</body>
</html>