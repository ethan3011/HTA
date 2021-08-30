<%@page import="com.sample.util.CommonUtils"%>
<%@page import="com.sample.dao.CartItemDao"%>
<%@page import="com.sample.dto.CartItemListDto"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>상품몰</title>
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
	String navItem = "cart";
%>
	<header>
		<%@ include file="../common/header.jsp" %>
	</header>
	<%
		if(loginedUser == null){
			String encodedText = URLEncoder.encode("장바구니목록", "utf-8");
			response.sendRedirect("../user/loginform.jsp?fail=deny&job="+encodedText);
			return;
		}
		// 세션에서 저장된 로그인 사용자 정보 조회
		String userId = loginedUser.getId();
		
		// SAMPLE_ITEMS와 SAMPLE_CART_ITEMS 테이블에 대한 CRUD 기능을 제공하는 객체 생성
		CartItemDao cartItemDao = CartItemDao.getInstance();
		// 로그인한 사용자의 장바구니 정보 조회하기
		List<CartItemListDto> items = cartItemDao.getCartItemByUserId(userId);
	
	%>
	<main>		
	<div class="row mb-3">
			<div class="col-12">
				<div class="border p-3 bg-light"><%=loginedUser.getName() %><small>님 장바구니 목록</small></div>
			</div>
		</div>
	
	<%
		String fail = request.getParameter("fail");
		if("deny".equals(fail)) {
	%>		
	<div class="row mb-3">
		<div class="col-12">
			<div class="alert alert-danger">
				<strong>삭제 거부</strong> 자신이 등록한 아이템만 삭제할 수 있습니다.
			</div>
		</div>
	</div>
	<%		
		}else if("invalid".equals(fail)) {
	%>	
		<div class="row mb-3">
			<div class="col-12">
			<div class="alert alert-danger">
				<strong>아이템 없음</strong> 유효한 아이템번호가 아닙니다.
			</div>
			</div>
		</div>
	<%		
		}
	%>
		<div class="row mb-3">
			<div class="col-12">
				<div class="card">
				<form method="get" action="../order/insert.jsp">
					<div class="card-body pb-0">
						<table class="table">
							<thead>
								<tr>
									<th>선택</th>
									<th>번호</th>
									<th>상품명</th>
									<th>제조사</th>
									<th class="text-right">가격</th>
									<th class="text-right">할인가격</th>
									<th class="text-center">수량</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							<%
								if(items.isEmpty()){
							%>
								<tr>
									<td colspan="8" class="text-center">장바구니에 등록된 상품이 없습니다.</td>
								</tr>
							<%
								}else{
									for(CartItemListDto item : items){
							%>										
									<tr>
										<td><input type="checkbox" name="itemNo" value="<%=item.getNo() %>" /></td>
										<td><%=item.getNo() %></td>
										<td><%=item.getProductName() %></td>
										<td><%=item.getMaker() %></td>
										<td class="text-right"><%=CommonUtils.numberToString(item.getPrice())%> 원</td>
										<td class="text-right"><span class="text-danger"><%=CommonUtils.numberToString(item.getDiscountPrice())%></span> 원</td>
										<td class="text-center"><%=item.getAmount() %> 개</td>
										<td><a href="delete.jsp?no=<%=item.getNo() %>" class="btn btn-danger btn-sm ">삭제</a></td>
									</tr>
							<%
									}
								}
							 %>
							</tbody>
						</table>
						<div class="mb-2">
							<button type="submit" class="btn btn-outline-primary btn-sm">선택한 상품 주문</button>
							<button type="submit" class="btn btn-outline-primary btn-sm">전체 주문</button>
						</div>
					</div>
				</form>
				</div>
			</div>		
		</div>
	</main>
	</div>
</body>
</html>