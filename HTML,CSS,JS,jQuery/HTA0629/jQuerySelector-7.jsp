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
	기타 필터선택자
	:contains(text)		$("p:contains('안녕')")	p엘리먼트 중에서 '안녕'이라는 텍스트를 포함하고 있는 모든 P엘리먼트  선택
	:has(selector)		$("div:has(p)")		div엘리먼트 중에서 p엘리먼트 가지고 있는 모든 div엘리먼트를 선택
	:not(selector)		$("p:not( :last-child)")	p엘리먼트 중에서 막내가 아닌 모든 p엘리먼트를 선택
!-->

	<h1>순서 필터선택자</h1>
	
	<div id="box-1">
		<p>안녕</p>
		<p>하세요</p>
		<p>쿠쿠</p>
	</div>
	<div id="box-2">
		<p>김치만두</p>
		<p>감자치킨</p>
		<p>꿔바로우</p>
	</div>
	<div id="box-3">
		<h3>간장공장</h3>
		<p>공장장은</p>
		<p>간간장이고</p>
		<h4>아닌공장</h4>
		<p>공장장은</p>
		<p>아닌공장장이다</p>
		<p>수업끝!</p>
	</div>


</div>
<script type="text/javascript">
	var hello = $('p:contains("안녕")').text();
	console.log('hello',hello)
	
	var hasH3 = $('div:has(h3)');
	console.log("h3",hasH3);
	
	var notHash3 = $('p:not( :last-child');
	console.log('notHas3', notHash3)
	

</script>

</body>
</html>