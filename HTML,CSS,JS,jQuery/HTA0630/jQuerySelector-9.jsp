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
	<h1>폼 요소 선택자</h1>
	
	<form id="form-register">
		이름 : <input type="text" name="username" /> <br />
		아이디 : <input type="text" name="userid" /> <br />
		비번 : <input type="password" name="userpwd" /> <br />
		파일 : <input type="file" name="upfile" /> <br />
		성별 : <input type="radio" name="gender" value="F">여자<br />
		    : <input type="radio" name="gender" value="M">남자<br />
		기술 : <input type="checkbox" name="skill" value="java" checked>자바
			  <input type="checkbox" name="skill" value="c" >c
			  <input type="checkbox" name="skill" value="python" >파이썬
		 	  <input type="checkbox" name="skill" value="db" >데이터베이스
		경력 : <select name="carrer">
			<option value="1">1년 이상</option>
			<option value="3">3년 이상</option>
			<option value="5">5년 이상</option>
			<option value="7">7년 이상</option>
		</select> <br />
		자기소개 : <textarea rows="5" cols="60" name="memo"></textarea> 
	</form>

</div>
<script type="text/javascript">
	// 모든 폼 입력 요소를 선택해서 비활성화함
	$(':input').prop('disabled',true);
	
	// type="text" 폼 요소 활성화 
	$(':text').prop('disabled',false);
	
	// type="password" 폼 요소 활성화
	$(':password').prop('disabled',false);
	
	// type="file" 폼 요소 활성화
	$(':file').prop('disabled',false);
	
	// type="raido" 폼 요소 활성화
	$(':radio').prop('disabled',false);
	
	// 체크박스버튼 폼 요소 활성화
	$(':checkbox').prop('disabled',false);
	
	// select, textarea 폼 요소 활성화
	$('select').prop('disabled',false);
	$('textarea').prop('disabled',false);
	
	// 활성화 상태인 폼 요소 전부 비활성화 하기
	$(':enabled').prop('disabled',true);
	
</script>
</body>
</html>