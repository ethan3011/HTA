package com.sample.service;

import java.util.List;

import com.sample.vo.User;

public interface UserService {
	
	List<User> getAllUsers();
	
	void login(String id, String password);
	
	void registerUser(User user);

}
