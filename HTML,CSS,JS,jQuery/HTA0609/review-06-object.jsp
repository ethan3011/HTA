<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바스크립트의 Object</title>
<script type="text/javascript">

// 자바스크립트의 객체
/*
	- 기본자료형(number, string, boolean, undefined 등)을 제외하고 나머지니느 거의 전부 객체다.
	- 프로퍼티와 메소드를 가진다.
	- 자바스크립트의 객체는 자바의 Map과 유사하다.
		* key : 프로퍼티형, 메소드명
		* value : 기본자료형값, 배열, 객체, 함수
		* 언제든지 객체의 프로퍼티와 메소드를 추가/삭제할 수 있다.
		{
			이름:값,		<-- 프로퍼티	-- 자바의 멤버변수
			이름:값,		<-- 프로퍼티	-- 자바의 멤버변수
			이름:기능,		<-- 메소드	-- 자바의 메소드
			이름:기능		<-- 메소드	-- 자바의 메소드
		}
	- 객체 생성하기
		* 객체 리터럴
			var obj = {};	// 구성요소가 하나도 없는 객체 생성
			var obj = {no:			"100-11-1000",		// 프로퍼티
					   balance:		12000000,			// 프로퍼티
					   deposit:		function(momey){	// 메소드
								수행문;
						}
					};
		* 생성자 함수
			function User(no, id, name){
			this.no = no;
			this.id = id;
			this.name = name;
		}
			// 생성자 함수를 사용해서 객체 생성하기
			var user = new User(); 
		* Object 생성자 함수
			var user = new Object();
*/

// 객체 생성하기
	var obj = {};
	console.log("빈객체생성",obj);
	console.log("타입",typeof(obj));

// 구성요소를 가지고 있는 객체 생성하기
	var obj2 = {
		name: "chicken",
		price: 17000,
		stock: 5,
		isSoldOut: false, 
		displayInfo: function(){
			console.log("name", this.name);
			console.log("price", this.price);
			console.log("stock", this.stock);
			console.log("isSoldOut", this.isSoldOut);
		}
	};
	console.log(obj2);
	obj2.displayInfo();

// 객체 생성 및 초기화
	var obj3 = {
	name: undefined,
	phone: undefined,
	email: undefined,
	gender: undefined
	};
	console.log("obj3",obj3);

// 프로퍼티에 값 설정하기(초기화하기)
	obj3.name = "홍길동";
	obj3["phone"] = "010-1234-5678";
	obj3["email"] = "hong@gmail.com";
	obj3.gender = "male";
	console.log("obj3에 값추가 후",obj3);

// 프로퍼티 조회하기
	console.log(obj3.name);
	console.log(obj3["phone"]);
	console.log(obj3["email"]);
	console.log(obj3.gender);

// 프로퍼티값 변경/추가하기
	obj3.name = "김유신";
	obj3.phone = "010-7777-7777";
	obj3.address = "경기도 광주시";
	obj3.address2 = "강남 서울시";
	
	console.log("obj3값 변경및추가", obj3);

	
	var obj4 = obj3;

	console.log("obj4생성 후 obj3변경전",obj3);
	obj4.email = "kim@gmail.com";
	obj4["gender"] = "female"
	obj4.name = "변경했지롱";
	
	console.log("값 변경후 obj4", obj4);
</script>
</head>
<body>
	<h1>자바스크립트의 데이터 s타입</h1>
	<p>실행결과는 브라우저 콘솔창에서 확인 !</p>

</body>
</html>