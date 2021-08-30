package com.review.hr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.review.hr.vo.Employee;
import com.review.utils.ConnectionUtil;

public class EmployeeDao {
	
	public List<Employee> getEmployeeByDepartmentId(int deptId) throws SQLException{
		List<Employee> employees = new ArrayList<Employee>();
		String sql = "select * "
				   + "from employees "
				   + "where department_id = ? ";
		
		Connection con = ConnectionUtil.getconnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, deptId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Employee emp = new Employee();
			emp.setId(rs.getInt("employee_id"));
			emp.setFirstName(rs.getString("first_name"));
			emp.setLastName(rs.getString("last_name"));
			emp.setEmail(rs.getString("email"));
			emp.setPhoneNumber(rs.getString("phone_number"));
			emp.setHireDate(rs.getDate("hire_date"));
			emp.setJobId(rs.getString("job_id"));
			emp.setSalary(rs.getDouble("salary"));
			emp.setCommissionPct(rs.getDouble("commission_pct"));
			emp.setManagerId(rs.getInt("manager_id"));
			emp.setDepartmentId(rs.getInt("department_id"));
			
			employees.add(emp);
		}
		con.close();
		pstmt.close();
		rs.close();
		
		return employees;
	}
}
