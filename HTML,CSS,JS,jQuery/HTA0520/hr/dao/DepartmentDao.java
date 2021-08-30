package com.review.hr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

}
