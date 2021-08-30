<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바스크립트의 변수들</title>
<script type="text/javascript">
//자바스크립트의 기본 자료형
// string, number, boolean, undefined
/*
	string
		- 문자열타입
		- 문자열은 ""나 ''안에 있는 내용이다.
	number
		- 숫자타입
		- 정수, 실수 모두 하나의 타입으로 다룬다.
	boolean
		- 불린타입
		- true, false값을 가진다.
	undefined
		- 변수가 초기화되지 않으면 그 변수는 undefined 타입의 값 undefined를 가진다.
*/

// 변수 선언하고 초기화하기
	var no = 100;
	var name = "홍길동";
	var blue = true;
	var address;
	
	console.log(typeof(no));
	console.log(typeof(name));
	console.log(typeof(blue));
	console.log(typeof(address));
	
	var no = "감감";
	console.log(no);
	
	var blue = 3.14;
	console.log(blue);
	
	
</script>
</head>
<body>
	<h1>자바스크립트의 데이터 타입</h1>
	<p>실행결과는 브라우저 콘솔창에서 확인 !</p>
</body>
</html>