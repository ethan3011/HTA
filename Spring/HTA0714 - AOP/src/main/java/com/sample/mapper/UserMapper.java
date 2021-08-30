package com.sample.mapper;

import java.util.List;

import com.sample.vo.User;

public interface UserMapper {
	
	/**
	 * 신규 유저를 추가한다.
	 * @param user 신규유저객체
	 */
	void insertNewUser(User user);
	
	/**
	 * 변경될 유저 정보를 받아 데이터베이스에 반영한다.
	 * @param user 변경될 유저객체
	 */
	void updateUser(User user);
	
	/**
	 * 유저 아이디를 받아서 삭제한다.
	 * @param userId 삭제할 유저 아이디
	 */
	void deleteUser(String userId);
	
	/**
	 * 모든 유저 객체들을 배열로 반환한다.
	 * @return 모든유저객체
	 */
	List<User> getAllUsers();
	
	/**
	 * 아이디와 일치하는 유저를 반환한다.
	 * @param userId 조회할 유저 아이디
	 * @return 조회된 유저객체
	 */
	User getUserById(String userId);
	
	/**
	 * 연락처와 일치하는 유저를 반환한다.
	 * @param phoneNumber 조회할 연락처
	 * @return 조회된 유저객체
	 */
	User getUserByPhone(String phoneNumber);
	
	/**
	 * 이메일이 일치하는 유저를 반환한다.
	 * @param email 조회할 이메일주소
	 * @return 조호된 유저객체
	 */
	User getUserByEmail(String email);
}
