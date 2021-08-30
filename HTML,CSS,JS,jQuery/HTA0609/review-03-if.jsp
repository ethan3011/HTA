<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>if문 연습</title>
<script type="text/javascript">

	// if 문
	// if ~ else 문
	// if ~ else if ~ else if 문
	
	var test = "60";
	
	if(test){
		console.log("true입니다", test);
	}
	
	if(test > 80){
		console.log('A');
	}else if(test > 70){
		console.log('B');
	}else if(test > 60){
		console.log('C');
	}else if(test > 50){
		console.log('D');
	}else {
		console.log('E');
	}
	
	if(test > 50){
		console.log("합격입니다.");
	}else {
		console.log("불합격입니다.");
	}
		
</script>
</head>
<body>
	<h1>자바스크립트의 데이터 타입</h1>
	<p>실행결과는 브라우저 콘솔창에서 확인 !</p>

</body>
</html>