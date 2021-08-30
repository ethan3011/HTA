package com.sample.mapper;

import java.util.List;


import com.sample.vo.Product;

public interface ProductMapper {
	
	/**
	 * 새로운 상품정보를 전달받아서 추가한다.
	 * @param product 새 상품
	 */	
	void insertProduct(Product product);
	
	/**
	 * 기존의 상품정보를 받아서 상품정보를 변경한다.
	 * @param product 변경될 상품정보
	 */
	void updateProduct(Product product);
	
	/**
	 * 모든 상품의 목록을 반환한다.
	 * @return 모든 상품의 정보
	 */
	List<Product> getAllProducts();
	
	/**
	 * 상품의 번호로 검색하여 일치하는 상품을 반환한다.
	 * @param ProductNo 검색할 상품번호
	 * @return 검색된 상품
	 */
	Product getProductByNo(int ProductNo);
}
