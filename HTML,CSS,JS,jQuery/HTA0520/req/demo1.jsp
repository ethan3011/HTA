<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTA0520 Review</title>
</head>
<body>

	<h1>요청객체가 제공하는 메소드를 이용해서 클라이언트 정보 조회하기</h1>
	
	<h3>클라이언트 정보</h3>

	 <%
	 	// 클라이언트의 ip주소 획득
	 	String ipAddress = request.getRemoteAddr();
	 
		// 클라이언트의 요청방식(GET, POST, PUT, DELETE 등) 조회하기
		String method = request.getMethod();
		
		// 요청URI 조회하기
		String URI = request.getRequestURI();
		
		// 서버의 호스트명
		String host = request.getServerName();
		
		// 서버가 사용중인 포트번호
		int port = request.getServerPort();
		
		// 컨텍스트 경로
		String contextPath = request.getContextPath();
		
	 %>
 	<dl>
 		<dt>클라이언트의 ip 주소</dt><dd><%=ipAddress %></dd>
 		<dt>요청방식</dt><dd><%=method %></dd>
 		<dt>요청URI</dt><dd><%=URI %></dd>
 		<dt>서버의 호스트명</dt><dd><%=host %></dd>
 		<dt>서버가 사용하는 포트번호</dt><dd><%=port %></dd>
 		<dt>서버의 컨텍스로 경로></dt><dd><%=contextPath %></dd>
 	</dl>	
 	
 	<p><a href="main.jsp">메인페이지로 돌아가기</a></p>

</body>
</html>