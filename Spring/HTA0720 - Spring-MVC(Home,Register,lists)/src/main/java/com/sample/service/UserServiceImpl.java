package com.sample.service;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.dao.UserDao;
import com.sample.vo.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserDao userDao;
	
	
	@Override
	public void registerUser(User user) {
		User savedUser = userDao.getUserById(user.getId());
		if (savedUser != null) {
			throw new RuntimeException("[" + user.getId() + "]는 이미 사용중인 아이디 입니다.");
		}
		savedUser = userDao.getUserByEmail(user.getEmail());
		if(savedUser != null) {
			throw new RuntimeException("[" + user.getEmail() + "]는 이미 사용중인 이메일 입니다.");
		}
		
		String screctPassword = DigestUtils.sha256Hex(user.getPassword());
		user.setPassword(screctPassword);
		
		userDao.insertUser(user);
		
	}
}
