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

<!-- 기본선택자
	*				$("*")			모든 엘리먼트 선택
	#id				$("#box")		id="box"인 엘리먼트 선택
	.class			$(".btn")		class="btn"인 모든 엘리먼트 선택
	tag				$("p")			모든 P 엘리먼트 선택
	tag,tag,tag		$('h1,h2,h3')	모든 h1, h2, h3 엘리먼트 선택	
!-->

	<h1>기본선택자 연습하기</h1>
	<h2>기본선택자 연습하기</h2>
	<h3>기본선택자 연습하기</h3>
	
	<p>p1</p>
	<p id="test">p2(노란색)</p>
	<p>p3</p>
	<p>p4</p>
	<p>p5</p>
	<p>p6</p>
	<p>p7</p>
	<p>p8</p>
	<p>p9</p>
	<p>p10</p>

	<button class="button" >test</button>
</div>
<script type="text/javascript">
	$('*').css('color','red');
	
	$('#test').css('color','yellow');
	
	$('.button').css('color','blue');
	
	$('h1,h2,h3').css('color','green');
	

</script>

</body>
</html>