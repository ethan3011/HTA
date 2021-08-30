package com.sample.service;

import java.util.List;

import com.sample.vo.CartItem;
import com.sample.vo.Game;

public interface GameService {
	
	public List<Game> getAllGames();
	
	public Game getGameByNo(int gameNo);
	
	void addCartItem(CartItem cartItem);

}
