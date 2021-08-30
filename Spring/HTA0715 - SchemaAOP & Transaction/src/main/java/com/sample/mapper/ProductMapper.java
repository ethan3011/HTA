package com.sample.mapper;import java.util.List;

import com.sample.vo.Product;

public interface ProductMapper {
	
	/**
	 * 새로운 상품정보를 받아서 데이터베이스에 추가한다.
	 * @param product 새로운 상품정보
	 */
	void InsertNewProduct(Product product);
	
	/**
	 * 변경될 상품정보를 받아서 반환한다.
	 * @param product 변경될 상품정보
	 */
	void updateProduct(Product product);
	
	/**
	 * 삭제할 상품번호를 전달받아서 삭제한다.
	 * @param productNo 상품번호
	 */
	void deleteProduct(int productNo);
	
	/**
	 * 모든 상품정보를 반환한다.
	 * @return 모든상품정보
	 */
	List<Product> getAllProducts();
	
	/**
	 * 상품번호를 전달받아서 일치하는 상품을 반환한다.
	 * @param ProductNo 상품번호
	 * @return 상품정보
	 */
	Product getProductByNo(int ProductNo);

}
