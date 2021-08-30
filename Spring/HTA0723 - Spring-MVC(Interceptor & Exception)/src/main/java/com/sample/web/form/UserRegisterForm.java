package com.sample.web.form;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserRegisterForm {
	
	private String id;
	private String name;
	private String password;
	private String phone;
	private String email;

}
