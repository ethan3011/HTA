<%@ page pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-primary navbar-dark my-3">
	<a class="navbar-brand" href="/review-mybatis/index.jsp">HTA 몰</a>
  	<ul class="navbar-nav  mr-auto">
    	<li class="nav-item <%="home".equals(navItem) ? "active" : "" %>"><a class="nav-link" href="/review-mybatis/index.jsp">홈</a></li>
    	<li class="nav-item <%="product".equals(navItem) ? "active" : ""%>"><a class="nav-link" href="/review-mybatis/product/list.jsp">상품목록</a></li>
    	<li class="nav-item"><a class="nav-link" href="#">Link 3</a></li>
  	</ul>
  	<ul class="navbar-nav">
  		<!-- 로그인되지 않은 경우 로그인/회원가입이 표시된다. -->
    	<li class="nav-item "><a class="nav-link" href="/review-mybatis/user/loginform.jsp">로그인</a></li>
    	<li class="nav-item "><a class="nav-link" href="/review-mybatis/user/registerform.jsp">회원가입</a></li>
    	<!-- 로그인된 경우 사용자이름/로그아웃이 표시된다. -->
    	<li class="nav-item "><a class="nav-link" href="/review-mybatis/user/detail.jsp">홍길동</a></li>
    	<li class="nav-item"><a class="nav-link" href="/review-mybatis/user/logout.jsp">로그아웃</a></li>
  	</ul>
</nav>
