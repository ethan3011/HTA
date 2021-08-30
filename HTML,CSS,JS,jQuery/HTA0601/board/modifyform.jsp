<%@page import="com.sample.vo.Board"%>
<%@page import="com.sample.dao.BoardDao"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>상풀물 :: 고객게시판</title>
 	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<%
	String navItem = "board";

	int boardNo = Integer.parseInt(request.getParameter("no"));
	int pageNo = Integer.parseInt(request.getParameter("page"));
	
	BoardDao boardDao = BoardDao.getInstance();
	Board board = boardDao.getBoardByBoardNo(boardNo);
	
%>
	<header>
		<%@ include file="../common/header.jsp" %>
	</header>
	<main>
		<div class="row mb-3"> 
			<div class="col-12">
				<h3 class="border p-3 bg-light">새 게시글 등록폼</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<form method="post" action="modify.jsp" class="border p-3 bg-light">
					<input type="hidden" name="no" value="<%=boardNo%>">
					<input type="hidden" name="page" value="<%=pageNo%>">
					<div class="form-group">
						<label>제목</label>
						<input type="text" class="form-control" name="title" value="<%=board.getTitle()%>"/>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea rows="6" class="form-control" name="content"><%=board.getContent() %></textarea>
					</div>
					<div class="text-right">
						<a href="detail.jsp?no=<%=boardNo %>&page=<%=pageNo %>" class="btn btn-secondary">취소</a>
						<button type="submit" class="btn btn-primary">수정</button>
					</div>
				</form>
			</div>
		</div>
	</main>
</div>
</body>
</html>