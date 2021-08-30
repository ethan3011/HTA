package com.sample.mapper;

import java.util.List;

import com.sample.vo.Game;

public interface GameMapper {
	
	/**
	 * 신규 게임정보를 받아 데이터베이스에 추가한다.
	 * @param game 신규 게임 정보
	 */
	void insertNewGame(Game game);
	
	/**
	 * 변경될 게임 정보를 받아 데이터베이스에 반영한다.
	 * @param game 변경될 게임 정보
	 */
	void updateGame(Game game);
	
	/**
	 * 삭제될 게임 번호를 받아 데이터베이스에 반영한다.
	 * @param gameNo 삭제될 게임 번호
	 */
	void deleteGameByGameNo(int gameNo);

	/**
	 * 모든 게임의 리스트를 반환한다.
	 * @return 모든 게임 리스트
	 */
	List<Game> getAllGames();
	
	/**
	 * 게임 번호로 게임을 조회한다.
	 * @param gameNo 게임번호
	 * @return 게임객체
	 */
	Game getGameByGameNo(int gameNo);
	
}
