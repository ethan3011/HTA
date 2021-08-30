package com.sample.di.demo7;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeDao {

	@Value("${db.driverClassName}")
	private String driverClassname;
	@Value("${db.url}")
	private String url;
	@Value("${db.username}")
	private String username;
	@Value("${db.password}")
	private String password;
	
	
	
	
	public void config() {
		System.out.println("driverClassname : " + driverClassname);
		System.out.println("url : " + url);
		System.out.println("username : " + username);
		System.out.println("password : " + password);
	}
}
