package com.sample.app;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sample.service.ProductService;
import com.sample.vo.Product;

public class SpringApp {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("spring/context-mybatis.xml");
		
		ProductService service = context.getBean(ProductService.class);
		
		List<Product> products =  service.getAllProducts();
		
		for(Product item : products) {
			System.out.println(item.getNo() + ", " + item.getName() + ", " + item.getPrice());
		}
		
		Product findProduct = service.getProductByNo(64);
		
		System.out.println(findProduct.getNo());
		System.out.println(findProduct.getName());
		System.out.println(findProduct.getMaker());
		System.out.println(findProduct.getCategory());
		System.out.println(findProduct.getPrice());
		System.out.println(findProduct.getDiscountPrice());
		System.out.println(findProduct.getStock());
		System.out.println(findProduct.getSoldOut());
		System.out.println(findProduct.getCreatedDate());
		System.out.println(findProduct.getReviewCnt());
		
		
		Product item = new Product();
		item.setName("김치맨");
		item.setMaker("엄마손김치");
		item.setCategory("김치");
		item.setPrice(20000);
		item.setDiscountPrice(15000);
		item.setStock(150);

		service.insertProduct(item);
		System.out.println(item.getName() + " 아이템이 추가되었습니다.");
		
		findProduct.setName("피자맨");
		findProduct.setMaker("파파존스피자");
		findProduct.setCategory("피자");
		findProduct.setPrice(25000);
		findProduct.setDiscountPrice(18000);
		findProduct.setStock(200);
		
		service.updateProduct(findProduct);
		System.out.println(findProduct.getName() + " 아이템이 변경되었습니다.");
		
		System.out.println(findProduct.getNo());
		System.out.println(findProduct.getName());
		System.out.println(findProduct.getMaker());
		System.out.println(findProduct.getCategory());
		System.out.println(findProduct.getPrice());
		System.out.println(findProduct.getDiscountPrice());
		System.out.println(findProduct.getStock());
		System.out.println(findProduct.getSoldOut());
		System.out.println(findProduct.getCreatedDate());
		System.out.println(findProduct.getReviewCnt());
	}
}
