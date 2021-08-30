package com.sample.mapper;

import java.util.List;

import com.sample.vo.User;

public interface UserMapper {
	
	void insertNewUser(User user);
	
	void updateUser(User user);
	
	List<User> getAllProducts();
	
	User getUserById(String userId);
	
	User getUserByPhone(String Phone);
	
	User getUserByEmail(String Email);

}
