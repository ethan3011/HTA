<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTA0520 Review</title>
</head>
<body>

	<h1>요청헤더 정보 조회하기</h1>
	<%
		String Accept = request.getHeader("user-agent");
		String Language = request.getHeader("accept-language");
		String ContentType = request.getHeader("accept");
		String encoding = request.getHeader("accept-encoding");
	%>
	
	<dl>
		<dt>클라이언트의 브라우저 정보</dt><dd><%=Accept %></dd>
		<dt>클라이언트가 선호하는 언어</dt><dd><%=Language %></dd>
		<dt>클라이언트가 선호하는 컨텐츠 타입</dt><dd><%=ContentType %></dd>
		<dt>클라이언트가 선호하는 압축방식</dt><dd><%=encoding %></dd>
	</dl>
	
	<p><a href="main.jsp">메인페이지로 돌아가기</a></p>

</body>
</html>