package com.sample.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sample.util.MybatisUtils;
import com.sample.vo.Product;

public class ProductDao {
	
	private SqlSessionFactory sqlSessionFactory;
	
	private static ProductDao instance = new ProductDao();
	
	private ProductDao(){
		this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory();
	}
	
	public static ProductDao getInstance() {
		return instance; 
	}
	
	public void insertProduct(Product product) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.insert("insertProduct", product);
		session.close();	
	}
	
	public void deleteProduct(int no) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.delete("deleteProduct", no);
		session.close();
	}
	
	public void updateProduct(Product product) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.update("updateProduct", product);
		session.close();
	}
	
	public List<Product> getAllProduct() {
		SqlSession session = sqlSessionFactory.openSession();
		List<Product> products = session.selectList("getAllProducts");
		session.close();
		return  products;
	}
	
	public Product getProductByNo(int no) {
		SqlSession session = sqlSessionFactory.openSession();
		Product product = session.selectOne("getProductByNo");
		session.close();
		return product;
	}
	
	public List<Product> getProductByName(String name){
		SqlSession session = sqlSessionFactory.openSession();
		List<Product> products = session.selectList("getProductByName");
		session.close();
		return products;
	}
}
