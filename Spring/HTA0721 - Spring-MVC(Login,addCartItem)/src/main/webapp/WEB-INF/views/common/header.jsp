<%@ page pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="/HTA0721/main">샘플 애플리케이션</a>
    	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link ${name eq 'main' ? 'active' : '' }" aria-current="page" href="/HTA0721/main">홈</a>
				</li>
				<li class="nav-item">
					<a class="nav-link ${name eq 'game' ? 'active' : '' }" href="/HTA0721/game/list">전체상품</a>
				</li>
					<c:if test="${not empty LOGINED_USER }">
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							My Menu
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="/HTA0721/cart/list">장바구니</a></li>
							<li><a class="dropdown-item" href="/HTA0721/order/list">구매내역</a></li>
							<li><a class="dropdown-item" href="/HTA0721/my/reviews">내가 작성한 리뷰</a></li>
							<li><a class="dropdown-item" href="/HTA0721/my/pointhistory">포인트변경 이력</a></li>
							<li><a class="dropdown-item" href="/HTA0721/my/info">내정보 보기</a></li>
						</ul>
					</li>
				</c:if>
			</ul>
	 		<ul class="navbar-nav ms-auto">
		 		<c:choose>
		 			<c:when test="${empty LOGINED_USER }">
						<li class="nav-item">
							<a class="nav-link ${menu eq 'login' ? 'active' : '' }" href="/HTA0721/login">로그인</a>
						</li>
						<li class="nav-item">
							<a class="nav-link ${menu eq 'register' ? 'active' : '' }" href="/HTA0721/register">회원가입</a>
						</li>
					</c:when>
					<c:otherwise>
						<span class="navbar-text"><strong>${LOGINED_USER.name }</strong><small>님 환영합니다.</small></span>
						<ul class="navbar-nav">
							<li class="nav-item">
								<a class="nav-link" href="/HTA0721/logout">로그아웃</a>
							</li>
						</ul>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>
