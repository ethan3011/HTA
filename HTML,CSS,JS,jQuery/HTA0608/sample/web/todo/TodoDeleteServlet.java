package com.sample.web.todo;

import java.io.IOException;
import java.util.Date;

import com.sample.dao.TodoDao;
import com.sample.vo.Todo;
import com.sample.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/todo/del")
public class TodoDeleteServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User loginedUser = (User)session.getAttribute("LOGIN_USER");
		if(loginedUser == null) {
			response.sendRedirect("/HTA0608/todo/login?fail=deny");
			return;
		}
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		TodoDao todoDao = TodoDao.getInstance();
		Todo todo = todoDao.getTodoByNo(no);
		
		todo.setDeletedDate(new Date());
		todo.setStatus("삭제");
		
		todoDao.updateTodo(todo);
		
		response.sendRedirect("/HTA0608/todo/list");
	}
}
