<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바스크립트의 for 및 매채변수 여부와 관계없이 사용하기</title>
<script type="text/javascript">
	// arguemtns 를 사용하여 매개변수의 값들, 길이를 알수 있다.
	function sample(a,b,c,d,e,f,){
		console.log("a, b ,c, d, e, f ",a, b, c, d, e, f);
		console.log("arguments", arguments);
		console.log("arguments.length", arguments.length);
	}
	sample(5,2,7,6,4,9);
	
	function plus(a,b){
		var sum = 0;
		for(var i=0; i<arguments.length; i++){
			sum += arguments[i];
		}
		return sum;
	}
	
	var x1 = plus();
	var x2 = plus(1);
	var x3 = plus(1,2);
	var x4 = plus(1,2,3);
	var x5 = plus(1,2,3,4);
	var x6 = plus(1,2,3,4,5);
	var x7 = plus(1,2,3,4,5,6);
	var x8 = plus(1,2,3,4,5,6,7);
	
	console.log(x1,x2,x3,x4,x5,x6,x7,x8);
	
	// 이처럼 함수의 매개변수에는 a,b 두개뿐이지만, arguemtns를 이용하여 실질적으로 a,b를 벗어난 많은 숫자를 적어도
	// arguments로 값들과 길이를 알수 있어 식을 사용할수 있다.
	

</script>


</head>
<body>

</body>
</html>