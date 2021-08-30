package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.mapper.ProductMapper;
import com.sample.vo.Product;

@Service
public class ProductService {
	
	@Autowired
	ProductMapper productMapper;
	
	public void addNewProduct(Product product) {
		productMapper.insertNewProduct(product);
	}
	
	public void updateProduct(Product product) {
		productMapper.updateProduct(product);
	}
	
	public void removeProduct(int productNo) {
		productMapper.deleteProduct(productNo);
	}
	
	public List<Product> getAllProducts(){
		return productMapper.getAllProducts();
	}
	
	public Product getProductByNo(int productNo) {
		return productMapper.getProductByNo(productNo);
	}

}
