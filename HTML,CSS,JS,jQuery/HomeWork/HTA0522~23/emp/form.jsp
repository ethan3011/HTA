<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.stream.Collector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.review.hr.vo.Employee"%>
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

	<h1>새로운 사원정보 등록하기</h1>
	
	<%
		EmployeeDao employeeDao = new EmployeeDao();
		List<Employee> emps = employeeDao.getAllEmpInfo();
		List<Employee> jobs = employeeDao.JobOrders();
		List<Employee> managers = employeeDao.managerOrders();
		List<Employee> depts = employeeDao.departmentOrders();
	%>
	
	
	<h3>새 사원정보 등록 폼</h3>
	<form method="post" action="add.jsp">
	<label>이름</label><br />
	<input type="text" name="firstName" /><br />
	
	<label>성</label><br />
	<input type="text" name="lastName" /><br />
	
	<label>이메일</label><br />
	<input type="email" name="email" /><br />
	
	<label>연락처</label><br />
	<input type="text" name="phone"><br />
	
	<label>직종</label><br />
	<select name="jobId">
		<%
			for(Employee emp : jobs){
		%>
			<option><%=emp.getJobId() %></option>
				
		<%	
			}
		%>
	</select><br />
	
	<label>월급</label><br />
	<input type="number" name="salary" /><br />
	
	<label>커미션</label><br />
	<input type="number" step="0.01" name="commission"><br />
	
	<label>매니저번호</label><br />
	<select name="managerId">
		<%
			for(Employee emp : managers){
		%>
			<option><%=emp.getManagerId() %></option>
		<%	
			}
		%>
	</select><br />
	<label>소속부서</label><br />
	<select name="departmentId">
		<%
			for(Employee emp : depts){
		%>
			<option><%=emp.getDepartmentId() %></option>
				
		<%	
			}
		%>
	</select><br />
	<button type="submit">등록</button>
	</form>

	<p><a href="main.jsp">이전페이지로 돌아가기</a></p>
</body>
</html>