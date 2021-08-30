<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>HTA 0604~0607</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>

<div class="container">
	<div class="row mt-3 mb-3">
	<div class="border bg-light">
		<div class="col-12">
		<h3>out 태그</h3>
			<p>String 사용하기 : ${text1 }</p>		
			<p>c:out 안 사용하기 : ${text2 }</p>		
			<p>c:out 사용하기 : <c:out value="${text3 }"></c:out></p>
			<h4>지금처럼 c:out 태그를 사용하면 스크립트로 공격하는것을 막을수 있다.</h4>		
		</div>
		</div>
	</div>
	<div class="col-12 mb-3">
		<h3>if 태그</h3>
		<div class="border bg-light">
			<c:if test="${score ge 80 }">
				<p>시험점수가 80점 이상이면 합격입니다.</p>
			</c:if>
		</div>
		<div>
			<c:if test="${score lt 79 }">
				<p>시험점수가 79점 이하이면 불합격 입니다.</p>
			</c:if>		
		</div>
		
		</div>
	<div class="col-12 mb-3">
		<h4>조건식에서 비교연산자 사용해보기</h4>
		<div class="border bg-light">
			<c:if test="${car.km ge 100000 or car.years ge 7 }">
				<p>자동차 유상수리 대상 입니다.
			</c:if>
			<c:if test="${car.km lt 100000 or car.years lt 3 }">
				<p>자동차 무상수리 대상입니다.</p>
			</c:if>
		</div>
	
	</div>
	<div class="col-12 mb-3">
		<h4>조건식에서 empty 연산자 사용해보기</h4>
		<div class="border bg-light">
			<c:if test="${empty scores }">
				<p>scores가 비어있으면 true</p>
			</c:if>
			<c:if test="${not empty scores }">
				<p>scores가 안비어있으면 true</p>
			</c:if>
		</div>
	
	</div>
	<div class="col-12 mb-3">
		<h4>조건식에서 비교 연산자 사용해보기</h4>
		<div class="border bg-light">
			<c:choose>
				<c:when test="${score ge 90 }">
					<p>합격입니다.</p>
				</c:when>
				<c:otherwise>
					<p>불합격 입니다.</p>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="col-12 mb-3">
		<h4>여러 개의 조건을 제시해보기</h4>
			<c:choose>
				<c:when test="${score ge 90 }">
					<p>A</p>
				</c:when>
				<c:when test="${score ge 80 }">
					<p>B</p>
				</c:when>
				<c:when test="${score ge 70 }">
					<p>C</p>
				</c:when>
				<c:when test="${score ge 60 }">
					<p>D</p>
				</c:when>
				<c:when test="${score ge 50 }">
					<p>E</p>
				</c:when>
				<c:otherwise>
					<p>F</p>
				</c:otherwise>
			</c:choose>	
	</div>
		
	<div class="col-12 mb-3">
		<h3>forEach 태그</h3>
		<h4>chicken객체가 여러 개 저장된 List객체의 값 표현</h4>
		<table class="table">
			<thead>
				<tr>
					<th>순서</th>
					<th>치킨명</th>
					<th>가격</th>
					<th>판매날짜</th>
					<th>브랜드</th>
					<th>배달비</th>
					<th>수량</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty chickens }">
						<tr>
							<td colspan="6">현재 상품이 존재하지 않습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="chicken" items="${chickens }" varStatus="loop">
							<tr>
								<td>${loop.count }</td>
								<td>${chicken.name}</td>
								<td>${chicken.price }</td>
								<td>${chicken.date }</td>
								<td>${chicken.brand }</td>
								<td>${chicken.deliveryFee }</td>
								<td>${chicken.stock }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		

	</div>
	
	<div class="col-12 mb-3">
		<h4>varStatus로 현재 반복상태 출력하기</h4>
			<table class="table">
				<thead>
					<tr>
						<th>index</th>
						<th>count</th>
						<th>first</th>
						<th>last</th>
						<th>제품명</th>
					</tr>
				</thead>
				<tbody>
						<c:forEach var="chicken" items="${chickens }" varStatus="loop">
					<tr>
							<td>${loop.index }</td>
							<td>${loop.count }</td>
							<td>${loop.first }</td>
							<td>${loop.last }</td>
							<td>${chicken.name }</td>
					</tr>
						</c:forEach>
				</tbody>
			</table>		
	</div>
	
	<div class="col-12 mb-3">
		<h4>forEach태그 안에서 if태그를 사용하기</h4>
			<table class="table">
				<thead>
					<tr>
						<th>이름</th>
						<th>가격</th>
						<th>날짜</th>
						<th>브랜드</th>
						<th>배달비</th>
						<th>재고</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="chicken" items="${chickens }">
						<c:if test="${chicken.price ne 17000 and chicken.price ne 18000}">
							<tr>
								<td>${chicken.name }</td>
								<td>${chicken.price }</td>
								<td>${chicken.date }</td>
								<td>${chicken.brand }</td>
								<td>${chicken.deliveryFee }</td>
								<td>${chicken.stock }</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
	</div>
	
	<div class="col-12 mb-3">
		<h4>forEach의 var, begin, end로 페이징처리의 페이지번호 출력 </h4>
			<ul class="pagination">
				<c:forEach var="num" begin="1" end="10">
					<li class="page-item ${param.page eq num ? 'active' : ''}"><a href="core2?page=${num }" class="page-link">${num }</a></li>	
				</c:forEach>
			</ul>

	</div>
	
	<div class="col-12 mb-3">
		<h3>set태그와 remove태그 사용해보기</h3>
			<p><c:set var="gamja" value="감짜맨" /></p>
			<p><c:out value="${gamja }"></c:out></p>
			
			<p><c:set var="gamja" value="피짜맨" /></p>
			<p><c:out value="${gamja }"></c:out></p>
			
			<p><c:remove var="gamja"/></p>
			<div class="border bg-light"><c:out value="${gamja }"></c:out></div>
	</div>
	
	<div class="col-12 mb-3">
		<h4>set태그를 이용해서 최고점수와 최저점수 출력하기</h4>
		<c:set var="min" value="20000" />
		<c:set var="max" value="0" />
			<c:forEach var="chicken" items="${chickens }">
				<c:if test="${chicken.price ge max }">
					<c:set var="max" value="${chicken.price }"/>
				</c:if>
			</c:forEach>
			<c:forEach var="chicken" items="${chickens }">
				<c:if test="${chicken.price le min }">
					<c:set var="min" value="${chicken.price }"></c:set>
				</c:if>
			</c:forEach>
				<p>chicken.price들 중 max 값  :${max } 원</p>
				<p>chicken.price들 중 min 값 : ${min } 원</p>
	</div>
	
	<div class="col-12 mb-3">
		<h4>set태그를 이용해서 pageContext, HttpServletRequest, HttpSession, ServeltContext에 
		속성으로 저장된 객체의 property 값을 변경하기</h4>
		<h3> 변경전 </h3>
			<p>이름 : ${ mang.name}</p>
			<p>가격 : ${ mang.price}</p>
			<p>날짜 : ${ mang.date}</p>
			<p>브랜드 : ${ mang.brand}</p>
			<p>배달비 : ${ mang.deliveryFee}</p>
			<p>재고 : ${ mang.stock}</p>
			
			<c:set target="${mang }" property="name" value="잘리비핫치킨" />
			<c:set target="${mang }" property="price" value="5000" />
			<c:set target="${mang }" property="brand" value="잘리비" />
			<c:set target="${mang }" property="deliveryFee" value="500" />
			<c:set target="${mang }" property="stock" value="3000" />	
			
		<h3> 변경후 </h3>
			<p>이름 : ${ mang.name}</p>
			<p>가격 : ${ mang.price}</p>
			<p>날짜 : ${ mang.date}</p>
			<p>브랜드 : ${ mang.brand}</p>
			<p>배달비 : ${ mang.deliveryFee}</p>
			<p>재고 : ${ mang.stock}</p>
	</div>
	
	<div class="col-12 mb-3">
		<h4>URL태그</h4>
		<c:url var="thisIsLink" value="/sample-mybatis/index.jsp">
			<c:param name="no" value="10" />
			<c:param name="name" value="kim" />
			<c:param name="phone" value="01012345678" />
			<c:param name="email" value="aff@naver.com" />
		</c:url>
		
		<a href="${thisIsLink }" >링크</a>
	</div>
</div>
</body>
</html>