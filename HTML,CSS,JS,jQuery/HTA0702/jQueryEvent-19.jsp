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
    	div {
    		border: 1px solid black; margin: 15px; padding: 15px;
    	}
    </style>
</head>
<body>

<div class="container">
	<h1>이벤트 버블링 방지하기</h1>
	
	<div id="box">
		<div id="box-1">
			<button id="btn-1">버튼1</button>
		</div>
		<div id="box-2">
			<button id="btn-2">버튼2</button>
		</div>
	</div>

</div>
<script type="text/javascript">
	// 이벤트 버블링을 방지시키기 2가지 방법
	$('#box').click(function(){
		console.log("#box에서 이벤트가 실행됨" )
	})
	
	$('#box-1').click(function(){
		console.log("#box box-1에서 이벤트가 실행됨")
	})
	
	$('#btn-1').click(function(event){
		event.stopPropagation();
		console.log("#box box-1 btn1이 실행됨")
	})
	
	$('#box-2').click(function(event){
		console.log("#box-2에서 이벤트가 실행됨")
	})
	$('#btn-2').click(function(){
		console.log("#box-2 btn-2 이벤트가 실행됨")
		return false;
	})
	
	// 버튼을 클릭하였을때는 버튼 밖에있는 이벤트들도 같이 실행해버리기 때문에 event를 매개변수로 받아서 event.stopPropagation()을 사용하거나 
	// return 값을 false로 주면 퍼져나가지 않고 해당 event만 실행이 되도록 할 수 있다.
</script>
</body>
</html>