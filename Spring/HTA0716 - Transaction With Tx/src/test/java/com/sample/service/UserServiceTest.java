package com.sample.service;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.sample.vo.User;


// SpringJUnit4ClassRunner
// 		단위테스트 실행시 spring-test 라이브러리가 지원하는 서비스를 제공받을 수 있도록 한다.
@RunWith(SpringJUnit4ClassRunner.class)

// @ContextConfiguration
// 		지정된 스프링 빈 설정파일을 읽어서 스프링 컨테이너를 생성한다.(객체생성, 의존성 주입 완료)
@ContextConfiguration("classpath:/spring/context-tx-annotation.xml")

//	@Transactional
// 		각각의 테스트 메소드 의 실행이 종료되면 해당 메소드내에서 수행했던 모든 데이터베이스 엑세스 작업을 롤백시킨다.
//		즉, 테이블의 상태를 테스트 이전 상태로 되돌려놓는다.
//		수동으로 값을 원래 상태로 되돌리는 작업없이 반복적으로 테스트를 수행할 수 있게 된다.
@Transactional
public class UserServiceTest {
	
	// @Autowired
	// 		단위테스트 대상이 되는 객체를 스프링컨테이너로부터 주입받을 수 있다.
	@Autowired
	UserService userService;
	// @Value
	// 		단위테스트 수행시 필요한 상수값, properties설정값을 주입받을 수 있다.
	
	@Value("${RegisterBonusPoint}")
	int DefaultPoint;
	
	@Test
	public void testConfig() {
		Assert.assertNotNull(userService);
		Assert.assertEquals(100, DefaultPoint);
	}
	
	@Test
	public void testAddNewUser() {
		User user = User.builder().id("김치는맛있다").password("zxcv1234").phone("010-kimchi-masarap").email("masarapangkimchi@gmail.com").name("김치정복자").build();
		userService.addNewUser(user);
	}
	
	

	
}
