<%@page import="java.util.List"%>
<%@page import="com.review.hr.vo.Location"%>
<%@page import="com.review.hr.dao.LocationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTA 0521 Review</title>
</head>
<body>

	<h1>새 부서 등록 페이지</h1>
	<p> 부서 이름과 부서 소재지를 입력하고, 새 부서를 등록하세요</p>
	
	<%
		LocationDao locationDao = new LocationDao();
		List<Location> locations = locationDao.getAllcations(); 
	%>
	
	<h3>새 부서정보 등록폼</h3>
	<form method="post" action="add.jsp">
	<label>부서명</label><br />
	<input type="text" name="name" /><br />
	<label>부서 소재지</label><br />
	<select name="locationId">
	<%
		for(Location loc : locations){
	%>
		<option value="<%=loc.getId()%>"><%=loc.getCity()%>(<%=loc.getConutryId() %>)</option>
	<%
		}
	%>
	</select><br />
	<button type="submit">부서등록</button>
	</form>
	
	<p><a href="main.jsp">메인 페이지로 돌아가기</a></p>

</body>
</html>