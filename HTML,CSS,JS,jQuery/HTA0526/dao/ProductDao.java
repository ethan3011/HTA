package com.sample.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sample.util.MybatisUtils;
import com.sample.vo.Product;

public class ProductDao {
	
	private SqlSessionFactory sqlSessionFactory;
	
	private static ProductDao instance = new ProductDao();
	
	private ProductDao() {
		this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory();
	}
	
	/**
	 * Product 객체를 반환한다.
	 * @return
	 */
	public static ProductDao getInstance() {
		return instance;
	}
	/**
	 * 새 상품정보를 전달받아서 SAMPLE_PROUDCTS 테이블에 저장한다.
	 * @param product 새 상품정보
	 */
	public void insertProduct(Product product) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.insert("insertProduct", product);
		session.close();
	}
	/**
	 * 상품번호에 해당하는 상품정보를 전달받아 SAMPLE_PRODUCTS 테이블에서 삭제한다.
	 * @param no 삭제할 상품번호, 해당 상품번호를 참조하는 자식 레코드가 있으면 예외가 발생한다
	 */
	public void deleteProduct(int no) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.delete("deleteProduct", no);
		session.close();
	}
	/**
	 * 변경할 상품정보를 전달받아 SAMPLE_PRODUCTS에서 해당 상품 정보를 변경한다.
	 * @param product 변경될 상품정보
	 */
	public void updateProduct(Product product) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.update("updateProduct", product);
		session.close();
	}
	
	/**
	 * SAMPLE_PRODUCTS 테이블의 모든 상품정보를 반환한다. 
	 * @return 상품정보가 여러개 포함된 List객체, 절대로 null이 될수 없다.(비어있을뿐, null일수는 없다)
	 */
	public List<Product> getAllProducts() {
		SqlSession session = sqlSessionFactory.openSession();
		List<Product> products = session.selectList("getAllProducts");
		session.close();
		return products;
	} 
	
	/**
	 * 
	 * @param no
	 * @return
	 */
	public Product getProductByNo(int no) {
		SqlSession session = sqlSessionFactory.openSession();
		Product product = session.selectOne("getProductByNo", no);
		session.close();
		return product;
	}
	
	public List<Product> getProductByName(String name) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Product> products = session.selectOne("getProductByName", name);
		session.close();
		return products;
	}
	
}
