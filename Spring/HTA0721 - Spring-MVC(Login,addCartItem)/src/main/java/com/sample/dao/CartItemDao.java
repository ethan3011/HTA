package com.sample.dao;

import org.apache.ibatis.annotations.Param;

import com.sample.vo.CartItem;

public interface CartItemDao {
	
	/**
	 * 추가할 상품객체를 전달받아서 카트에 추가한다.
	 * @param cartItem 카트에 추가할 신규상품객체
	 */
	void insertCartItem(CartItem cartItem);
	
	/**
	 * 변경할 상품객체를 전달받아서 변경한다.
	 * @param cartItem 변경할 상품객체
	 */
	void updateCartItem(CartItem cartItem);
	
	/**
	 * 유저아이디와 상품번호가 일치하는 카트객체를 반환한다.
	 * @param userId 유저아이디
	 * @param productNo 상품번호
	 * @return 일치하는 상품객체, 없을경우 null이 반한된다.
	 */
	CartItem getCartItem(@Param("userId") String userId, @Param("productNo")int productNo);

}
