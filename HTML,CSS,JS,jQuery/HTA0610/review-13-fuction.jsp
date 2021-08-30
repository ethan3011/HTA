<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매개변수에 함수 전달하기 및 화살표 함수 사용해보기</title>
</head>
<script type="text/javascript">

	var foods = [
		{name:"후라이드",price:18000,brand:"교촌"},
		{name:"양념치킨",price:20000,brand:"또래오래"},
		{name:"순살두마리",price:23000,brand:"호식이"},
		{name:"슈퍼파파",price:25000,brand:"파파존스"},
		{name:"치킨8피스",price:20000,brand:"잘리비"},
	]
	
	function search(filterType){
		var searchedItem = [];
		for(var i=0; i<foods.length; i++){
			var item = foods[i];
			if(filterType(item)){
				searchedItem.push(item);
			}
		}
		return searchedItem;
	}
	
	function filter1(food){
		if(food.price > 15000 && food.price <25000){
			return true;
		}
		return false;
	}
	
	var fil1 = search(filter1);
	
	console.log("food가격이 15000 이상 25000 이하 출력",fil1);
	
	// 화살표함수
	var fil2 = search(food => food.price > 20000);
	console.log("화살표 함수로 20000원 이상인 상품 출력하기", fil2);
	
	var fil3 = search(food => food.name.indexOf("두마리") > 0);
	console.log("화살표 함수로 두마리 글자가 포함된 food 정보 출력", fil3);
	
	// 주문내역
	var orders = [
		{no:10, category:"전자책", name:"이것이 자바다", price:35000, amount:5},
		{no:11, category:"노트북", name:"맥북", price:2500000, amount:2},
		{no:12, category:"스마트폰", name:"아이폰12", price:1200000, amount:2}
	];
	
	// 포인트 합계 구하기
	function calculatePoint(sum){
		var point = 0;
		for(var i=0; i<orders.length; i++){
			point += sum(orders[i]);
		}
		return point;
	}
	
	
	// vip 고객일 떄의 적립금 {산하기 기능을 전달해서 적립금 반환받기
	// 상품가격이 200만원 이상인 경우 5% 적립, 추가로 구매수량만큼 상품가격의 2% 적립
	// 상품가격이 100만원 이상인 경우 3%적립, 추가로 구매수량만큼 상품가격의 1% 적립
	// 상품가격이 100만원 미만인 경우 1%적립,
	
	
	var total = calculatePoint(item => {
		if(item.price >= 2000000){
			return item.price*0.05 + item.price*0.02*item.amount;
		}
		if(item.price >= 1000000){
			return item.price*0.03 + item.price*0.01*item.amount;
		}
		return item.price*0.01;
		})
	console.log("총 포인트 : ", total);
	
	
	
	
	
	
	
	
	
	

</script>
<body>

</body>
</html>