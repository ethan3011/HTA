<%@page import="java.util.ArrayList"%>
<%@page import="com.review.hr.vo.Department"%>
<%@page import="java.util.List"%>
<%@page import="com.review.hr.dao.DepartmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTA0520 Review</title>
</head>
<body>

	<h1>부서 목록 페이지</h1>
	
	<h3>전체 부서 목록</h3>
	
	<%
		DepartmentDao departmentDao = new DepartmentDao();
		List<Department> depts = departmentDao.getAllDepartments();
	%>
	
	<ul>
	<%
		for(Department dept : depts){
	%>
			<li><a href=""><%=dept.getName() %></a></li>
	<%
		}
	%>
	</ul>

</body>
</html>