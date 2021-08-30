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
	<h1>onclick 이벤트</h1>
	
	<div>
		<button onclick="fn1()" class="btn btn-primary" id="btn-1">버튼1</button>
		<button class="btn btn-primary" id="btn-2">버튼2</button>
		<button class="btn btn-primary" id="btn-3">버튼3</button>
		<button class="btn btn-primary" id="btn-4">버튼4</button>
		<button class="btn btn-primary" id="btn-5">버튼5</button>
	</div>
	
	<div class="mt-3">
		<button class="btn btn-secondary" id="btn-off-1">버튼1</button>
		<button class="btn btn-secondary" id="btn-off-2">버튼2</button>
		<button class="btn btn-secondary" id="btn-off-3">버튼3</button>
		<button class="btn btn-secondary" id="btn-off-4">버튼4</button>
		<button class="btn btn-secondary" id="btn-off-5">버튼5</button>
	</div>
	
</div>
<script type="text/javascript">
	
	// 버튼1~5 까지 5가지 방식으로 onclick 이벤트 처리 하기
	// JavaScript 방식
	function fn1(){
		console.log('방법1 onclick 메소드를 사용한다.');
	}
	// jQuery 방식
	$('#btn-2').on('click', function(){
		console.log('방법2 on("click",function(){}) 방식을 이용한다')
	})
	// jQuery 방식
	$('#btn-3').click(function(){
		console.log('방법3 .click(function(){}) 를 이용한다.')
	})
	// JavaScript 방식
	document.getElementById('btn-4').onclick = function(event){
		console.log('document.getElementById로 선택을 한후 = function(){}를 이용한다.')
	}
	// JavaScript 방식
	document.getElementById('btn-5').addEventListener('click', function(){
		console.log('doucment.getElementById(아이디).addEventListener("이벤트명",function(){})를 이용한다.')
	})

	
	
	// 버튼 2~3 (1,4,5은 jquery방식이 아니기에 불가능) 사용 불가능하게 폐기하기
	$('#btn-off-1').click(function(){
		$('#btn-1').off('click');
	})
	$('#btn-off-2').click(function(){
		$('#btn-2').off('click');
	})
	$('#btn-off-3').click(function(){
		$('#btn-3').off('click');
	})
	$('#btn-off-4').click(function(){
		$('#btn-4').off('click');
	})
	$('#btn-off-5').click(function(){
		$('#btn-5').off('click');
	})
</script>
</body>
</html>