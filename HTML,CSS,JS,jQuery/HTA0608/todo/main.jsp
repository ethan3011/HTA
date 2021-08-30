<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>스케줄 관리</title>
 	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row mb-3">
		<div class="col-12">
			<h3 class="border p-2 bg-light">최신 일정 </h3>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<div class="border p-2 bg-light">
				<h4>최근 등록된 일정 <a href="/HTA0608/todo/login" class="btn btn-primary btn-sm">로그인</a></h4>
				<table class="table">
					<thead>
						<tr>
							<th>순번</th>
							<th>제목</th>
							<th>작성자</th>
							<th>예정일</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${empty todos }">
							<tr>
								<td colspan="5" class="text-center">현재 등록된 일정이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="todo" items="${todos }" varStatus="loop">
								<tr>
									<td>${loop.count }</td>
									<td>${todo.title }</td>
									<td>${todo.writer }</td>
									<td><fmt:formatDate value="${todo.day }" pattern="yyyy-MM-dd" /></td>
									<td><fmt:formatDate value="${todo.createdDate }" pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>