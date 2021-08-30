package com.sample.service;


import java.util.HashMap;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.dao.UserDao;
import com.sample.exception.UserLoginException;
import com.sample.exception.UserRegisterException;
import com.sample.vo.User;
import com.sample.web.utils.SessionUtils;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;
	
	@Override
	public void addNewUser(User user) {
		User foundUser = userDao.getUserById(user.getId());
		if(foundUser != null) {
			throw new UserRegisterException("아이디 중복", "["+user.getId()+"]는 이미 사용중인 아이디 입니다.");
		}
		foundUser = userDao.getUserByPhone(user.getPhone());
		if(foundUser != null) {
			throw new UserRegisterException("연락처 중복", "["+user.getPhone()+"]는 이미 사용중인 연락처 입니다.");
		}
		foundUser = userDao.getUserByEmail(user.getEmail());
		if(foundUser != null) {
			throw new UserRegisterException("이메일 중복", "["+user.getEmail()+"]는 이미 사용중인 이메일 입니다.");
		}
		
		String encodedPassword = DigestUtils.sha256Hex(user.getPassword());
		user.setPassword(encodedPassword);
		
		userDao.InsertNewUser(user);
	}
	
	@Override
	public void login(String userId, String userPwd) {
		
		User foundUser = userDao.getUserById(userId);
		
		if(foundUser == null) {
			throw new UserLoginException("아이디/비밀번호 오류 ", "아이디 혹은 비밀번호가 일치하지 않습니다.");
		}
		if("inactive".equals(foundUser.getStatus())) {
			throw new UserLoginException("사용중지된 회원", "탈퇴 혹은 일시정지 처리된 사용자입니다.");
		}
		String encodedPassword = DigestUtils.sha256Hex(userPwd);
		if(!encodedPassword.equals(foundUser.getPassword())) {
			throw new UserLoginException("아이디/비밀번호 오류 ", "아이디 혹은 비밀번호가 일치하지 않습니다.");
		}
		
		SessionUtils.addAttribute("LOGINED_USER", foundUser);
	}
	
	@Override
	public Map<String, Object> GetUserDetail(String userId) {
		Map<String, Object> userDetailMap = new HashMap<String, Object>();
		
		User user = userDao.getUserById(userId);
		
		userDetailMap.put("user", user);
		
		return userDetailMap;
	}
	
	
}
