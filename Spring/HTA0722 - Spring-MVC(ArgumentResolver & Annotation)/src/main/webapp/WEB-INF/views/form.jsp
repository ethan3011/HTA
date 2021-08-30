<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>회원가입</title>
</head>
<body>
<c:set  var="menu" value="register" />
<%@ include file="common/header.jsp" %>
<div class="container my-3">
	<main>
		<div class="row mb-3">
			<div class="col">
				<div class="row mb-3">
					<div class="col">
						<div class="border p-2 bg-dark text-white fw-bold">회원가입</div>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col">
						<div class="border p-2 bg-light">
							<form id="form-register" method="post" action="register" novalidate="novalidate">
								<div class="mb-3">
									<label class="form-label">아이디</label>
									<input type="text" class="form-control" id="user-id" name="id" />
								</div>
								<div class="mb-3">
									<label class="form-label">비밀번호</label>
									<input type="password" class="form-control" id="user-password" name="password" />
								</div>
								<div class="mb-3">
									<label class="form-label">비밀번호 확인</label>
									<input type="password" class="form-control" id="user-password-confirm" name="passwordConfirm" />
								</div>
								<div class="mb-3">
									<label class="form-label">이름</label>
									<input type="text" class="form-control" id="user-name" name="name" />
								</div>
								<div class="mb-3">
									<label class="form-label">이메일</label>
									<input type="text" class="form-control" id="user-email" name="email" />
								</div>
								<div class="mb-3">
									<label class="form-label">전화번호</label>
									<input type="text" class="form-control" id="user-phone" name="phone" />
								</div>
								<div class="mb-3 text-end">
									<a class="btn btn-secondary" href="home">취소</a>
									<button type="submit" class="btn btn-primary">회원가입</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="row mb-1">
					<div class="col">
						<img src="resources/images/banners/sale.png" class="img-thumbnail">
					</div>
				</div>
				<div class="row mb-1">
					<div class="col">
						<img src="resources/images/banners/sale.png" class="img-thumbnail">
					</div>
				</div>
				<div class="row mb-1">
					<div class="col">
						<img src="resources/images/banners/sale.png" class="img-thumbnail">
					</div>
				</div>
			</div>
		</div>
	</main>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(function() {
		$("#form-register").submit(function() {
			var userId = $.trim($("#user-id").val());
			if(!userId) {
				alert("아이디는 필수 입력값 입니다.");
				$("#user-id").focus();
				return false;
			}
			var userPwd = $.trim($("#user-password").val());
			if(!userPwd) {
				alert("비밀번호는 필수 입력값 입니다.");
				$("#user-password").focus();
				return false;
			}
			var userPwdCnf = $.trim($("#user-password-confirm").val());
			if(!userPwdCnf) {
				alert("비밀번호 확인은 필수 입력값 입니다.");
				$("#user-password-confirm").focus();
				return false;
			}
			if(userPwd != userPwdCnf) {
				alert("두 비밀번호의 값이 일치하지 않습니다.");
				$("#user-password-confirm").val("");
				$("#user-password").val("").focus();
				return false;
			}
			var name = $.trim($("#user-name").val());
			if(!name) {
				alert("이름은 필수입력값 입니다.");
				$("#user-name").focus();
				return false;
			}
			var email = $.trim($("#user-email").val());
			if(!email) {
				alert("이메일은 필수 입력값 입니다.");
				$("#user-email").focus();
				return false;
			}
			var phone = $.trim($("#user-phone").val());
			if(!phone) {
				alert("핸드폰번호는 필수입력값 입니다.");
				$("#user-phone").focus();
				return false;
			}
			return true;
		})
	})
</script>
</body>
</html>