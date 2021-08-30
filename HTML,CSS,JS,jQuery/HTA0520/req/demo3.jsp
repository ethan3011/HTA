<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTA0520 Review</title>
</head>
<body>
	<h1>GET 방식으로 요청파라미터 보내기</h1>
	
	<h3>demo3-1.jsp에 요청파라미터값을 전달해 보기</h3>
	<!-- ul,li로 요청 url 끝에 ?를 추가하고 그 뒤에 파라미터값 추가 -->
	<ul>
		<li><a href="demo3-1.jsp?id=홍길동">홍길동</a></li>
		<li><a href="demo3-1.jsp?id=김유신">김유신</a></li>
		<li><a href="demo3-1.jsp?id=강감찬">강감찬</a></li>
		<li><a href="demo3-1.jsp?id=기기길">기기길</a></li>
	</ul>
	
	<h3>demo3-2.jsp에 요청파라미터값을 전달해보기</h3>
	<!-- ul,li로 요청 url 끝에 ?를 추가하고 그 뒤에 여러개의 파라미터값 추가 -->
	<ul>
		<li><a href="demo3-2.jsp?category=book&no=1000">자바의정석</a></li>
		<li><a href="demo3-2.jsp?category=book&no=1004">웹의 정석</a></li>
		<li><a href="demo3-2.jsp?category=computer&no=2021">아이맥</a></li>
		<li><a href="demo3-2.jsp?category=moive&no=3234">분노의질주7</a></li>
		<li><a href="demo3-2.jsp?category=food&no=2224">신라면</a></li>
	</ul>
	
	
	<h3>demo3-3.jsp에 여러개의 요청 파라미터값을 전달하기</h3>
	<!-- form태그 검색옵션(제목,저자,출판사,가격), 검색어, 정렬순서(날짜,가격,평점,리뷰), 목록갯수(10,20,50개씩) -->
	<form action="demo3-3.jsp">
		검색옵션<br />
		<select name="opt">
			<option value="name">제목</option>
			<option value="writer">저자</option>
			<option value="publisher">출판사</option>
			<option value="price">가격</option>
		</select><br />
		
		검색어<br />
		<input type="text" name="keyword" /><br />
		정렬순서<br />
		<input type="radio" name="order" value="date" />날짜
		<input type="radio" name="order" value="price" />가격
		<input type="radio" name="order" value="score" />평점
		<input type="radio" name="order" value="review" />리뷰
		목록갯수<br />
		<select name="count">
			<option value="10">10개씩</option>
			<option value="20">20개씩</option>	
			<option value="50">50개씩</option>
		</select><br />
		<button type="submit">검색</button>
	</form>
	
	<p><a href="main.jsp">메인페이지로 돌아가기</a></p>

</body>
</html>