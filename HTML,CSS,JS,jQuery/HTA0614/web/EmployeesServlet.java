package com.sample.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.sample.dao.EmployeeDao;
import com.sample.vo.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/employees")
public class EmployeesServlet extends HttpServlet{
	
	EmployeeDao employeeDao = EmployeeDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// XMLHttpRequest가 서버로 보낸 부서 아이디 조회
		int departmentId = Integer.parseInt(req.getParameter("id"));
		
		// 부서아이디에 해당하는 부서에 소속된 사원목록 조회
		List<Employee> employees = employeeDao.getEmployeeByDepartmentId(departmentId);
		
		// 획득된 사원정보를 JSON 형식의 텍스트로 변환
		Gson gson = new Gson();
		String jsonText = gson.toJson(employees);
		System.out.println(jsonText);
		/*
		[{"id":120,"firstName":"Matthew","lastName":"Weiss","phone":"650.123.1234","email":"MWEISS","jobId":"ST_MAN","salary":8000.0,"commissionPct":0.0},
		 {"id":121,"firstName":"Adam","lastName":"Fripp","phone":"650.123.2234","email":"AFRIPP","jobId":"ST_MAN","salary":8200.0,"commissionPct":0.0},
		 {"id":122,"firstName":"Payam","lastName":"Kaufling","phone":"650.123.3234","email":"PKAUFLIN","jobId":"ST_MAN","salary":7900.0}]
		 */
		
		// JSON 형식의 텍스트로 변환된 사원목록정보를 응답으로 보낸다.
		resp.setContentType("application/json; charset=utf-8");
		PrintWriter writer = resp.getWriter();
		writer.println(jsonText);
	}

}
