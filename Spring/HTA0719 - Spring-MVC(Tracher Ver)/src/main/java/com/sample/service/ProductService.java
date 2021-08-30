package com.sample.service;

import java.util.List;

import com.sample.vo.Product;

/**
 * 상품과 관련된 업무로직 메소드가 정의딘 인터페이스다.
 * 여기에 정의된 모든 기능은 ProductServiceImpl에서 구현한다.
 * @author lee_e
 *
 */
public interface ProductService {
	/**
	 * 판매중인 모든 상품정보를 제공하는 서비스
	 * @return 모든상품정보
	 */
	List<Product> getAllProducts();

}
