package com.sample.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.dao.CartItemDao;
import com.sample.dao.GameDao;
import com.sample.vo.CartItem;
import com.sample.vo.Game;

@Service
public class GameServiceImpl implements GameService{
	
	@Autowired
	private GameDao gameDao;
	
	@Autowired
	private CartItemDao cartItemDao;
	
	@Override
	public List<Game> getAllGames() {
		List<Game> gameList = gameDao.getAllgames();
		return gameList;
	}
	
	@Override
	public Game getGameByNo(int gameNo) {
		Game game = gameDao.getGameByNo(gameNo);
		return game;
	}
	
	@Override
	public void addCartItem(CartItem cartItem) {
		CartItem foundItem = cartItemDao.getCartItem(cartItem.getId(), cartItem.getProductNo());
		if(foundItem == null) {
			cartItemDao.addNewCartItem(cartItem);
		} else {
			foundItem.setAmount(foundItem.getAmount() + 1);
			cartItemDao.updateCartItem(foundItem);
		} 
	}
	
	@Override
	public List<Map<String, Object>> getCartItemById(String userId) {
		return cartItemDao.getCartItemById(userId);
	}
}
