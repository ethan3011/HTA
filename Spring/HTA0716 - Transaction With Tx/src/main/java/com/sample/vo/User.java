package com.sample.vo;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class User {
	
	private String id;
	private String name;
	private String password;
	private String email;
	private String phone;
	private String status;
	private Date createdDate;
	private int point;
	
	@Builder
	public User(String id, String name, String password, String email, String phone) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.phone = phone;
	}

	
}
