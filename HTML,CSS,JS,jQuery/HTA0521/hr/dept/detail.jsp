<%@page import="com.review.hr.vo.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.review.hr.dao.EmployeeDao"%>
<%@page import="com.review.hr.dto.DepartmentDto"%>
<%@page import="com.review.hr.dao.DepartmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTA0521 Review</title>
</head>
<body>

	<h1>부서 상세 정보 페이지</h1>
	
	<p>부서의 기본정보를 표시하고 그 부서에 소속된 사원 목록을 표시한다.</p>
	
	<%
		int deptId =Integer.parseInt(request.getParameter("deptId"));
		
		DepartmentDao departmentDao = new DepartmentDao();
		DepartmentDto departmentDto = departmentDao.getDepartmentDto(deptId);
	%>
	
	<h3>부서 기본 정보</h3>
	
	<dl>
		<dt>부서아이디</dt><dd><%=deptId %></dd>
		<dt>부서 이름</dt><dd><%=departmentDto.getName() %></dd>
		<dt>부서관리자 아이디</dt><dd><%=departmentDto.getManagerId() == 0 ? "없음" : departmentDto.getManagerId() %></dd>
		<dt>부서관리자 이름</dt><dd><%=departmentDto.getManagerName() == null ? "없음" : departmentDto.getManagerName()%></dd>
		<dt>부서소재지 아이디</dt><dd><%=departmentDto.getLocationid() %></dd>
		<dt>부서소재지 도시명</dt><dd><%=departmentDto.getCity() %></dd>
		<dt>부서에 소속된 사원수</dt><dd><%=departmentDto.getEmpCount() %></dd>
	</dl>
	
	<p>
		<a href=""><strong>부서정보 수정</strong></a>

	<%
		if(departmentDto.getEmpCount() == 0) {
	%>
		<a href="remove.jsp?deptId=<%=deptId%>"><strong>부서정보 삭제</strong></a>
	<%	
		}
	%>	
		
	
	</p>
	
	
	<%
	EmployeeDao employeeDao = new EmployeeDao();
	List<Employee> employees = employeeDao.getEmployeeByDepartmentId(deptId);
	
	
	%>
	<h3>소속사원 정보</h3>
	<table border="1" style="width: 80%">
	<thead>
		<tr>
			<th>사원이름</th>
			<th>직종아이디</th>
			<th>입사일</th>
			<th>전화번호</th>
			<th>이메일</th>
		</tr>
	</thead>
	<tbody>
	
		<%
			if(employees.isEmpty()){
		%>	
			<tr>
				<td colspan="5">소속된 사원이 존재하지 않습니다.</td>
			</tr>
		<%	
			}else{
				for(Employee emp : employees){
		%>
					<tr>
					<td><%=emp.getFirstName() %> <%=emp.getLastName() %></td>
					<td><%=emp.getJobId() %></td>
					<td><%=emp.getHireDate() %></td>
					<td><%=emp.getPhoneNumber() %></td>
					<td><%=emp.getEmail() %></td>
				</tr>	
		<%
		}
			}
		%>

	</tbody>
	</table>
	
	<p><a href="list.jsp">이전페이지로 돌아가기</a></p>
	
</body>
</html>