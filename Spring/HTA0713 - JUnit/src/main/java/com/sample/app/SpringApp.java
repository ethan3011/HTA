package com.sample.app;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sample.mapper.ProductMapper;
import com.sample.mapper.UserMapper;
import com.sample.service.ProductService;
import com.sample.service.UserService;
import com.sample.vo.Product;
import com.sample.vo.User;

public class SpringApp {

	public static void main(String[] args) {
		
		ApplicationContext context = new ClassPathXmlApplicationContext("spring/context-mybatis.xml");
		ProductService productSerivce = context.getBean(ProductService.class);
		UserService userService = context.getBean(UserService.class);
		
		

//		List<Product> products = productSerivce.getAllProducts();
//		for(Product product : products) {
//			System.out.println(product.getNo());
//			System.out.println(product.getName());
//			System.out.println(product.getMaker());
//			System.out.println(product.getCategory());
//			System.out.println(product.getPrice());
//			System.out.println(product.getDiscountPrice());
//			System.out.println(product.getStock());
//			System.out.println(product.getCreatedDate());
//			System.out.println("#############################");
//		}
		User user = new User();
		user.setId("hohoy");
		user.setName("호호이");
		user.setPassword("zxcv1234");
		user.setEmail("hohoy@gmail.com");
		user.setPhone("010-3333-3333");
		
		userService.addNewUser(user);
		System.out.println("성공적으로 추가되었습니다.");
	}
}
