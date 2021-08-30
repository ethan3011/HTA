<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event 연습하기</title>

<style type="text/css">
	div {
		border: 1px solid black;
		padding: 30px;
		margin: 70px;
	}
</style>
	<script type="text/javascript">
	function handler1(){
		console.log("onclick 실행");
	}
	
	function hanlder2(){
		console.log("onmouseenter 이벤트 발생");
	}
	
	function hanlder3(){
		console.log("onmouseleave 이벤트 발생");
		
	}
	function hanlder4(){
		console.log("onmouseover 이벤트 발생");
		
	}
	function hanlder5(){
		console.log("onmouseout 이벤트 발생");
	}
	
	function handler6(e){
		var x = e.pageX;
		var y = e.pageY;
		console.log(x,y,"onmousemove 이벤트 발생");
	}
	</script>

</head>
<body>

<div onclick="handler1()">div1
	<div onmouseenter="hanlder2()" onmouseleave="hanlder3()"
		 onmouseover="hanlder4()" onmouseout="hanlder5()" >div2
		<div onmousemove="handler6(event)">div3
		</div>
	</div>
</div>


</body>
</html>