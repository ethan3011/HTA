package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.exception.MallBusinessException;
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
		productMapper.insertNewProduct(product);
	}
	
	public void updateProduc(Product product) {
		productMapper.updateProduct(product);
	}
	
	public void deleteProduct(int productNo) {
		productMapper.deleteProduct(productNo);
	}
	
	public List<Product> getAllProducts(){
		return productMapper.getAllProducts();
	}
	
	public Product getProductByNo(int productNo) {
		return productMapper.getProdubyByNo(productNo);
	}
	
	public void addStockToProduct(int productNo, int amount) {
		Product product = productMapper.getProdubyByNo(productNo);
		product.setStock(product.getStock() + amount);
		productMapper.updateProduct(product);
	}
	
	public Product getProductDetail(int productNo) {
		Product product = productMapper.getProdubyByNo(productNo);
		
		if(product == null) {
			throw new MallBusinessException("상품번호가 올바르지 않습니다");
		}
		return product;
	}
}
