package com.sample.app;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sample.service.ProductService;
import com.sample.service.UserService;
import com.sample.vo.Product;
import com.sample.vo.User;

public class SpringApp {
	
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("spring/context-mybatis.xml");
		ProductService productService = context.getBean(ProductService.class);
		UserService userService = context.getBean(UserService.class);
		
		userService.getUserById("214124");
		
		productService.getAllProducts();
		
		productService.getProductByNo(60);
		
	}
}
