package com.sample.web.todo;

import java.io.IOException;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.ibatis.session.SqlSession;

import com.sample.dao.UserDao;
import com.sample.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

@WebServlet("/todo/login")
public class TodoLoginServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/todo/loginform.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("userid");
		String password = req.getParameter("password");
		
		UserDao userDao = UserDao.getInstance();
		User savedUser = userDao.getUserById(id);
		
		if(savedUser == null) {
			resp.sendRedirect("/HTA0608/todo/login?fail=invalid");
			return;
		}
		
		if(!savedUser.getStatus().equals("active")) {
			resp.sendRedirect("/HTA0608/todo/login?fail=invalid");
			return;
		}
		
		String shaPWD = DigestUtils.sha256Hex(password);
		if(!savedUser.getPassword().equals(shaPWD)) {
			resp.sendRedirect("/HTA0608/todo/login?fail=invalid");
			return;
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("LOGIN_USER", savedUser);
		
		resp.sendRedirect("/HTA0608/todo/list");
	}

}
