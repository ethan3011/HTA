<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTA 0520 Review</title>
</head>
<body>

	<h1>요청파라미터값 조회</h1>
	<h3>요청 파라미터값 조회하기</h3>

	<%
		String name = request.getParameter("id");
	%>
	
		<p>요청 파라미터 : id</p>
		<p>파라미터 값 : <%=name %></p>
	
</body>
</html>