package com.sample.web.todo;

import java.io.IOException;
import java.util.List;

import com.sample.dao.TodoDao;
import com.sample.dao.UserDao;
import com.sample.vo.Todo;
import com.sample.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/todo/list")
public class TodoListServelt extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User loginedUser = (User)session.getAttribute("LOGIN_USER");
		
		if(loginedUser == null) {
			response.sendRedirect("/HTA0608/todo/login?fail=deny");
			return;
		}
		
		String userId = loginedUser.getUserId();

		TodoDao todoDao = TodoDao.getInstance();
		List<Todo> todos = todoDao.getTodosByUserId(userId);
		
		request.setAttribute("todos", todos);
		
		request.getRequestDispatcher("/WEB-INF/views/todo/todos.jsp").forward(request, response);
		
	}
}
