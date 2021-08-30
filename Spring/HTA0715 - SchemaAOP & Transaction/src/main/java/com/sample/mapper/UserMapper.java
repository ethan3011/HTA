package com.sample.mapper;

import java.util.List;

import com.sample.vo.User;

public interface UserMapper {
	
	/**
	 * 새로운 유저를 추가한다.
	 * @param user 새로운유저
	 */
	void InserNewUser(User user);
	
	/**
	 * 변경될 유저정보를 받아서 변경한다.
	 * @param user 변경할 유저정보
	 */
	void updateUser(User user);
	
	/**
	 * 유저 아이디로 검색된 유저를 삭제한다.
	 * @param userId 유저아이디
	 */
	void deleteUser(String userId);
	
	/**
	 * 모든 유저 정보를 반환한다.
	 * @return 모든유저정보
	 */
	List<User> getAllUsers();
	
	/**
	 * 아이디로 검색된 유저를 반환한다.
	 * @param userId 유저아이디
	 * @return 검색된 유저
	 */
	User getUserById(String userId);
	/**
	 * 연락처로 검색된 유저를 반환한다.
	 * @param phoneNo 유저연락처
	 * @return 검색된 유저
	 */
	User getUserByPhone(String phoneNo);
	
	/**
	 * 이메일로 검색된 유저를 반환한다.
	 * @param email 유저이메일주소
	 * @return 검색된 유저
	 */
	User getUserByEmail(String email);
	

}
