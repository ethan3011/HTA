package com.sample.service;

import java.util.Map;

import com.sample.vo.User;

public interface UserService {
	
	/**
	 * 새로운 유저 정보를 전달받아서 추가한다.
	 * @param user 신규유저정보
	 */
	void addNewUser(User user);
	
	/**
	 * 아이디와 비밀번호를 전달받아서 로그인 기능을 수행한다.
	 * @param userId 아이디
	 * @param userPassword 비밀번호
	 */
	void login(String userId, String userPassword);
	
	/**
	 * 아이디로 검색해서 유저에 저장된 정보들을 가져온다.
	 * @param userId 아이디
	 * @return 내카트/내구매내역/내포인트변동내역 etc..
	 */
	Map<String, Object> GetUserDetail(String userId);

}
