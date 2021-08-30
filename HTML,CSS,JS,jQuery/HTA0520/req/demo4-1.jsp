<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTA520 Review</title>
</head>
<body>
	<h1>POST 방식으로 전달된 요청파라미터값 조회하기</h1>
	
	<%
		String username = request.getParameter("username");
		String userId = request.getParameter("userid");
		String userpwd = request.getParameter("userpwd");
		String gender = request.getParameter("gender");
		String[] skills = request.getParameterValues("skill");
		String workyears = request.getParameter("workyears");
		
	%>
	
	<h3>사용자정보 입력폼에 입력해서 제출한 값 조회하기</h3>
	
	<dl>
		<dt>이름</dt><dd><%=username %></dd>
		<dt>아이디</dt><dd><%=userId %></dd>
		<dt>비밀번호</dt><dd><%=userpwd %></dd>
		<dt>성별</dt><dd><%=gender %></dd>
		<dt>보유기술</dt><dd>
		<%
		for(String skill : skills){
		%>
			<%=skill %>
		<%
		}
		%>
		</dd>
		<dt>경력</dt><dd><%=workyears %></dd>
	</dl>

</body>
</html>