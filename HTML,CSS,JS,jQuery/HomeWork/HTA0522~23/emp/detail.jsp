<%@page import="com.review.hr.dto.EmployeeDto"%>
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

	<%
		int empid = Integer.parseInt(request.getParameter("empid"));
	
		EmployeeDao employeeDao = new EmployeeDao();
		EmployeeDto employeeDto = employeeDao.getEmployeeDto(empid);
	%>

	<h1> 사원의 상세정보 표시</h1>
	
	<h3><%=employeeDto.getFirstName() %>, <%=employeeDto.getLastName() %>의 상세정보</h3>
	
	<dl>
		<dt>사원번호</dt><dd><%=employeeDto.getEmployeeId() %></dd>
		<dt>사원이름</dt><dd><%=employeeDto.getFirstName() %>, <%=employeeDto.getLastName() %></dd>
		<dt>이메일</dt><dd><%=employeeDto.getEmail() %></dd>
		<dt>연락처</dt><dd><%=employeeDto.getPhoneNumber() %></dd>
		<dt>입사일</dt><dd><%=employeeDto.getHireDate() %></dd>
		<dt>월급</dt><dd><%=employeeDto.getSalary() %></dd>
		<dt>커미션</dt><dd><%=employeeDto.getCommission_pct() == 0.0 ? "없음" : employeeDto.getCommission_pct()%></dd>
		<dt>직종번호</dt><dd><%=employeeDto.getJob_id()%></dd>
		<dt>직종이름</dt><dd><%=employeeDto.getJob_title() %></dd>
		<dt>부서번호</dt><dd><%=employeeDto.getDepartmentId() %></dd>
		<dt>부서이름</dt><dd><%=employeeDto.getDepartmentname() %></dd>		
		<dt>근무지위치번호</dt><dd><%=employeeDto.getLocationId() %></dd>
		<dt>근무지우편번호</dt><dd><%=employeeDto.getPostalCode() %></dd>
		<dt>근무지주소</dt><dd><%=employeeDto.getStreetAddress() %></dd>
		<dt>근무도시명</dt><dd><%=employeeDto.getCity() %></dd>
	</dl>
	
	<p><a href="main.jsp">이전페이지로 돌아가기</a></p>

</body>
</html>