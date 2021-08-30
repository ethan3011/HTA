<%@page import="com.sample.vo.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="com.sample.dao.FileItemDao"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  	<title>서블릿 연습</title>
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

%>	
	<div class="row mt-3">	
		<div class="col-12">
			<h3>공개자료 게시판 <small><a href="files/uploadForm.jsp" class="btn btn-primary btn-sm float-right">업로드</a></small></h3>
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>파일명</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<%
				FileItemDao fileItemDao = FileItemDao.getInstance();
				List<FileItem> items = fileItemDao.getAllItems(); 
				
				if(items.isEmpty()){
				%>
					<tr>
						<td class="text-center" colspan="4">등록된 공개자료가 없습니다.</td>
					</tr>
				<%
				}else{
					for(FileItem item : items){
				%>
					<tr>
						<td><%=item.getNo() %></td>
						<td><%=item.getTitle() %></td>
						<td><%=item.getShortFileName()%></td>
						<td><a href="/sam/down?no=<%=item.getNo() %>" class="btn btn-outline-primary btn-sm">다운로드</a></td>
					</tr>
				<%	
					}
				}
				%>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>