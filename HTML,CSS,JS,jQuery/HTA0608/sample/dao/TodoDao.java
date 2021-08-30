package com.sample.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sample.util.MyBatisUtils;
import com.sample.vo.Todo;

public class TodoDao {
	
	private SqlSessionFactory sqlSessionFactory;
		
	private static TodoDao instance = new TodoDao();
		
	private TodoDao() {
		this.sqlSessionFactory = MyBatisUtils.getSqlSessionFactory();
	}
	
	public static TodoDao getInstance () {
		return instance;
	}

	public List<Todo> getLast5Todos(){
		SqlSession session = sqlSessionFactory.openSession();
		List<Todo> todos = session.selectList("todos.getLast5Todos");
		session.close();
		return todos;
	}
	
	public List<Todo> getTodosByUserId(String userId) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Todo> todos = session.selectList("getTodosByUserId",userId);
		session.close();
		return todos;
	}
	
	public Todo getTodoByNo(int no) {
		SqlSession session = sqlSessionFactory.openSession();
		Todo todo = session.selectOne("getTodoByNo", no);
		session.close();
		return todo;
	}
	
	public Todo updateTodo(Todo todo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		Todo item = session.selectOne("updateTodo", todo);
		session.close();
		return item;
	}
}

