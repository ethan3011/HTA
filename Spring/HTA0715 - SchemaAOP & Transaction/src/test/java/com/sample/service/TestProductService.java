package com.sample.service;

import java.util.List;

import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sample.vo.Product;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:/spring/context-mybatis.xml")
public class TestProductService {
	
	@Autowired
	ProductService productService;
	
	@Test
	@Ignore
	public void testConfig() {
		Assert.assertNotNull(productService);
	}
	
	@Test
	public void testGetAllProducts() {
		List<Product> products = productService.getAllProducts();
		Assert.assertEquals(20,products.size());
	}
	
	@Test
	public void testAddStock() {
		productService.addProduct(64, 15);
	}
	

}
