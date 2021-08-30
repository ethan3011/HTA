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
	
	@Value("${RegisterEventPoint}")
	int EventRegisterPoint;
	
	@Autowired
	UserMapper userMapper;
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	
	public void AddNewUser(User user) {
		User foundUser = userMapper.getUserById(user.getId());
		
		if(foundUser != null) {
			throw new MallBusinessException("["+user.getId()+"] 는 이미 존재하는 아이디 입니다.");
		}
		
		foundUser = userMapper.getUserByPhone(user.getPhone());
		if(foundUser != null) {
			throw new MallBusinessException("["+user.getPhone()+"] 는 이미 존재하는 아이디 입니다.");
		}
		
		foundUser = userMapper.getUserByEmail(user.getEmail());
		if(foundUser != null) {
			throw new MallBusinessException("["+user.getEmail()+"] 는 이미 존재하는 아이디 입니다.");
		}
		
		String encodedPassword = DigestUtils.sha256Hex(user.getPassword());
		
		user.setPassword(encodedPassword);
		userMapper.insertNewUser(user);
		
		user = userMapper.getUserById(user.getId());
		user.setPoint(EventRegisterPoint);
		userMapper.updateUser(user);
	}
	
	public User getUserById(String userId) {
		return userMapper.getUserById(userId);
	}
	
	public void removeUser(String userId) {
		userMapper.deleteUser(userId);
	}
}
