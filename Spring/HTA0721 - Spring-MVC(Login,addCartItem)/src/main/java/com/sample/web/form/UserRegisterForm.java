package com.sample.web.form;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class UserRegisterForm {
	
	private String id;
	private String name;
	private String password;
	private String email;
	private String phone;

}
