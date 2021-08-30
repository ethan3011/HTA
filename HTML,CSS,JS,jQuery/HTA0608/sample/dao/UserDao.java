package com.sample.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sample.util.MyBatisUtils;
import com.sample.vo.Todo;
import com.sample.vo.User;

public class UserDao {
	
	private static SqlSessionFactory sqlSessionFactory;
	
	private static UserDao instance = new UserDao();
	
	private UserDao() {
		this.sqlSessionFactory = MyBatisUtils.getSqlSessionFactory();
	}
	
	public static UserDao getInstance() {
		return instance;
	}
	
	public User getUserById(String userId) {
		SqlSession session = sqlSessionFactory.openSession();
		User user = session.selectOne("getUserById", userId);
		session.close();
		return user;
	}
}
