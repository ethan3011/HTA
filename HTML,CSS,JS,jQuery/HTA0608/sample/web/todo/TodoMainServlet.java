package com.sample.web.todo;

import java.io.IOException;
import java.util.List;

import com.sample.dao.TodoDao;
import com.sample.vo.Todo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/todo/main")
public class TodoMainServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		TodoDao todoDao = TodoDao.getInstance();
		List<Todo> todos = todoDao.getLast5Todos();
		
		request.setAttribute("todos", todos);
		
		request.getRequestDispatcher("/WEB-INF/views/todo/main.jsp").forward(request, response);
	}
}
