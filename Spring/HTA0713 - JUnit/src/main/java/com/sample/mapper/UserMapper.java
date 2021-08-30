package com.sample.mapper;

import com.sample.vo.User;

public interface UserMapper {
	
	/**
	 * 신규 유저 정보를 받아서 데이터베이스에 추가한다.
	 * @param user 신규유저정보
	 */
	void inserNewUser(User user);
	
	/**
	 * 변경될 유저 정보를 받아서 데이터베이스에 반환한다.
	 * @param user 변경될 유저 정보
	 */
	void updateUser(User user);
	
	/**
	 * 유저아이디를 받아서 유저를 삭제한다.
	 * @param userNo 삭제될 유저아이디
	 */
	void deleteUser(String userId);
	
	/**
	 * 유저번호로 검색된 유저를 반환한다.
	 * @param userNo 검색할 유저번호
	 * @return 검색된 유저정보
	 */
	User getUserByUserId(String userId);
	
	/**
	 * 연락처로 검색된 유저를 반환한다.
	 * @param phone 검색할 유저연락처
	 * @return 검색된 유저정보
	 */
	User getUserByUserPhone(String Phone);
	
	/**
	 * 이메일로 검색된 유저를 반환한다.
	 * @param email 검색할 이메일
	 * @return 검색된 유저정보
	 */
	User getUserByUserEmail(String email);
	
	
}
