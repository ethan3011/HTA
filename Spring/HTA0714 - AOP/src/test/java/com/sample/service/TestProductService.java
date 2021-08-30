package com.sample.service;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sample.vo.Product;

/*
 * @RunWith
 * 		- @RunWith에 Runner클래스를 설정하면 JUnit에 내장된 Runner 대신 그 클래스를 실행한다.
 * 		    스프링 테스트를 위하여 SpringJUnit4ClassRunner.class를 ()에 넣어주었다. 
 * 		    이것으로 한 클래스 내의 여러개의 테스트가 있더라도 applicationContext를 한번만 로딩하여 사용하기 때문에
 * 		    여러개의 테스트가 있더라도 느려지지 않고 처음만 조금 느려지게 된다.
 */
@RunWith(SpringJUnit4ClassRunner.class)
/*
 * @ContextConfiguration
 * 		- 스프링의 빈 설정 파일 경로를 () 안에 지정할때 사용된다.
 */
@ContextConfiguration(locations = "classpath:/spring/context-mybatis.xml")
public class TestProductService {
	@Autowired
	ProductService productService;
	
	@Test
	public void configTest() {
		Assert.assertNotNull(productService);
	}
	
	@Test
	public void getAllProducts() {
		List<Product> products = productService.getAllProducts();
		Assert.assertEquals(20, products.size());
	}
	
	
}
