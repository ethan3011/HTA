package com.sample.service;

import java.util.List;

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
		return gameDao.getAllGames();
	}
	
	@Override
	public Game getGameByNo(int gameNo) {
		
		return gameDao.getGameByNo(gameNo);
	}
	
	@Override
	public void addCartItem(CartItem cartItem) {
		
		CartItem searchCartItem = cartItemDao.getCartItem(cartItem.getId(), cartItem.getProductNo());
		if(searchCartItem == null) {
			cartItemDao.insertCartItem(cartItem);
		} else {
			searchCartItem.setAmount(searchCartItem.getAmount() + 1);
			cartItemDao.updateCartItem(searchCartItem);
		}
	}
}
