<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTA0520 Review</title>
</head>
<body>
	<h1>GET 방식으로 전달받은 요청파라미터값(폼 입력값) 조회하기</h1>
	<%
		String opt = request.getParameter("opt");
		String keyword = request.getParameter("keyword");
		String order = request.getParameter("order");
		String count = request.getParameter("count");
	%>
	<ul>
	<li>검색 옵션 : <%=opt %></li>
	<li>검색 키워드 : <%=keyword %> </li>
	<li>정렬 기준 : <%=order %></li>
	<li>검색 갯수 : <%=count %></li>
	</ul>

</body>
</html>