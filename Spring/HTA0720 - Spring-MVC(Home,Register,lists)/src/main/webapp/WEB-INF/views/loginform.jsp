<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>샘플 애플리케이션</title>
</head>
<body>
<%@ include file="common/nav.jsp" %>
<div class="container my-3">
	<main>
		<div class="row mb-3">
			<div class="col">
				<div class="row mb-3">
					<div class="col">
						<div class="border p-2 bg-dark text-white fw-bold">로그인</div>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col">
						<div class="border p-2 bg-light">
							<form id="form-register" action="register" novalidate="novalidate">
								<div class="mb-3">
									<label class="form-label">아이디</label>
									<input type="text" class="form-control" id="user-id" name="id" />
								</div>
								<div class="mb-3">
									<label class="form-label">비밀번호</label>
									<input type="password" class="form-control" id="user-password" name="password" />
								</div>
								<div class="mb-3 text-end">
									<button type="submit" class="btn btn-primary">회원가입</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col">
						<div class="card border-secondary">
							<div class="card-header">아이디 비밀번호 찾기</div>
							<div class="card-body">
								<p class="card-text">아이디 찾기</p>	
								<form>
									<div class="row g-3">
  										<div class="col-5">
											<input type="text" class="form-control" name="userName" placeholder="이름을 입력하세요" aria-label="이름">
										</div>
										<div class="col-5">
											<input type="text" class="form-control" name="userEmail" placeholder="이메일을 입력하세요" aria-label="이메일">
										</div>
										<div class="col">
											<button type="submit" class="btn btn-outline-primary">조회</button>
										</div>
									</div>
								</form>
							</div>
							<div class="card-body">
								<p class="card-text">비밀번호 찾기</p>	
								<p class="card-text">입력된 이메일로 새 비밀번호를 발송해드립니다.</p>	
								<form>
									<div class="row g-3">
  										<div class="col-5">
											<input type="text" class="form-control" name="userId" placeholder="이름을 입력하세요" aria-label="아이디">
										</div>
										<div class="col-5">
											<input type="text" class="form-control" name="userEmail" placeholder="이메일을 입력하세요" aria-label="이메일">
										</div>
										<div class="col">
											<button type="submit" class="btn btn-outline-primary">조회</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="row mb-1">
					<div class="col">
						<img src="resources/images/banners/item.png" class="img-thumbnail">
					</div>
				</div>
				<div class="row mb-1">
					<div class="col">
						<img src="resources/images/banners/item.png" class="img-thumbnail">
					</div>
				</div>
				<div class="row mb-1">
					<div class="col">
						<img src="resources/images/banners/item.png" class="img-thumbnail">
					</div>
				</div>
				<div class="row mb-1">
					<div class="col">
						<img src="resources/images/banners/item.png" class="img-thumbnail">
					</div>
				</div>
				<div class="row mb-1">
					<div class="col">
						<img src="resources/images/banners/item.png" class="img-thumbnail">
					</div>
				</div>
			</div>
		</div>
	</main>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

</script>
</body>
</html>