package com.sample.dao;

import java.util.List;

import com.sample.vo.Game;

public interface GameDao {

	List<Game> getAllgames();
	
	Game getGameByNo(int gameNo);
}
