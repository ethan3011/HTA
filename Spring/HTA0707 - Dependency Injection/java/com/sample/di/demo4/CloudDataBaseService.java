package com.sample.di.demo4;

public class CloudDataBaseService {
	
	private String url;
	private String username;
	private String password;
	private int timeout;
	public void setUrl(String url) {
		this.url = url;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setTimeout(int timeout) {
		this.timeout = timeout;
	}
	
	public CloudDataBaseService() {
		
	}
	
	public CloudDataBaseService(String username, String password) {
		this.url = "free.rds.amazon.com";
		this.username = username;
		this.password = password;
		this.timeout = -1;
	}
	
	public CloudDataBaseService(String url, String username, String password) {
		this.url = url;
		this.username = username;
		this.password = password;
		this.timeout = -1;
	}
	
	public void config() {
		System.out.println("url : " + url);
		System.out.println("username : " + username);
		System.out.println("password : " + password);
		System.out.println("timeout : " + timeout);
	}
}
