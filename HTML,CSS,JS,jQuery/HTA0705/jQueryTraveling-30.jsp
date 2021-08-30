<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Bootstrap 4 Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
	<h1>필터링 하기</h1>
	<div class="row">
		<div class="col-2">
			<ul class="list-group">
				<li class="list-group-item" id="item-1">성적우수자</li>
				<li class="list-group-item" id="item-2">합격자</li>
				<li class="list-group-item" id="item-3">불합격자</li>
			</ul>
		</div>
		<div class="col-10">
			<table class="table table-bordered">
				<colgroup>
					<col width="16.65%"/>
					<col width="16.65%"/>
					<col width="16.65%"/>
					<col width="16.65%"/>
					<col width="16.65%"/>
					<col width="16.65%"/>
				</colgroup>
				<thead>
					<tr>
						<th>이름</th>
						<th>국어</th>
						<th>영어</th>
						<th>수학</th>
						<th>총점</th>
						<th>평균</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>강감찬</td>
						<td>100</td>
						<td>90</td>
						<td>90</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>이순신</td>
						<td>60</td>
						<td>30</td>
						<td>50</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>김유신</td>
						<td>80</td>
						<td>70</td>
						<td>60</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>안중근</td>
						<td>50</td>
						<td>70</td>
						<td>80</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>김좌진</td>
						<td>80</td>
						<td>80</td>
						<td>60</td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>

/*

// 배열에 저장된 값의 갯수만큼 콜백함수를 실행한다.
// 콜백함수가 실행될 때마다 현재 인덱스 번호와 배열의 값이 콜백함수의 매개변수로 전달된다.
$.each(배열, function(index, item) { 

})

$.each(배열, function() {
   // 콜백함수에서 this를 사용하면 this에는 콜백함수 실행시 전달된 배열의 값이 들어있다.
})

// 선택자로 검색된 엘리먼트의 갯수만큼 콜백함수를 실행한다.
// 콜백함수가 실행될 때마다 검색된 엘리먼트의 인덱스와 엘리먼트가 콜백함수의 매개변수로 전달된다.
$(선택자).each(function(index, el) {

})

$(선택자).each(function() {
   // 콜백함수에서 this를 사용하면 this에는 콜백함수 실행시 전달된 엘리먼트가 들어있다.
})


// 선택자로 검색된 엘리먼트의 갯수만큼 콜백함수가 실행된다.
// 콜백함수가 true를 반환하는 엘리먼트가 최종적으로 선택된다.
// 콜백함수를 실행할 때마다 검색된 검색된 엘리먼의 인덱스와 엘리먼트가 콜백함수의 매개변수로 전달된다.
$(선택자).filter(function(index, el) {
   
})

 */

		// 총합, 평균 구하고 대입하기
		$(function(){
			$('tbody tr').each(function(index, score){
				var kor = $(score).find('td:eq(1)').text();
				var eng = $(score).find('td:eq(2)').text();
				var math = $(score).find('td:eq(3)').text();
				
				var totalScore = parseInt(kor) + parseInt(eng) + parseInt(math);
				var average = Math.trunc(totalScore/3);
				
				$(score).find('td:eq(4)').text(totalScore);
				$(score).find('td:eq(5)').text(average);
				
				// 평균이 90점 이상인 행을 선택하기(성적우수자)
				$('#item-1').click(function(){
					$('#item-1').addClass('active').siblings().removeClass('active');
					$('tbody tr').removeClass('bg-success bg-primary bg-danger');
					
					$('tbody td:last-child').filter(function(index,el){
						var avg = parseInt($(el).text());
						return avg >= 90;
					}).parent().addClass('bg-success');
				})

				// 평균이 60점 이상인 행을 선택하기(합격자)
				$('#item-2').click(function(){
					$('#item-2').addClass('active').siblings().removeClass('active');
					$('tbody tr').removeClass('bg-success bg-primary bg-danger');
					
					$('tbody td:last-child').filter(function(index, el){
						var avg = parseInt($(el).text());
						return avg >= 60;
					}).parent().addClass('bg-primary');
					
				})
				
				// 평균이 60점 미만인 행을 선택하기
				$('#item-3').click(function(){
					$('#item-3').addClass('active').siblings().removeClass('active');
					$('tbody tr').removeClass('bg-success bg-primary bg-danger');
					
					$('tbody td:last-child').filter(function(index, el){
						var avg = parseInt($(el).text());
						return avg < 60;
					}).parent().addClass('bg-danger');
				})
			})
		})
		
		
		// 총합과 평균값을 구하기 위하여 $.ecah를 사용하여 각 tbody tr안에 있는 점수를 찾기위해 find()td:eq(0), td:eq(1), td:eq(2)를 찾아서 
		// parseInt로 변환후 총 합을 구하고 Math.trunc()/과목수 로 평균을 구해서 저장한다.
		
		// 그다음 find()td:eq(4)와 find()td:eq(5) 에 총합과 평균값을 넣어준다.
		
		// 성적우수자(item-1)을 클릭하면 tbody에 있는 값이 선택되게 하기 위하여 #('#item-1').click(function(){})를 사용한다.
		// {}안에 먼저 평균값을 찾기 위해 $('tbody td:last-child') == (tbody td:eq(4)) 를 사용하여 평균값을 찾는다.
		// filter(function(index, el){})를 사용하여 true값이 나오는것만 선택되게한다.
		// {}에 평균값을 찾기 위해 var avg = parseInt($(el.text()))로 텍스트를 평균값으로 parse한다.
		// return avg > xx 로 필터를 걸어 결과가 true인것만 실행되도록 한다.
		// 필터종료(filter(function(index, el){})).addClass('bg-xxxx')로 선택된 행의 색상을 변경한다.
		
		
</script>

</body>
</html>