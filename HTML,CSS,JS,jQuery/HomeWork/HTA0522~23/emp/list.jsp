<%@page import="com.review.hr.vo.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.review.hr.dao.EmployeeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTA homeWork 0522~0523</title>
</head>
<body>

	<h1>전체 사원들의 목록 페이지</h1>
	
	<h3>사원 목록 리스트</h3>
	
	<%
		EmployeeDao employeeDao = new EmployeeDao();
		List<Employee> employees = employeeDao.getAllEmpInfo();
	%>
	
	<table border="1" style="width: 80%">
	<thead>
	
	
		<tr>
		<th>사원번호</th>
		<th>이름</th>
		<th>이메일</th>
		<th>연락처</th>
		<th>입사일</th>

		</tr>
	</thead>
	<tbody>
	<%
		for(Employee emp : employees){
	%>
			<tr>
			<td><%=emp.getId() %></td>
			<td><a href="detail.jsp?empid=<%=emp.getId()%>"><%=emp.getFirstName() %>, <%=emp.getLastName() %></a></td>
			<td><%=emp.getEmail() %></td>
			<td><%=emp.getPhoneNumber() %></td>
			<td><%=emp.getHireDate() %></td>
		</tr>
	<%	
		}
	%>
	</tbody>
	</table>
	
	<p><a href="main.jsp">이전페이지로 돌아가기</a></p>

</body>
</html>