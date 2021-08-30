package com.sample.dao;

import com.sample.vo.User;

public interface UserDao {
	void InsertNewUser(User user);
	
	User getUserById(String userId);
	
	User getUserByEmail(String userEmail);
	
	User getUserByPhone(String userPhone);

}
