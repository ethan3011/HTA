package com.review.hr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.review.hr.dto.EmployeeDto;
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
	
	public List<Employee> getAllEmpInfo() throws SQLException{
		List<Employee> employees = new ArrayList<Employee>();
		String sql = "select employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id "
				   + "from employees "
				   + "order by employee_id asc ";
		
		Connection con = ConnectionUtil.getconnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
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
	
	public EmployeeDto getEmployeeDto(int employeeId) throws SQLException{
		EmployeeDto dto = null;
		
		String sql = "select E.employee_id, E.first_name, E.last_name, E.email, E.phone_number, E.hire_date, E.salary, E.commission_pct, "
				   + "J.job_id, J.job_title, D.department_id, D.department_name, L.location_id, L.street_address, L.postal_code, L.city "
			   	   + "from employees E, departments D, jobs J, locations L "
			   	   + "where E.department_id = D.department_id "
			   	   + "and E.job_id = J.job_id "
			   	   + "and D.location_id = L.location_id "
			   	   + "and employee_id = ? ";
		
		Connection con = ConnectionUtil.getconnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, employeeId);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			dto = new EmployeeDto();
			dto.setEmployeeId(rs.getInt("employee_id"));
			dto.setFirstName(rs.getNString("first_name"));
			dto.setLastName(rs.getString("last_name"));
			dto.setEmail(rs.getString("email"));
			dto.setPhoneNumber(rs.getString("phone_number"));
			dto.setHireDate(rs.getDate("hire_date"));
			dto.setSalary(rs.getDouble("salary"));
			dto.setCommission_pct(rs.getDouble("commission_pct"));
			dto.setJob_id(rs.getString("job_id"));
			dto.setJob_title(rs.getString("job_title"));
			dto.setDepartmentId(rs.getInt("department_id"));
			dto.setDepartmentname(rs.getString("department_name"));
			dto.setLocationId(rs.getInt("location_id"));
			dto.setStreetAddress(rs.getString("street_address"));
			dto.setPostalCode(rs.getString("postal_code"));
			dto.setCity(rs.getString("city"));
			
		}
		con.close();
		pstmt.close();
		rs.close();
		
		return dto;
	}
	
	
	public List<Employee> JobOrders() throws SQLException{
		List<Employee> employees = new ArrayList<Employee>();
		String sql = "select distinct job_id "
				+ "from employees "
				+ "order by job_id ";
		
		Connection con = ConnectionUtil.getconnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Employee emp = new Employee();
			emp.setJobId(rs.getString("job_id"));
			
			employees.add(emp);
		}
		con.close();
		pstmt.close();
		rs.close();
		
		return employees;
	}
	
	public List<Employee> managerOrders() throws SQLException{
		List<Employee> employees = new ArrayList<Employee>();
		String sql = "select distinct manager_id "
				+ "from employees "
				+ "where manager_id is not null "
				+ "order by manager_id ";
		
		Connection con = ConnectionUtil.getconnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Employee emp = new Employee();
			emp.setManagerId(rs.getInt("manager_id"));
			
			employees.add(emp);
		}
		con.close();
		pstmt.close();
		rs.close();
		
		return employees;
	}
	
	public List<Employee> departmentOrders() throws SQLException{
		List<Employee> employees = new ArrayList<Employee>();
		String sql = "select distinct department_id "
				+ "from employees "
				+ "where department_id is not null "
				+ "order by department_id ";
		
		Connection con = ConnectionUtil.getconnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Employee emp = new Employee();
			emp.setDepartmentId(rs.getInt("department_id"));
			
			employees.add(emp);
		}
		con.close();
		pstmt.close();
		rs.close();
		
		return employees;
	}
	
	
	public void insertEmployee(Employee employee) throws SQLException {
		String sql = "Insert into employees "
				   + "(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) "
				   + "values "
				   + "(EMPLOYEES_SEQ.nextval, ?, ?, ?, ?, sysdate, ?, ? ,? , ?, ? )" ;
		
		Connection con = ConnectionUtil.getconnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, employee.getFirstName());
		pstmt.setString(2, employee.getLastName());
		pstmt.setString(3, employee.getEmail());
		pstmt.setString(4, employee.getPhoneNumber());
		pstmt.setString(5, employee.getJobId());
		pstmt.setDouble(6, employee.getSalary());
		pstmt.setDouble(7, employee.getCommissionPct());
		pstmt.setInt(8, employee.getManagerId());
		pstmt.setInt(9, employee.getDepartmentId());
		pstmt.executeUpdate();
		
		con.close();
		pstmt.close();
		
	}
	
	
	
}
