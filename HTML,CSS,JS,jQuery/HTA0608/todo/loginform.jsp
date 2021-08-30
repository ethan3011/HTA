<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
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
	<div class="row mb-3">
		<div class="col-12">
			<h3 class="border p-2 bg-light">로그인 폼</h3>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-6">
			<div class="border p-2 bg-light">
				<form method="post" action="login">
					<div class="mb-3">
						<label class="form-label">아이디</label>
						<input type="text" class="form-control" name="userid" />
					</div>
					<div class="mb-3">
						<label class="form-label">비밀번호</label>
						<input type="password" class="form-control" name="password" />
					</div>
					<div class="mb-1 text-end">
						<button type="submit" class="btn btn-primary">로그인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>