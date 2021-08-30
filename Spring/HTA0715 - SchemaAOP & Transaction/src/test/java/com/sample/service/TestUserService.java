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
	
	@Value("${user.default.point}")
	int defaultPoint;
	
	@Autowired
	UserService userService;
	
	User user;
	User userForId;
	User userForPhone;
	User userForEmail;
	
	@Test
	@Ignore
	public void TestConfig() {
		System.out.println(userService);
	}
	
	@Before
	public void before() {
		
		user = User.builder().id("backdusan1").password("zxcv1234").name("백두산").phone("백두백두1").email("백두산1@gmail.com").build();
		userForId = User.builder().id("backdusan1").password("zxcv1234").name("백두산").phone("백두백두2").email("백두산2@gmail.com").build();
		userForPhone = User.builder().id("backdusan2").password("zxcv1234").name("백두산").phone("백두백두1").email("백두산3@gmail.com").build();
		userForEmail = User.builder().id("backdusan3").password("zxcv1234").name("백두산").phone("백두백두3").email("백두산1@gmail.com").build();
	}
	
	@After
	public void after() {
		userService.DeleteUser(user.getId());
		userService.DeleteUser(userForId.getId());
		userService.DeleteUser(userForPhone.getId());
		userService.DeleteUser(userForEmail.getId());
	}
	
	
	@Test
	public void TestExistUser() {
		userService.addnewUser(user);
		user = userService.getUserDetail(user.getId());
		
		Assert.assertEquals("backdusan1",user.getId());
		Assert.assertEquals(defaultPoint,user.getPoint());
	}
	
	@Test(expected = MallBusinessException.class)
	public void TestExsistIdException() {
		userService.addnewUser(userForId);
		userService.addnewUser(userForId);
	}
	@Test(expected = MallBusinessException.class)
	public void TestExsistPhoneException() {
		userService.addnewUser(userForPhone);
		userService.addnewUser(userForPhone);
	}
	@Test(expected = MallBusinessException.class)
	public void TestExsistEmailException() {
		userService.addnewUser(userForEmail);
		userService.addnewUser(userForEmail);
	}
}
