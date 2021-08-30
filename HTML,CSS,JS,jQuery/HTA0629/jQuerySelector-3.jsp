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
	자식, 자손, 형제 선택자
	parent > child 		$("div > p")		div의 자식 중에서 모든 P엘리먼트 선택
	parent descendant	$("div p")			div의 후손 중에서 모든 P엘리먼트 선택
	element + next		$("div + p")		div 바로 아랫동생 P엘리먼트 선택
	element ~ siblings	$("div ~ p")		div 동생들중에서 P엘리먼트 선택
!-->

	<h1>자식 자손 형제 선택자</h1>
	
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
		<h3>p7</h3>
		<p>p8</p>
		<p>p9</p>
		<h4>h4</h4>
		<p>p10</p>
		<p>p11</p>
		<p>p12</p>
	</div>


</div>
<script type="text/javascript">
	$('#box-1 > p').css('font-size','25px');
	$('#box-2 p').css('font-weight','bold');
	$('#box-3 h3 + p').css('color','red');
	$('#box-3 h4 ~ p').css('color','yellow');

	// >를 사용하면 안에 포함되어 있는 자식 모든것을 뜻한다
	// 공백을 사용하면 후손 모두를 뜻한다
	// +는 한개만 선택가능하므로 중복되는 값이 있거나 정확한 위치를 잡지 않으면 작동하지 않는다.
	// ~도 마찬가지로 한개만 선택가능하고 그 다음값의 모든 ?이 선택된다.
</script>

</body>
</html>