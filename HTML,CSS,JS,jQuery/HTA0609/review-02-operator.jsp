<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바스크립트 연산자</title>
<script type="text/javascript">
//자바스크립트 연산자
// 사칙연산자, 대입연산자, 비교연산자, 논리연산자, 삼항연산자.
// 산술연산자
// + - */ % 
	var num1 = 14
	var num2 = 4
	var num3 = num1/num2;
	var num4 = num1-num2;
	var num5 = num1+num2;
	var num6 = num1*num2;
	console.log("num3",num3);
	console.log("num4", num4);
	console.log("num5", num5);
	console.log("num6", num6);

// 대입연산자
// = += -= *= +%=
	var value1 = 5
	var value2 = 4
	var test1 = (value1 = value2);
	var test2 = (value1 += value2);
	var test3 = (value1 -= value2);
	var test4 = (value1 *= value2);
	var test5 = (value1 %= value2);
	console.log("test1", test1);
	console.log("test2", test2);
	console.log("test3", test3);
	console.log("test4", test4);
	console.log("test5", test5);
	
// 증감연산자
// ++ --
	var x = 3;
	var y = 5;
	
	console.log(x++);
	console.log(++x);
	console.log(y++);
	console.log(++y);
	
// 비교연산자
// == === != !== > >= < <= 

	
// == 연산자와 === 연산자
// == 연산자는 값의 타입이 다르더라도 변환 후 같은 값이면 true로 판정한다.
// === 연산자는 값의 타입과 값이 전부 일치하는 경우에만 true로 판정한다
	console.log("5 == 5", 5 == 5);
	console.log("5 == '5'", 5 == '5');
	console.log("5 == 8", 5 == 8);
	console.log("5 == '8'", 5 == '8');
	
	console.log("5 === 5", 5 === 5);
	console.log("5 === '5'", 5 === '5');
	console.log("5 === 8", 5 === 8);
	console.log("5 === '8'", 5 === '8');

// != 연산자와 !== 연산자
// != 연산자는 값이 다르면 true로 판정한다.
// !== 연산자는 타입, 값 둘 중 하나만 달라도 true를 반환한다.
	console.log("5 != 5", 5 != 5)
	console.log("5 != '5'", 5 != '5')
	console.log("5 != 8", 5 != 8)
	console.log("5 != '8'", 5 != '8')
	
	console.log("2 !== 2", 2 !== 2)
	console.log("2 !== '2'", 2 !== '2')
	console.log("2 !== 6", 2 !== 6)
	console.log("2 !== '6'", 2 !== '6')

// 논리연산자
// && || !
// 자바스크립트에서 거짓으로 판정하는 것 : false, 0. ''. null, undefined, NaN
// 자바스크립트에서 참으로 판정하는 것 : 거짓으로 판정하는 것 빼고 나머지 전부다
	var f1 = '';
	var f2 = 0;
	var f3 = null;
	var f4;
	
	console.log("3 && 5", 3 && 5);
	console.log("4 || 8", 4 || 8);
	console.log("!3",!3);
	console.log("false",false);
	console.log("0",!f2);
	console.log("''",!f1);
	console.log("null",!f3);
	console.log("undefined",!f4);
	console.log("NaN",!NaN);
	console.log("3 && 0", !3 && 0);
	console.log("3 || 0", !3 || 0);
	
// 삼항연산자
// 조건식 ? 표현식1 : 표현식2
// 조건식이 참이면 표현식1의 값이 이 식의 최종값이 되고, 거짓이면 표현식2가 최종값이 된다.
	var a = 10;
	console.log("a == 10 ? tama : hindi",a == 10 ? "tama" : "hindi")
		
</script>
</head>
<body>
	<h1>자바스크립트의 데이터 타입</h1>
	<p>실행결과는 브라우저 콘솔창에서 확인 !</p>

</body>
</html>