<%@page import="com.sample.vo.Board"%>
<%@page import="com.sample.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	int pageNo = Integer.parseInt(request.getParameter("page"));
	int boardNo = Integer.parseInt(request.getParameter("no"));
	
	BoardDao boardDao = BoardDao.getInstance();
	Board board = boardDao.getBoardByBoardNo(boardNo);
	
	board.setViewCount(board.getViewCount()+1);
	
	boardDao.updateBoard(board);
	
	response.sendRedirect("detail.jsp?no="+boardNo+"&page="+pageNo);
	

%>