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
    <style>
    	div{
    		border: 1px solid black;
    		margin: 15px;
    		padding: 15px;
    	}
    </style>
</head>
<body>

<div class="container">
	<h1>엘리먼트 삭제하기</h1>
	
	<div id="box-1">
	<h3>remove</h3>
		<p>컨텐츠</p>
		<p>컨텐츠</p>
		<p>컨텐츠</p>
	</div>
	
	<div id="box-2">
		<h3>empty</h3>
		<p>컨텐츠</p>
		<p>컨텐츠</p>
		<p>컨텐츠</p>
	</div>
	
		<div id="box-3">
		<h3>hide</h3>
		<p>컨텐츠</p>
		<p>컨텐츠</p>
		<p>컨텐츠</p>
	</div>

</div>

<script type="text/javascript">
	// 엘리먼트를 삭제하는 3가지 방법
	
	// remove는 선택한 #box-1을 포함한 모든 엘리먼트를 삭제한다.
	$('#box-1').remove();
	
	// empty는 선택한 #box-2를 제외하고 모두 삭제한다.
	$('#box-2').empty();
	
	// hide는 표시를 안되게 할뿐 삭제를 하지 않음.
	$('#box-3').hide();
	
	
</script>
</body>
</html>