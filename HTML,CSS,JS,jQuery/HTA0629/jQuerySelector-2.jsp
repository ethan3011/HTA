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

<!-- 		
	필터선택자
	:first			$("p:first")	첫번째 P엘리먼트 선택
	:last			$("p:last")		마지막번째 P엘리먼트 선택
	:even			$("p:even")		짝수번째 P엘리먼트 선택
	:odd			$("p:odd")		홀수번째 P엘리먼트 선택
!-->

	<h1>필터선택자 연습하기</h1>
	
	<p>p1</p>
	<p id="test">p2</p>
	<p>p3</p>
	<p>p4</p>
	<p>p5</p>
	<p>p6</p>
	<p>p7</p>
	<p>p8</p>
	<p>p9</p>
	<p>p10</p>

</div>
<script type="text/javascript">
	$('p:first').css('font-weight','bold');
	$('p:last').css('font-size','40px');
	$('p:odd').css('color','green');
	$('p:even').css('border','1px solid black');
	// odd, even은 0번이 1번이다.
	
	
	

</script>

</body>
</html>