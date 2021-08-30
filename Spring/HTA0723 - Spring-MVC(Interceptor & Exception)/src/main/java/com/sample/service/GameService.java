package com.sample.service;

import java.util.List;
import java.util.Map;

import com.sample.vo.CartItem;
import com.sample.vo.Game;

public interface GameService {
	
	/**
	 * 모든 게임 목록을 반환한다.
	 * @return 게임목록
	 */
	List<Game> getAllGames();
	
	/**
	 * 게임번호로 검색해서 게임객체를 반환한다.
	 * @param gameNo 게임번호
	 * @return 게임객체
	 */
	Game getGameByNo(int gameNo);
	
	/**
	 * 상품을 카트에 추가한다.
	 * @param cartItem 상품에 추가할 카트 아이템
	 */
	void addCartItem(CartItem cartItem);
	
	/**
	 * 지정된 사용자의 장바구니 아이템 정보를 제공하는 서비스
	 * @param userId 사용자 아이디
	 * @return 장바구니 아이템 정보 목록
	 */
	List<Map<String, Object>> getCartItemById(String userId);

}
