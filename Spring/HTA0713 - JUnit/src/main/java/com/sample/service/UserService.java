package com.sample.service;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.sample.exception.MallBusinessException;
import com.sample.mapper.UserMapper;
import com.sample.vo.User;

@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	
	@Value("${regsiter.BonusPoint}")
	private int REGISTER_EVENT_BONUS;
	
	public void addNewUser(User user) {
		
		User foundUser = userMapper.getUserByUserId(user.getId());
		if(foundUser != null) {
			throw new MallBusinessException("[" + user.getId() + "] 로 이미 가입되어 있습니다.");
		}
		foundUser = userMapper.getUserByUserPhone(user.getPhone());
		if(foundUser != null) {
			throw new MallBusinessException("[" + user.getPhone() + "] 로 이미 가입되어 있습니다.");
		}
		foundUser = userMapper.getUserByUserEmail(user.getEmail());
		if(foundUser != null) {
			throw new MallBusinessException("[" + user.getEmail() + "] 로 이미 가입되어 있습니다.");
		}
		
		String encodedPassword = DigestUtils.sha256Hex(user.getPassword());
		System.out.println(encodedPassword);
		user.setPassword(encodedPassword);
		userMapper.inserNewUser(user);
		
		user = userMapper.getUserByUserId(user.getId());
		
		user.setPoint(REGISTER_EVENT_BONUS);
		userMapper.updateUser(user);
	}
	
	public User getUserDetail(String userId) {
		return userMapper.getUserByUserId(userId);
	}
	
	public void removeUser(String userId) {
		userMapper.deleteUser(userId);
	}
}
