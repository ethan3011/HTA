<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바스크립트의 기본함수</title>
<script type="text/javascript">

	// 함수의 생성 및 실행
	function test1(){
		console.log("test1함수를 실행했습니다.", test1());
	}
	
	console.log(test1);

	// 매개변수가 있는 함수의 정의 및 실행
	function test2(a,b){
		var result = a+b;
		console.log("test2의 실행결과", result);
	}
	
	test2(1,4);
	test2(100,5.5);
	test2(5.124124,-15.1241251);
	
	// 반환값이 있는 함수의 정의 및 실행
		function test3(name){
		console.log(name + '님 환영합니다.');
	}
	
	test3('홍길동');
	test3('김유신');
	
	// 사용자와 상호작용함수 정의하기
	function test4(){
		console.log("test4가 실행되었습니다.");
	}
	function test5(){
		console.log("test5가 실행되었습니다.");
	}
	function test6(){
		console.log("test6가 실행되었습니다.");
	}

</script>

</head>
<body>
	<div>
		<h2>사용자와 상호작용 하는 버튼 만들기</h2>
		<button onclick="test4()">test4()실행하기</button>
		<button onclick="test5()">test5()실행하기</button>
		<button onclick="test6()">test6()실행하기</button>
	</div>

</body>
</html>