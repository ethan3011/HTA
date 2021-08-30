<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event 연습하기</title>

</head>
<body>
<div>
	<h1> 키보드 이벤트 발생시키기</h1>
	<input type="text" id="user-id" name="userId" 
			onkeydown="handler1(event)" onkeypress="handler2()" onkeyup="handler3()"/>
</div>


<script type="text/javascript">

	// onkeydown를 실행해서 키가 눌렸을때를 알수있다.
	// e와 event를 이용해서 입력값 key와 아스키 코드 which도 알수있다.
	function handler1(e){
		var el = document.querySelector("#user-id");
		var value = el.value;
		console.log("onkeydown 이벤트 발생",el.value);
		console.log(e.key,e.which);
	}
	// 키를 누르고 있으면 발생하는 onkeypress다.
	// 키를 누르고 있으면 발생하나 잠깐만(입력) 눌러도 인식된다.
	function handler2(){
		var el = document.getElementById("user-id");
		var value = el.value;
		console.log("onkeypress 이벤트 발생", value);
	}
	
	// onkeyup으로 키가 위로 올라왔을때, 즉 손을 뗏을때 값이 반환된다.
	// onkeyup으로 입력된 총 값을 알수가 있다.
	function handler3(){
		var el = document.querySelector("#user-id");
		var value = el.value;
		console.log("onkeyup 이벤트 발생", value);
	}
	
</script>
</body>
</html>