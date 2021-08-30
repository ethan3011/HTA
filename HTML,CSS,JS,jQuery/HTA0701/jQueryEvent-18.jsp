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
	<h1>이벤트발생시 실행되는 기본 행동이 실행되지않게 하기</h1>
	<p>
		a태그는 onclick 이벤트가 발생하면 지정된 링크로 이동하는 것이 기본 행동이다.<br />
		form태그는 onsubmit이벤트가 발생하면 서버로 폼입력값    을 제출하는 것이 기본 행동이다.<br />
		
		a태그를 클릭해도 지정된 링크로 이동되지 않게 하기,
		submit이벤트가 발생해도 폼 입력값을 제출하지 않게 하고 싶다.
	</p>
	
	<div id="box-1">
		<a href="http://www.daum.net" id="link-1">다음</a>
		<a href="http://www.daum.net" id="link-2">다음</a>
	</div>
	
	<div id="box-2">
		<form id="form-login" method="post" action="login.jsp">
			아이디:<input type="text" name="userId"><br/>
			비밀번호:<input type="password" name="userpwd"><br/>
			<button type="submit">로그인</button>
		</form>
	</div>
	
<script type="text/javascript">
	// 아이디가 비어있으면 "아이디를 입력하세요:"를 표시하고 비밀번호가 비어있으면 "비밀번호를 입력하세요"를 표시한다.
	// 폼의 id는 form-login으로 # 사용
	// 폼의 선택자 방법은 :이므로 :text로 input type="text" 인것만 선택
	// :text로 모든 text를 선택후 name="userId"로 name이 userId인것만 선택
	// .val()로 현재 값을 읽어오기
	// if()로 만약 비어있으면 alert로 비어있다고 표시하기.
	$('#form-login').submit(function(){
		if($(':text[name="userId"]').val() == ""){
			alert('아이디를 입력하세요.')
			return false;
		}
		if($(':password[name="userpwd"]').val() == ""){
			alert('비밀번호를 입력하세요')
			return false;
		}
		return true;
	})
	

	// link-1, link-2를 클릭하면 비활성화 되게 한다. 2가지 방법
	
	// 방법1 return 값으로 false를 줘서 작동을 중지시킨다.
	$('#link-1').click(function(){
		return false;
	});
	// 방법2 event를 매개변수로 받고 event안에 있는 preventDefault()기능을 사용한다. (prevent는 예방/방지)
	$('#link-2').click(function(event){
		event.preventDefault();
	});
	
</script>
</div>

</body>
</html>