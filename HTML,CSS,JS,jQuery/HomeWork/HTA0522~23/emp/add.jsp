<%@page import="com.review.hr.dao.EmployeeDao"%>
<%@page import="com.review.hr.vo.Employee"%>
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
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String jobId = request.getParameter("jobId");
		double salary = Double.parseDouble(request.getParameter("salary"));
		double commission = Double.parseDouble(request.getParameter("commission"));
		int managerId = Integer.parseInt(request.getParameter("managerId"));
		int departmentId = Integer.parseInt(request.getParameter("departmentId"));
		
		Employee emp = new Employee();
		emp.setFirstName(firstName);
		emp.setLastName(lastName);
		emp.setEmail(email);
		emp.setPhoneNumber(phone);
		emp.setJobId(jobId);
		emp.setSalary(salary);
		emp.setCommissionPct(commission);
		emp.setManagerId(managerId);
		emp.setDepartmentId(departmentId);
		
		EmployeeDao employeeDao = new EmployeeDao();
		employeeDao.insertEmployee(emp);
		
		response.sendRedirect("list.jsp");

	%>

</body>
</html>