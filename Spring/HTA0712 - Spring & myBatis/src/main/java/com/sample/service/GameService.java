package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.mapper.GameMapper;
import com.sample.vo.Game;

// String container 안의 Bean에 등록하기 위한 @Service 어노테이션
@Service
public class GameService {
	
	// Spring container 안의 bean에 등록하기 위한 Autowired 어노테이션
	@Autowired
	private GameMapper gameMapper;
	
	public void setGameMapper(GameMapper gameMapper) {
		this.gameMapper = gameMapper;
	}
	
	/**
	 * 신규 게임 정보를 받아 데이터베이스에 추가한다.
	 * @param game 신규게임정보
	 */
	public void insertNewGame(Game game) {
		gameMapper.insertNewGame(game);
	}
	
	/**
	 * 변경할 게임 정보를 받아 데이터베이스에 반영한다.
	 * @param game
	 */
	public void updateGame(Game game) {
		gameMapper.updateGame(game);
	}
	
	/** 
	 * 삭제할 게임 번호를 받아 데이터베이스에 반영한다.
	 * @param gameNo 삭제될 게임 번호
	 */
	public void deleteGameByGameNo(int gameNo) {
		gameMapper.deleteGameByGameNo(gameNo);
	}
	
	/**
	 * 모든 게임 객체를 반환한다.
	 * @return 게임리스트
	 */
	public List<Game> getAllGames(){
		return gameMapper.getAllGames();
	}
	
	/**
	 * 게임 번호를 받아 일치하는 게임을 찾는다.
	 * @param gameNo 검색할 게임 번호
	 * @return 게임객체
	 */
	public Game getGameByGameNo(int gameNo) {
		return gameMapper.getGameByGameNo(gameNo);
	}

}
