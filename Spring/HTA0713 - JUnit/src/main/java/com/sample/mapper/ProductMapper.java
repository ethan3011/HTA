package com.sample.mapper;

import java.util.List;

import com.sample.vo.Product;

public interface ProductMapper {
	
	/**
	 * 신규 상품을 데이터베이스에 추가한다.
	 * @param product 추가할 신규 상품
	 */
	void insertNewProduct(Product product);
	
	/**
	 * 변경될 상품 정보를 받아 데이터베이스에 반영한다.
	 * @param product 변경될 상품
	 */
	void updateProduct(Product product);
	
	/**
	 * 상품 번호를 받아 상품을 삭제한다. 
	 * @param productNo 삭제할 상품번호
	 */
	void deleteProduct(int productNo);
	
	/**
	 * 모든 상품정보를 반환한다.
	 * @return 모든 상품들
	 */
	List<Product> getAllProducts();
	
	/**
	 * 상품번호로 검색된 상품을 반환한다.
	 * @param productNo 상품번호
	 * @return 검색된 상품 객체
	 */
	Product getProdubyByNo(int productNo);

}
