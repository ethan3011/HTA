<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바스크립트의 배열</title>
<script type="text/javascript">
	// 배열
	// - 길이가 가변적이다.
	// - 타입이 서로 다른 값들을 배열의 요소로 가질 수 있다.
	// - 배열객체는 배열의 길이를 반환하는 length 프로퍼티가 있다.
	// - 자바의 ArrayList와 유사하다.
	
	// 배열의 선언과 초기화
	var array = [];
	var array2 = [100,200,300,400,500]
	var array3 = [40, "김치", false, [100,300]];
	console.log("array",array);
	console.log("array2",array2);
	console.log("array3",array3);
	
	// 배열에 요소 추가하기, 조회하기, 삭제하기
	// 배열객체의 push() 메소드를 이용하면 배열의 맨 마지막요소 다음에 새로운 요소를 추가한다.
	var emptyarr = [];
	emptyarr.push(100);
	emptyarr.push(200);
	emptyarr.push(300);
	emptyarr.push(400);
	console.log("emptyarr", emptyarr);
	
	// 배열객체의 unshift() 메소드를 이용하면 배열의 맨 처음 요소 앞에 새로운 요소를 추가한다.
	var blankarr = [];
	blankarr.unshift(123);
	blankarr.unshift(234);
	blankarr.unshift(345);
	blankarr.unshift(456);
	blankarr.unshift(567);
	blankarr.unshift(678);
	console.log("blankarr",blankarr.length);
	
	// 배열객체의 shift()메소드를 이용하면 배열의 매 첫번째 값부터 추출할 수 있다.
	console.log(blankarr.shift(),blankarr);
	
	// 배열객체의 splice(start,howManyDelete, addItems, ...)메소드를 이용하면
	// 요소의 추가, 삭제가 가능하다.
	// 배열.splice(1, 1) : 배열의 1번째부터 요소를 1개를 삭제한다.
	// 배열.splice(1, 2) : 배열의 1번째부터 요소를 2개를 삭제한다.
	// 배열.splice(1, 1, 값, 값, 값) : 배열의 1번째부터 1개 값을 삭제하고 그 자리에 값들을 추가한다.
	var testval = [1,2,3,4,5,6,7,8,9,10];
	console.log("testval", testval);
	testval.splice(1, 1);
	console.log("testval", testval);
	testval.splice(1,0,'추','가','함');
	console.log("testval", testval);
	
	// 학생들의 국어점수
	var kors = [40, 70, 50, 65, 80, 90, 25, 80];
	
	// 국어점수 총점과 평균 계산하기
	var totalScore = 0;
	for(var i = 0; i<kors.length; i++){
		totalScore += kors[i];
	};
	console.log("한국어 총 점수" + totalScore);
	console.log("한국어 평균 : " + totalScore/kors.length);
</script>
</head>
<body>
	<h1>자바스크립트의 데이터 타입</h1>
	<p>실행결과는 브라우저 콘솔창에서 확인 !</p>

</body>
</html>