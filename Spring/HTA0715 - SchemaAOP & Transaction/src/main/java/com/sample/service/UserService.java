package com.sample.service;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.exception.MallBusinessException;
import com.sample.mapper.UserMapper;
import com.sample.vo.User;

@Service
// Transactional을 설정함으로 써 에러가 발생시 
// org.springframework.jdbc.datasource.DataSourceTransactionManager - Initiating transaction rollback (롤백현상으로 초기화 되버림) 
@Transactional
public class UserService {
	
	@Value("${user.default.point}")
	int defaultPoint;
	
	@Autowired
	private UserMapper userMapper;
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	
	
	
	public void addnewUser(User user) {
		
		User foundUser = userMapper.getUserById(user.getId());
		if(foundUser != null) {
			throw new MallBusinessException("["+user.getId()+"]는 이미 존재하는 아이디 입니다.");
		}
		foundUser = userMapper.getUserByPhone(user.getPhone());
		if(foundUser != null) {
			throw new MallBusinessException("["+user.getPhone()+"]는 이미 존재하는 연락처 입니다.");
		}
		foundUser = userMapper.getUserByEmail(user.getEmail());
		if(foundUser != null) {
			throw new MallBusinessException("["+user.getEmail()+"]는 이미 존재하는 이메일 입니다.");
		}
		
		String encodedPassword = DigestUtils.sha256Hex(user.getPassword());
		
		user.setPassword(encodedPassword);
		userMapper.InserNewUser(user);
		
		// 에러를 설정하여 Transaction이 작동하는지 확인할 수 있다. 주석처리시 추가가능.
		int i = 10;
		if(i == 10) {
			throw new RuntimeException("설정된 예외 발생");
		}
		
		user = userMapper.getUserById(user.getId());
		user.setPoint(defaultPoint);
		userMapper.updateUser(user);
		
	}
	
	public void DeleteUser(String userId) {
		userMapper.deleteUser(userId);
	}
	
	public User getUserDetail(String userId) {
		return userMapper.getUserById(userId);
	}
}
