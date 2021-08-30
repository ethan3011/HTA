package com.sample.mapper;

import java.util.List;

import com.sample.vo.User;

public interface UserMapper {
	
	/**
	 * 새 사용자 정보를 저장한다.
	 * @param user 사용자 정보
	 */
	void insertUser(User user);
	
	/**
	 * 변경될 사용자의 정보를 전달받아서 데이터베이스에 반영한다.
	 * @param user 변경될 유저 정보를 포함하고 있는 사용자 정보
	 */
	void UpdateUser(User user);
	
	/**
	 * 사용자 아이디를 전달받아서 해당 사용자 정보를 조회해서 반환한다.
	 * @param id 사용자 아이디 정보
	 * @return 사용자 정보, 일치하는 아이디가 없으면 null을 반환한다.
	 */
	User getUserById(String id);
	
	/**
	 * 사용자 이메일을 전달받아서 해당 사용자 정보를 조회해서 반환한다.
	 * @param email 사용자 이메일
	 * @return 사용자 정보, 일치하는 이메일이 없으면 null을 반환한다.
	 */
	User getUserByEmail(String email);

	/**
	 * 사용자 전화번호를 전달받아서 해당 사용자 정보를 조회해서 반환한다.
	 * @param phoneNumber 사용자 전화번호
	 * @return 같은 전화번호를 가진 사용자 목록, 일치하는 전화번호가 없으면 빈 List가 반환된다.
	 */
	List<User> getUserByPhone(String phoneNumber);

}
