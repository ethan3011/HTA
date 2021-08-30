<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름있는 함수와 없는 함수의 생성 및 실행법</title>
<script type="text/javascript">

	// 이름있는 함수의 생성
	function plus(x,y){
		return x+y;
	}
	
	var minus = function(x,y){
					return x-y;
				}
	
	// 함수들의 실행
	console.log("이름있는 함수의 실행",plus(2,4));
	console.log("이름없는 함수의 실행",minus(5,7));
	
	// 이름이 없는 함수를 사용하려면 객체를 var로 생성하여 함수를 담으면 된다.
	// 자바스크립트는 자바와 다르게 함수를 담을수 있다.
	
	
</script>

</head>
<body>

</body>
</html>