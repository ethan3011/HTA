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
	순서 필터선택자
	:eq(index)		$("p:eq(0)")		p엘리먼트 중에서 0번째 P엘리먼트 선택
	:gt(index)		$("p:gt(2)")		p엘리먼트 중에서 2번째 다음의 모든 P엘리먼트 선택
	:lt(index)		$("p:lt(2)")		p엘리먼트 중에서 2번째 이전의 모든 P엘리먼트 선택
!-->

	<h1>순서 필터선택자</h1>
	
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
		<h3>H3</h3>
		<p>p8</p>
		<p>p9</p>
		<h4>H4</h4>
		<p>p10</p>
		<p>p11</p>
		<p>p12</p>
	</div>


</div>
<script type="text/javascript">
	$('#box-1 p:eq(1)').css({backgroundColor : 'red'});
	
	$('#box-2 p:gt(1)').css({fontWeight : 'bold'});
	
	$('#box-3 p:lt(3)').css({color : 'green'});
	
	// eq은 몇번째를 선택하는것.
	
	// gt는 초과 값만 선택하는것
	
	// lt는 미만 값만 선택하는것.
</script>

</body>
</html>