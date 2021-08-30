package com.review.hr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.review.hr.vo.Location;
import com.review.utils.ConnectionUtil;

public class LocationDao {
	
	public List<Location> getAllcations() throws SQLException {
		List<Location> locations = new ArrayList<Location>();
		
		String sql = "select * "
				   + "from locations "
				   + "order by city asc ";
		
		Connection con = ConnectionUtil.getconnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Location location = new Location();
			location.setId(rs.getInt("location_id"));
			location.setStreetAddress(rs.getString("street_address"));
			location.setPostalCode(rs.getString("postal_code"));
			location.setCity(rs.getString("city"));
			location.setState(rs.getString("state_province"));
			location.setConutryId(rs.getString("country_id"));
			
			locations.add(location);
		}
		con.close();
		pstmt.close();
		rs.close();
		return locations;
	}
}
