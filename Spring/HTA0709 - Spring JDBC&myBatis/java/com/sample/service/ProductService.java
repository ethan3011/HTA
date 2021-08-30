package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.mapper.ProductMapper;
import com.sample.vo.Product;

@Service
public class ProductService {
	
	@Autowired
	private ProductMapper productMapper;
	public void setProductMapper(ProductMapper productMapper) {
		this.productMapper = productMapper;
	}
	
	public void insertProduct(Product product) {
		productMapper.insertProduct(product);
	}
	
	public void updateProduct(Product product) {
		productMapper.updateProduct(product);
	}
		
	public List<Product> getAllProducts(){
		return productMapper.getAllProducts();
	}
	
	public Product getProductByNo(int productNo) {
		return productMapper.getProductByNo(productNo);
	}

}
