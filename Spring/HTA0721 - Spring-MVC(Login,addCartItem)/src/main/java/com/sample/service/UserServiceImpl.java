package com.sample.service;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.dao.UserDao;
import com.sample.vo.User;
import com.sample.web.utils.SessionUtils;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;
	
	@Override
	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}
	
	@Override
	public void registerUser(User user) {
		
		User savedUser = userDao.getUserById(user.getId());
		if(savedUser != null) {
			throw new RuntimeException("[" + user.getId() + "] 는 이미 존재하는 아이디 입니다.");
		}
		savedUser = userDao.getUserByEmail(user.getEmail());
		if(savedUser != null) {
			throw new RuntimeException("[" + user.getEmail() + "]는 이미 존재하는 이메일 입니다.");
		}
		
		// 이름,연락처, 조회 및 에러는 생략
		
		String encodedPassword = DigestUtils.sha256Hex(user.getPassword());
		user.setPassword(encodedPassword);
		
		userDao.insertUser(user);
		
	}
	
	@Override
	public void login(String id, String password) {
		
		User user = userDao.getUserById(id);
		
		if(user == null) {
			throw new RuntimeException("아이디 혹은 비밀번호가 유효하지 않습니다.");
		}
		if(user.getStatus().equals("inactive")) {
			throw new RuntimeException("탈퇴되거나 이용 제한된 회원입니다.");
		}
		String encodedPassword = DigestUtils.sha256Hex(password);
		if(!user.getPassword().equals(encodedPassword)) {
			throw new RuntimeException("아이디 혹은 비밀번호가 일치하지 않습니다.");
		}
		// com.sample.web.utils 에 있는 SessionUtils 클래스에 정의된 addAtrribute를 사용한다.
		SessionUtils.addAttributes("LOGINED_USER", user);
	}
}
