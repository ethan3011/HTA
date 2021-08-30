<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="review.dao.HTA0518ReviewDao"%>
<%@page import="review.vo.HTA0518Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>JSP 연습1</h1>

	<%
	List<String> names = new ArrayList<String>();
			
		names.add("가가가");
		names.add("나나나");
		names.add("다다다");
		names.add("라라라");
		names.add("마마마");
		names.add("바바바");
		names.add("사사사");
		names.add("아아아");
	%>
	
	<h3>사원 리스트</h3>
		<ul>
			<%
			for(String name:names){
			%>
				<li><%=name%></li>
			<%
			}
			%>
		</ul>
 
<h1> JSP 연습2</h1>

<%
HTA0518ReviewDao reviewDao = new HTA0518ReviewDao();
	HTA0518Review review = reviewDao.getReview();
%>

<h3>상품정보</h3>
<table border="1" style="width:90%">
	<tr>
		<th>상품번호</th><td><%=review.getNo() %></td>
		<th>상품명</th><td><%=review.getName() %></td>
	</tr>
	<tr>
		<th>회사명</th><td><%=review.getCompany() %></td>
		<th>가격</th><td><%=review.getPrice() %></td>
	</tr>
	<tr>
		<th>재고</th><td><%=review.getStock() %></td>
		<th>날짜</th><td><%=review.getCreatedDate() %></td>
	</tr>
</table>
</body>
</html>
