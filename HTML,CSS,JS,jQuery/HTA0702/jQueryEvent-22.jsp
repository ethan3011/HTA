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
	<h1>onsubmit 이벤트 처리</h1>
	<%--
		onsubmit 이벤트는 <form> 태그에서 발생하는 이벤트다.
		<form>태그 안에 위치한
			<input type="submit" value="로그인" />
			<button type="submit>로그인</button>
			<button>로그인</button>
			위의 버튼을 클릭했을 때 <form>태그에서 onsubmit 이벤트가 발생한다.
			
			<button type="button">로그인</button>처럼
			type="button"으로 지정된 버튼을 클릭했을 때는 <form>태그에서 onsubmit 이벤트가 발생하지 않는다.
			
	 --%>
	<div class="row">
		<div class="col-12">
			<form id="form-login" method="post" action="login">
				<div class="form-group">
					<label>아이디</label>
					<input type="text" class="form-control" name="userId" id="user-id"/>
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input type="password" class="form-control" name="userPwd" id="user-pwd"/>
				</div>
				<div class="text-right">
					<button type="submit" class="btn btn-primary">로그인</button>
				</div>
			</form>
		</div>
	</div>

</div>
<script type="text/javascript">
	// 제출을 하였을떄 유효성 검사를 하여 값들이 비어있으면 오류를 발생하게 하라.
	$(function(){
		$('#form-login').submit(function(){
			if(!$.trim($('#user-id').val())){
				alert('아이디는 필수 입력값 입니다.')
				$('#user-id').focus();
				return false;
			}
			if(!$.trim($('#user-pwd').val())){
				alert('비밀번호는 필수 입력값 입니다.')
				$('#user-pwd').focus();
				return false;
			}
			return true;
		})
	})
	// form-login을 submit 하였을때 유효성 검사를 실시한다.
	// $.trim()으로 좌우 공백을 제거하고 안에 #user-id,#user-pwd에서 입력된 .val()의 값이 비어있으면 !를 사용하여 경고를 나타나게 한다.
	// alert로 메세제를 표시하고 $('#')으로 아이디와 비밀번호 창으로 키보드커서를 이동시킨다.
	// return으로 하여 submit을 종료시키고 아이디와 비밀번호를 모두 입력하였을 경우 true로 submit을 실행하게 한다.
	
</script>
</body>
</html>