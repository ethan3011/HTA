<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event 연습하기</title>
</head>
<body>
	<div id="text-box">
		<div id="text-box-1">첫번째 글 박스 입니다.</div>
		<div id="text-box-2">두번째 글 박스 입니다.</div>
		<div id="text-box-3">세번째 글 박스 입니다.</div>
	</div>
	
	<div id="btn-box">
		<button onclick="firstBoxHandler()">버튼1</button>
		<button onclick="secondBoxHandler()">버튼2</button>
		<button onclick="thirdBoxHandler()">버튼3</button>
	</div>


<script type="text/javascript">
	function firstBoxHandler(){
		var el = document.getElementById("text-box-1")
		var text = el.textContent;
		alert(text);
	}
	function secondBoxHandler(){
		var el = document.querySelector("#text-box-2");
		el.textContent = "값을 변경변경 합니다."
	}
	
	function thirdBoxHandler(){
		var el = document.querySelector("#text-box-3");
		el.remove();
	}

	
	// getElementById로 id를 읽어와서 엘리먼트를 저장할수 있다.
	// 또한 querySelect로 id를 읽어올수도 있다.(#을 적어서 id를 명시해야함)
	// el.remove로 id를 엘리먼트를 읽어온 후 삭제할수 있다.

</script>
</body>
</html>