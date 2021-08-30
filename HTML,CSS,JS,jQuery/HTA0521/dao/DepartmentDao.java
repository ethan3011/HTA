package com.review.hr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.review.hr.dto.DepartmentDto;
import com.review.hr.vo.Department;
import com.review.utils.ConnectionUtil;

public class DepartmentDao {
	
	public List<Department> getAllDepartments() throws SQLException {
		List<Department> departments = new ArrayList<Department>();
		String sql = "select department_id, department_name, manager_id, location_id "
				   + "from departments "
				   + "order by department_id asc ";
		
		Connection con = ConnectionUtil.getconnection();
		PreparedStatement pstmt = con.prepareStatement(sql);

		ResultSet rs = pstmt.executeQuery();	
		
		while(rs.next()) {
			Department dpts = new Department();
			dpts.setId(rs.getInt("department_id"));
			dpts.setName(rs.getString("department_name"));
			dpts.setManagerId(rs.getInt("manager_id"));
			dpts.setLocationId(rs.getInt("location_id"));
			departments.add(dpts);
		}
		
		con.close();
		pstmt.close();
		rs.close();
		
		return departments;
	}
	
	public DepartmentDto getDepartmentDto(int deptId) throws SQLException{
		String sql ="select D.department_id, D.department_name, D.manager_id, M.first_name manager_name, L.location_id, L.city, "
				+ "(select count(*) from employees E where E.department_id = ?) emp_count "
				+ "from departments D, employees M, Locations L "
				+ "where D.department_id = ? "
				+ "and D.manager_id = M.employee_id(+) "
				+ "and D.location_id = L.location_id ";
		
		DepartmentDto dto = null;
		
		Connection con = ConnectionUtil.getconnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, deptId);
		pstmt.setInt(2, deptId);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			dto = new DepartmentDto();
			dto.setId(rs.getInt("department_id"));
			dto.setName(rs.getString("department_name"));
			dto.setManagerId(rs.getInt("manager_id"));
			dto.setManagerName(rs.getString("manager_name"));
			dto.setLocationid(rs.getInt("location_id"));
			dto.setCity(rs.getString("city"));
			dto.setEmpCount(rs.getInt("emp_count"));
		}
		rs.close();
		pstmt.close();
		rs.close();	
		
		return dto;
	}
	
	public void InsertDepartment(Department department) throws SQLException {
		String sql = "insert into departments "
				   + "(department_id, department_name, location_id) "
				   + "values "
				   + "(departments_seq.nextval, ?, ?)";
		
		Connection con = ConnectionUtil.getconnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, department.getName());
		pstmt.setInt(2, department.getLocationId());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}

}

