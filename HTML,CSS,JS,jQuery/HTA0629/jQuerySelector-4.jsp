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
	자식 필터선택자
	:first-child		$("p:first-child")	p엘리먼트 중에서 장남인 모든 P엘리먼트 선택
	:last-child		$("p:last-child")	p엘리먼트 중에서 막내자식인 모든 P엘리먼트 선택
	:nth-child(n)		$("p:nth-child(2)")	p엘리먼트 중에서 둘째 자식인 모든 P엘리먼트 선택
!-->

	<h1>자식 필터 선택자</h1>
	
	<div id="box-1">
		<p>p1</p>
		<p>p2</p>
		<p>p3</p>
	</div>
	<div id="box-2">
		<p>p4</p>
		<p>p5</p>
		<p>p6</p>
	</div>
	<div id="box-3">
		<p>p8</p>
		<p>p9</p>
		<p>p10</p>
		<p>p11</p>
		<p>p12</p>
	</div>


</div>
<script type="text/javascript">
	$('div p:first-child').css('color','green');
	$('div p:last-child').css('color','blue');
	$('div p:nth-child(2)').css('font-weight','bold');
	
	// first-child는 div안에 있는 p들중 첫번째만 선택된다.
	
	// last-child는 div 안에 있는 p들중 마지막만 선택된다.
	
	// nth:()번호는 1번부터 시작한다.
</script>

</body>
</html>