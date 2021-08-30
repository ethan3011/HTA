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
	
	@Value("${RegisterEventPoint}")
	int DefaultPoint;
	
	@Autowired
	UserService userService;
	
	User user;
	User userForid;
	User userForPhone;
	User userForEmail;
	
	@Test
	@Ignore
	public void getConfig() {
		Assert.assertNotNull(userService);
	}
	
	@Before
	public void before() {
		user 		 = User.builder()
						   .id("kimdongmu1")
						   .password("zxcv1234")
						   .name("김동무")
						   .phone("010-1234-1234")
						   .email("kimdongmu1@gmail.com")
						   .build();
		userForid	 = User.builder()
						   .id("kimdongmu1")
						   .password("zxcv1234")
						   .name("김동무")
						   .phone("010-2345-2345")
						   .email("kimdongmu2@gmail.com")
						   .build();
		userForPhone = User.builder()
						   .id("kimdongmu2")
						   .password("zxcv1234")
						   .name("김동무")
						   .phone("010-1234-1234")
						   .email("kimdongmu3@gmail.com")
						   .build();
		userForEmail = User.builder()
						   .id("kimdongmu3")
						   .password("zxcv1234")
						   .name("김동무")
						   .phone("010-3456-3456")
						   .email("kimdongmu1@gmail.com")
						   .build();
	}
	
	@After
	public void after() {
		userService.removeUser(user.getId());
		userService.removeUser(userForid.getId());
		userService.removeUser(userForPhone.getId());
		userService.removeUser(userForEmail.getId());
	}
	
	
	@Test
	public void testAddUser() {
		
		userService.AddNewUser(user);
		
		User savedUser = userService.getUserById(user.getId());
		Assert.assertEquals("kimdongmu1",savedUser.getId());
		Assert.assertEquals(DefaultPoint, savedUser.getPoint());
	}
	
	@Test(expected = MallBusinessException.class)
	public void testExistId() {
		userService.AddNewUser(user);
		userService.AddNewUser(user);
	}
	@Test(expected = MallBusinessException.class)
	public void testExist() {
		userService.AddNewUser(userForid);
		userService.AddNewUser(userForid);
	}
	@Test(expected = MallBusinessException.class)
	public void testExistEmail() {
		userService.AddNewUser(userForEmail);
		userService.AddNewUser(userForEmail);
	}

}
