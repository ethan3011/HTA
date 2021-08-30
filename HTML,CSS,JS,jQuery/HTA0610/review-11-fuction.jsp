<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바스크립트의 즉시함수</title>
<script type="text/javascript">

// 인자를 전달받지 안는 즉시 실행함수
// 아래와 같이 함수를 ()로 감싸고 이름을 정의하지 않은채로 실행하면 단 한번만 실행된다. 따로 실행을 시키지 않아도 페이지 로딩과 함께 시작된다.
	(function (){
	console.log("인자가 없는 즉시함수 실행");
	})();
//	아래와 같이 매개변수를 삽입하려면 매개변수의 값을 지정해주면 된다. 그 이후 괄호 밖에 매개변수에 대입할 값을 넣어주면 된다.
	(function(k) {
		console.log("k의 값", k);
	})(10);
	
</script>
</head>
<body>

</body>
</html>