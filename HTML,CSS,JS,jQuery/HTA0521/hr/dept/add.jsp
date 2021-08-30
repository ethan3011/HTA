<%@page import="com.review.hr.dao.DepartmentDao"%>
<%@page import="com.review.hr.vo.Department"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTA 0521 Review</title>
</head>
<body>

	<%
		String departmentName = request.getParameter("name");
		int locationId = Integer.parseInt(request.getParameter("locationId"));
		
		Department dept = new Department();
		dept.setName(departmentName);
		dept.setLocationId(locationId);
		
		DepartmentDao departmentDao = new DepartmentDao();
		departmentDao.InsertDepartment(dept);
		
		response.sendRedirect("list.jsp");
		
	
	%>

</body>
</html>