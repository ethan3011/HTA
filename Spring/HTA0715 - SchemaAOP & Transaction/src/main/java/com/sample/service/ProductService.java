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
	
	public void addNewProduct(Product product) {
		productMapper.InsertNewProduct(product);
	}
	
	public void updateProduct(Product product) {
		productMapper.updateProduct(product);
	}
	
	public void deleteProduct(int productNo) {
		productMapper.deleteProduct(productNo);
	}
	
	public List<Product> getAllProducts(){
		return productMapper.getAllProducts();
	}
	
	public Product getProductByNo(int productNo) {
		return productMapper.getProductByNo(productNo);
	}
	
	public void addProduct(int productNo, int stock) {
		Product product = productMapper.getProductByNo(productNo);
		product.setNo(product.getNo() + stock);
		productMapper.updateProduct(product);
	}
}
