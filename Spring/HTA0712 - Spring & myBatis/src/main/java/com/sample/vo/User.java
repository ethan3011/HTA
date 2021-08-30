package com.sample.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// lombok을 사용하여 getter, setter, tostring을 사용하는 방법
@Getter
@Setter
@ToString
public class User {
	
	private String id;
	private String name;
	private String password;
	private String email;
	private String phone;
	private String status;
	private int point;
	private Date createdDate;
}
