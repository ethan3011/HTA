package com.sample.dao;

import java.util.List;

import com.sample.vo.User;

public interface UserDao {

	/**
	 * 모든 유저 정보를 반환한다.
	 * @return 모든 유저 정보
	 */
	List<User> getAllUsers();
	
	/**
	 * 아이디로 검색해서 검색된 유저를 반환한다. 없을경우 Null이 반환된다.
	 * @param userId 검색할아이디
	 * @return 
	 */
	User getUserById(String userId);
	
	/**
	 * 이메일로 검색해서 검색된 유저를 반환한다. 없을경우 Null이 반환된다.
	 * @param userEmail 검색할이메일
	 * @return
	 */
	User getUserByEmail(String userEmail);
	
	/**
	 * 신규 유저정보를 받아서 추가한다.
	 * @param user 신규유저정보
	 */
	void insertUser(User user);
}
