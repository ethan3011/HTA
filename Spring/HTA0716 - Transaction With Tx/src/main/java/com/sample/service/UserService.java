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
	
	@Value("${RegisterBonusPoint}")
	int RegisterBonusPoint;
	
	@Autowired
	UserMapper userMapper;
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	
	public void addNewUser(User user) {
		
		User foundUser = userMapper.getUserById(user.getId());
		if(foundUser != null) {
			throw new MallBusinessException("["+user.getId()+"]는 이미 존재하는 아이디 입니다.");
		}
		foundUser = userMapper.getUserByPhone(user.getPhone());
		if(foundUser != null) {
			throw new MallBusinessException("["+user.getPhone()+"]는 이미 존재하는 연락처 입니다.");
		}
		foundUser = userMapper.getUserById(user.getEmail());
		if(foundUser != null) {
			throw new MallBusinessException("["+user.getEmail()+"]는 이미 존재하는 이메일 입니다.");
		}
		
		String encodedPassword = DigestUtils.sha256Hex(user.getPassword());
		user.setPassword(encodedPassword);
		
		userMapper.insertNewUser(user);
		
//		int i = 10;
//		if ( i == 10) {
//			throw new MallBusinessException("강제에러발생");
//		}
		
		
		user = userMapper.getUserById(user.getId());
		user.setPoint(RegisterBonusPoint);
		userMapper.updateUser(user);
		System.out.println("성공적으로 추가가 완료되었습니다.");
	}
	
}

