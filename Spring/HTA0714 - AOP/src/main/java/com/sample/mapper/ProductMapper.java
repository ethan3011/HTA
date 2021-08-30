package com.sample.mapper;

import java.util.List;

import com.sample.vo.Product;

public interface ProductMapper {
	
	/**
	 * 신규 상품을 전달받아 추가한다
	 * @param product 신규상품
	 */
	void insertNewProduct(Product product);
	
	/**
	 * 변경될 상품 정보를 전달받아 데이터베이스에 반영한다.
	 * @param product 변경될 상품정보
	 */
	void updateProduct(Product product);
	
	/**
	 * 상품의 번호를 받아 삭제한다.
	 * @param productNo 삭제할 상품번호
	 */
	void deleteProduct(int productNo);
	
	/**
	 * 모든 상품의 객체를 배열로 반환한다.
	 * @return 모든상품객체
	 */
	List<Product> getAllProducts();
	
	/**
	 * 상품의 번호와 일치하는 상품을 반환한다.
	 * @param productNo 상품의 번호
	 * @return 상품객체
	 */
	Product getProductByNo(int productNo);
}
