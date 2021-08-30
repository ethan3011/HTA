<%@page import="java.util.Date"%>
<%@page import="com.sample.vo.Board"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.sample.vo.User"%>
<%@page import="com.sample.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	User sessionSavedUser = (User)session.getAttribute("LOGINED_USER_INFO");

	if(sessionSavedUser == null){
		String encodedText = URLEncoder.encode("게시판글쓰기","utf-8");
		response.sendRedirect("../user/loginform.jsp?fail=deny&job="+encodedText);
		
		return;
	}
	
	int boardNo = Integer.parseInt(request.getParameter("no"));
	int pageNo = Integer.parseInt(request.getParameter("page"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BoardDao boardDao = BoardDao.getInstance();
	Board board = boardDao.getBoardByBoardNo(boardNo);
	
	if(!sessionSavedUser.getId().equals(board.getUserId())){
		response.sendRedirect("modifyform.jsp?");
		return;
	}
	
	board.setTitle(title);
	board.setContent(content);
	board.setUpdatedDate(new Date());
	
	boardDao.updateBoard(board);
	
	response.sendRedirect("detail.jsp?no="+boardNo+"&page="+pageNo);

%>