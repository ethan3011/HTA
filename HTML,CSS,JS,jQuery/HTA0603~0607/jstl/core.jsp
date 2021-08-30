<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%--
	JSTL 태그 라이브러리 중 core 태그 라이브러리를 JSP에 포함시키기
 --%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <title>Bootstrap 4 Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-12 mb-3">
			<h3>out 태그</h3>
			
			<div><strong>EL 표현식으로 출력</strong> : ${text1 }</div>
			<div><strong>out태그로 출력 : </strong><c:out value="${text1 }"></c:out></div>
			<div>EL 표현식으로 출력 : ${text2 }</div>
			<div>out태그로 출력 : <c:out value="${text2 }" escapeXml="true"></c:out></div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<!-- 
				else 태그는 존재하지 않음 
				그러므로 부정문의 경우에는 다시 if문을 적어놔야함
			 -->
			<h3>if 태그</h3>
			
			<h4>조건식에서 비교연산자 사용해보기</h4>
			<c:if test="${score >= 60 }">
				<p>점수가 60점 이상이면 합격입니다.</p>
			</c:if>
			<c:if test="${score < 60 }">
				<p>점수가 60점 미만이면 불합격 입니다.</p>
			</c:if>
			
			<c:if test="${score ge 60 }">
				<p>점수가 60점 이상이면 합격입니다.</p>
			</c:if>
			<c:if test="${score lt 60 }">
				<p>점수가 60점 미만이면 불합격 입니다</p>
			</c:if>
			
			<h4>조건식에서 empty 연산자 사용해보기</h4>
			<c:if test="${not empty names }">
				<p>names로 찾은 ArrayList는 비어 있지 않다.</p>
			</c:if>
			<c:if test="${empty names }">
				<p>names로 찾은 ArrayList는 비어 있다.</p>
			</c:if>
			
			<h4>조건식에서 비교연산자, 논리연산자 사용해보기</h4>
			<c:if test="${car.year ge 5 or car.distance ge 100000}">
			<p>유상처리 대상 차량입니다.</p>
			</c:if>
			<c:if test="${car.year lt 5 and car.distance lt 100000 }">
				<p>무상처리 대상입니다</p>
			</c:if>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<h3>choose, when, otherwise 태그 사용해보기</h3>
			
			<h4>조건식에서 비교 연산자 사용해보기</h4>
			<c:choose>
				<c:when test="${score ge 60 }">
					<p>합격하였습니다.</p>
				</c:when>
				<c:otherwise>
					<p>불합격하였습니다.</p>
				</c:otherwise>
			</c:choose>
			
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
				<c:otherwise>
					<p>F</p>
				</c:otherwise>
			</c:choose>
			
			<h4>논리연산자 사용해보기</h4>
			<c:choose>
				<c:when test="${car.year ge 5 and car.distance ge 100000}">
					<p>유상처리 대상 차량입니다</p>
				</c:when>
				<c:otherwise>
					<p>무상처리 대상 차량입니다.</p>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	
	<div class="row">
		<div class="col-6">
			<h3>forEach 태그</h3>
			
			<h4>String이 여러 개 저장된 List객체의 값 표현</h4>
			<ul>
				<c:forEach var="name" items="${members }">
					<li>${name }</li>
				</c:forEach>
			</ul>
			
			<h4>varStatus로 현재 반복상태 출력하기</h4>
			<table class="table">
				<thead>
					<tr>
						<th>index</th>
						<th>count</th>
						<th>first</th>
						<th>last</th>
						<th>값출력</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="name" items="${members }" varStatus="loop">
						<tr>
							<td>${loop.index }</td>
							<td>${loop.count }</td>
							<td>${loop.first }</td>
							<td>${loop.last }</td>
							<td>${name }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-6">
			<h4>Score객체가 여러 개 저장된 List객체의 값 표현</h4>
			<table class="table">
				<thead>
					<tr>
						<th>순번</th>
						<th>이름</th>
						<th>국어</th>
						<th>영어</th>
						<th>수학</th>
						<th>총점</th>
						<th>평균</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty score }">
							<tr>
								<td colspan="7" class="text-center">등록된 데이터가 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="score" items="${scores }" varStatus="loop">
								<tr>
									<td>${loop.count }</td>
									<td>${score.firstName } ${score.lastName }</td>
									<td>${score.kor }</td>
									<td>${score.eng }</td>
									<td>${score.math }</td>
									<td>${score.total }</td>
									<td>${score.average }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			
			<h4>forEach태그 안에서 if태그를 사용하기</h4>
			<table class="table">
				<thead>
					<tr>
						<th>이름</th>
						<th>극어</th>
						<th>영어</th>
						<th>수학</th>
						<th>총점</th>
						<th>평균</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="score" items="${scores }">
						<c:if test="${score.average le 60 }">
							<tr>
								<td>${score.firstName } ${score.lastName }</td>
								<td>${score.kor }</td>
								<td>${score.eng }</td>
								<td>${score.math }</td>
								<td>${score.total }</td>
								<td>${score.average }</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			<h4>forEach의 var, begin, end로 페이징처리의 페이지번호 출력 </h4>
			<ul class="pagination">
				<c:forEach var="num" begin="1" end="10">
					<li class="page-item ${param.page eq num ? 'active' : '' }"><a href="core?page=${num }" class="page-link">${num }</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<h3>set태그와 remove태그 사용해보기</h3>
			
			<h4>set태그를 이용해서 최고점수와 최저점수 출력하기</h4>
			<c:set var="min" value="300" />
			<c:set var="max" value="0" />
			<c:forEach var="score" items="${scores}">
				<c:if test="${score.total gt max }">
					<c:set var="max" value="${score.total }" />
				</c:if>
				<c:if test="${score.total lt min }">
					<c:set var="min" value="${score.total }" />
				</c:if>
				
			</c:forEach>
			<p>최고점수 : ${max }</p>
			<p>최저점수 : ${min }</p>
			
			<h4>set태그를 이용해서 pageContext, HttpServletRequest, HttpSession, ServeltContext에 
			속성으로 저장된 객체의 property 값을 변경하기</h4>
			<h5>변경전 값 출력하기</h5>
			<p>${king.firstName } ${king.lastName } ${king.kor } ${king.eng } ${king.math }</p>
			
			<c:set target="${king }" property="kor" value="90" />
			<c:set target="${king }" property="eng" value="95" />
			<c:set target="${king }" property="math" value="99" />
			
			<h5>변경 후 값 출력하기</h5>
			<p>${king.firstName } ${king.lastName } ${king.kor } ${king.eng } ${king.math }</p>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-6">
			<h3>url 태그</h3>
			
			<c:url var="bookDetailLink" value="book/detail">
				<c:param name="no" value="100"></c:param>
				<c:param name="page" value="3"></c:param>
				<c:param name="category" value="소설"></c:param>
				<c:param name="subCategory" value="외국소설"></c:param>
			</c:url>
			
			<p>링크 : <a href="${bookDetailLink }">상세보기</a></p>
		</div>
	</div>
</div>

</body>
</html>