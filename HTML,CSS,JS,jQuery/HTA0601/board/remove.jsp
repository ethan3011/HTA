<%@page import="java.util.Date"%>
<%@page import="com.sample.vo.Board"%>
<%@page import="com.sample.dao.BoardDao"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.sample.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	User sessionSavedUser = (User)session.getAttribute("LOGINED_USER_INFO");

	if(sessionSavedUser == null){
		String encodedText = URLEncoder.encode("게시글삭제","utf-8");
		response.sendRedirect("../user/loginform.jsp?fail=deny&job="+encodedText);
		return;
	}
	
	int pageNo = Integer.parseInt(request.getParameter("page"));
	int boardNo = Integer.parseInt(request.getParameter("no"));
	
	BoardDao boardDao = BoardDao.getInstance();
	Board board = boardDao.getBoardByBoardNo(boardNo);
	
	if(!sessionSavedUser.getId().equals(board.getUserId())){
		String encodedText = URLEncoder.encode("본인외권한","utf-8");
		response.sendRedirect("../user/loginform.jsp?fail=deny&job="+encodedText);
		return;
	}
	
	board.setDeleted("Y");
	board.setDeletedDate(new Date());
	
	boardDao.updateBoard(board);
	
	response.sendRedirect("list.jsp?page="+pageNo);

%>