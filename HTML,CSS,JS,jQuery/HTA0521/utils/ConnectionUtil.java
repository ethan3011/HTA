package com.review.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtil {
	
	private static final String DRIVE_CLASS_NAME = "oracle.jdbc.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER_NAME = "hr";
	private static final String USER_PASSWORD ="zxcv1234";
	
	static {
		try {
			
			Class.forName(DRIVE_CLASS_NAME);
		}catch(ClassNotFoundException e) {
			throw new RuntimeException(e);
		}		
	}
	
	public static Connection getconnection() throws SQLException{
		return DriverManager.getConnection(URL, USER_NAME, USER_PASSWORD);
	}
}
