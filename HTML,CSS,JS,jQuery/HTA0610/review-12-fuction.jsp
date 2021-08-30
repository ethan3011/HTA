<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매개변수에 함수를 대입하는법</title>
<script type="text/javascript">

//함수를 전달받은 매개변수

	var foods = [
		{name:"후라이드",price:18000,brand:"교촌"},
		{name:"양념치킨",price:20000,brand:"또래오래"},
		{name:"순살두마리",price:23000,brand:"호식이"},
		{name:"슈퍼파파",price:25000,brand:"파파존스"},
		{name:"치킨8피스",price:20000,brand:"잘리비"},
	]
	
	function search(filterType){
		var filteredItem = [];
		for(var i=0; i<foods.length; i++){
			var item = foods[i];
			if(filterType(item)){
				filteredItem.push(item);
			}
		}
		return filteredItem;
	}
	
	// 음식 가격이 20000인 경우의 필터
	function filter1(food){
		if(food.price == 20000){
			return true;
		}
		return false;
	}
	
	// 음식의 이름에 "파파"가 들어간 경우 
	// indexOf를 사용하면 글자가 들어간 값을 확인할수 있는데 글자가 없으면 -1 을 반환한다.
	// if문에서는 -1도 true로 인식하기 때문에 반드시 0보다 크다는 조건을 걸어주어야 한다.
	function filter2(food){
		if(food.name.indexOf("파파") > 0){
			return true;
		}
		return false;
	}
	
	var food1 = search(filter1);
	var food2 = search(filter2);
	
	console.log("음식 가격이 20000인 경우", food1);
	console.log("음식 이름에 '파파' 가 들어간 경우", food2);
	
	
	
	

</script>
</head>
<body>

</body>
</html>