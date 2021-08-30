package com.sample.service;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sample.exception.MallBusinessException;
import com.sample.vo.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:/spring/context-mybatis.xml")
public class TestUserService {
	
	@Value("${regsiter.BonusPoint}")
	int defaultDepositPoint;
	
	@Autowired
	UserService userService;
	
	User user;
	User userForId;
	User userForPhone;
	User userForEmail;
	
	/*
	 * @Before
	 * 		- 각각의 테스트 메소드가 실행되기 전에 실행되는 메소드다.
	 * 		- 테스트 실행 전처리 작업을 수행하기 위해서 사용된다.
	 */
	@Before
	public void setUp() {
		// 빌더 패턴을 이용해서 초기화된 User객체 획득
		 user = User.builder()
					.id("mandu1234")
					.password("zxcv1234")
					.name("김만두")
					.email("mandu123@gmail.com")
					.phone("010-5555-5555")
					.build();
		 userForId = User.builder()
					.id("mandu1234")
					.password("zxcv1234")
					.name("김만두")
					.email("mandu2345@gmail.com")
					.phone("010-6666-6666")
					.build();
		 userForPhone = User.builder()
					.id("mandu2345")
					.password("zxcv1234")
					.name("김만두")
					.email("mandu3456@gmail.com")
					.phone("010-5555-5555")
					.build();
		 userForEmail = User.builder()
					.id("mandu3456")
					.password("zxcv1234")
					.name("김만두")
					.email("mandu123@gmail.com")
					.phone("010-7777-7777")
					.build();
	}
	
	/*
	 * @After
	 * 		- 각각의 테스트 메소드가 실행된 후에 실행되는 메소드다.
	 * 		- 테스트 수행을 위해서 사용했던 리소스 반환하기 위해서 사용된다.
	 * 		- 테스트 수행을 위해서 저장소에 저장했던 값들을 초기화시키기 위해서 사용된다.
	 */
	@After
	public void teardown() {
		// 테스트 수행과정에서 데이터베이스에 저장했던  테스트 사용자 정보를 모두 삭제한다.
		userService.removeUser("mandu1234");
		userService.removeUser("mandu2345");
		userService.removeUser("mandu3456");
	}
	
	
	@Test
	@Ignore
	public void configTest() {
		System.out.println(userService);
	}
	
	
	@Test
	public void testAddNewUser() {
		// 신규 사용자 정보 저장
		userService.addNewUser(user);
		// 새로 저장된 사용자 정보 조회
		User savedUser = userService.getUserDetail(user.getId());
		// 새로 저장된 사용자 정보가 요구사항에 맞게 값이 저장되어있는지 체크
		Assert.assertNotNull(savedUser);
		Assert.assertEquals("mandu1234", savedUser.getId());
		Assert.assertEquals("active",savedUser.getStatus());
		Assert.assertEquals(defaultDepositPoint,savedUser.getPoint());
		
	}
	/*
	 * Test(excepted = exception.class)는 exception에 적은 exception이 발생하면 성공, 아닐경우 오류를 발생한다.
	 */
	@Test(expected = MallBusinessException.class)
	public void testAddNewUserExistId() {
		// 신규 사용자 저장
		userService.addNewUser(user);
		// 동일한 아이디를 가진 신규 사용자 저장
		userService.addNewUser(user);
	}
	@Test(expected = MallBusinessException.class)
	public void testAddNewUserExistPhone() {
		// 신규 사용자 저장
		userService.addNewUser(user);
		// 동일한 연락처를 가진 신규 사용자 저장
		userService.addNewUser(userForPhone);
	}
	
	@Test(expected = MallBusinessException.class)
	public void testAddNewUserExistEmail() {
		// 신규 사용자 저장
		userService.addNewUser(user);
		// 동일한 이메일을 가진 신규 사용자 저장
		userService.addNewUser(userForEmail);
	}
	
	
	
	
	
	
	

}
