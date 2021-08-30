package com.sample.service;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.sample.exception.MallBusinessException;
import com.sample.mapper.UserMapper;
import com.sample.vo.User;

@Service
public class UserService {
	
	@Value("${user.signup.bonus.point}")
	private int signupBonusePoint;
	
	@Autowired
	private UserMapper usermapper;
	
	public void setUsermapper(UserMapper usermapper) {
		this.usermapper = usermapper;
	}
	
	
	/**
	 * 신규 사용자 정보를 전달받아서 회원가입 처리한다.
	 * @param user 신규 사용자 정보
	 */
	public void AddNewUser(User user) {
		
		User foundUser = usermapper.getUserById(user.getId());
		if(foundUser != null) {
			throw new MallBusinessException("["+user.getId()+"] 는 사용중인 아이디 입니다.");
		}
		
		foundUser = usermapper.getUserByEmail(user.getEmail());
		if(foundUser != null) {
			throw new MallBusinessException("["+user.getEmail()+"] 는 사용중인 이메일 입니다.");
		}
		
		List<User> foundUsers = usermapper.getUserByPhone(user.getPhone());
		if(!foundUsers.isEmpty()) {
			throw new MallBusinessException("["+user.getPhone()+"]는 이미 사용중인 연락처 입니다.");
		}
		
		String encodedPassword = DigestUtils.sha256Hex(user.getPassword());
		user.setPassword(encodedPassword);
		
		usermapper.insertUser(user);
		
		user = usermapper.getUserById(user.getId());
		user.setPoint(signupBonusePoint);
		usermapper.UpdateUser(user);
	}
}
