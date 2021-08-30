<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바스크립트의 전역변수 및 지역변수 및 호이스팅</title>
<script type="text/javascript">
	
	// 전역변수 정의하기
	var c1 = "김치";			// 전역변수
	
	// 메소드 안에서 전역변수 정의하기
	function f1(){
		c2 = "라면";			// 전역변수
		var c3 = "치킨";		//지역변수
		
		console.log("c1",c1);
		console.log("c2",c2);
		console.log("c3",c3);
	}
	
	function f2(){
		console.log("c1",c1);
		console.log("c2",c2);
		// console.log("c3",c3);	f1에 포함된 지역변수이기 때문에 다른 함수에서 사용이 불가능함.		
	}
	
	f1();
	f2();
	
	// 지역변수 선언
	
	function f3(){
		var name = "홍길동";
		var kor = 100;
		var eng = 90;
		var math = 80;
		
		var total = kor+eng+math;
		var average = total/3
	
		if(average >= 70){
			var Grade = 'C';
			var message = "장학금 지급 대상입니다.";
		}// 밑에 들어간 grade와 message는 if문 안에 들어있지만 hosting 기능으로 인하여 작동된다.
		console.log("평균",average,"그레이드",Grade, "message",message);
	}

	
	// 변수 끌어올리기 함수 실행
	
	f3();
	
	// 변수 끌어올리기가 일어나지 않게 하기
	// 변수 선언시 var 대신 let 키워드를 사용한다.
	// let으로 선언된 변수는 스코프는 블록이다.
	function f4(){
		let name = "홍길동";
		let kor = 100;
		let eng = 90;
		let math = 80;
		
		let total = kor+eng+math;
		let average = total/3
	
		if(average >= 70){
			let Grade = 'C';
			let message = "장학금 지급 대상입니다.";
		}
		// let으로 선언된 변수는 그 블록을 벗어난 곳에서는 사용할 수 없다.
		// console.log("평균",average,"그레이드",Grade, "message",message);
	}
	
	f4();
</script>
</head>
<body>

</body>
</html>