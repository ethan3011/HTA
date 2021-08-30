package com.sample.dao;

import java.util.List;

import com.sample.vo.Game;

public interface GameDao {
	
	/**
	 * 모든 게임 목록을 반환한다.
	 * @return 게임목록
	 */
	public List<Game> getAllGames();
	
	/**
	 * 번호로 검색된 게임객체를 반환한다.
	 * @param gameNo 검색할 게임번호
	 * @return 검색된 게임객체
	 */
	public Game getGameByNo(int gameNo);

}
