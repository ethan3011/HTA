package com.sample.app;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sample.service.ProductService;
import com.sample.service.UserService;
import com.sample.vo.Product;

public class SpringApp2 {
	
	public static void main(String[] args) {
		// AOP Schema.xml
		ApplicationContext context = new ClassPathXmlApplicationContext("spring/context-aop-schema.xml");
		UserService userService = context.getBean(UserService.class);
		ProductService productService = context.getBean(ProductService.class);
		
		List<Product> products = productService.getAllProducts();
		
		productService.getProductByNo(60);
		
		userService.getUserDetail("gajua");
		
		productService.addProduct(64, 15);
	}
}
