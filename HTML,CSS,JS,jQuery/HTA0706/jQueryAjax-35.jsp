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
	<div class="mb-3">
		<h1>json 응답데이터, xml 응답데이터 처리하기</h1>
	</div>
	
	<div class="row">
		<div class="col">
			<form class="form-inline border bg-light p-2" id="form-search-1">
				<label class="mr-2">조회일자 : </label>
				<input type="date" class="form-control mr-2" id="date-boxoffice-1" />
				<button type="button" class="btn btn-outline-primary btn-sm" id="btn-boxoffice-1">조회</button>
			</form>
			<div class="mt-3 border bg-list p-2">
				<h4>박스오피스 순위</h4>
				<table class="table" id="table-boxoffice">
					<colgroup>
						<col width="10%">
						<col width="50%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<td>순위</td>
							<td>제목</td>
							<td>개봉일자</td>
							<td>예매율</td>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	// $.getJSON 방식 이용
	$(function(){
		$('#btn-boxoffice-1').click(function(){
			var $tbody = $('#table-boxoffice tbody');
			var StringDate = $('#date-boxoffice-1').val();
			
			if(!StringDate){
				alert('날짜를 선택해 주세요.');
				return;
			}
			if(!isBeforeToday(StringDate)){
				alert('오늘 날짜 이전을 선택해주세요.');
				return;
			}
			
			StringDate = StringDate.replace(/-/g,'');
			
			var url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"; 
			
			$.getJSON(url, {key:"f5eef3421c602c6cb7ea224104795888", targetDt:StringDate})
				.done(function(date){
					var boxOfficeArray = date.boxOfficeResult.dailyBoxOfficeList;
					$.each(boxOfficeArray, function(index, item){
						var $tr = $('<tr></tr>');
						$('<td></td>').text(item.rank).appendTo($tr);
						$('<td></td>').text(item.movieNm).appendTo($tr);
						$('<td></td>').text(item.openDt).appendTo($tr);
						$('<td></td>').text(item.salesShare).appendTo($tr);
						
						$tbody.append($tr);
					})
				})
				.fail(function(){
					alert('에러가 발생하였습니다.');
					return;
				})
				.always(function(){
					
				})
			function getTodayTime(){
				var day = new Date();
				var year = day.getFullYear();
				var month = day.getMonth();
				var date = day.getDate();
				var today = new Date(year, month, date);
				return today.getTime();
			}
			
			function inputDateTime(StringDate){
				var date = new Date(StringDate);
				return date.getTime();
			}
			
			function isBeforeToday(StringDate){
				return getTodayTime() > inputDateTime(StringDate);
			}
		})
	})
	
	// 기존의 JSON 방식과 비슷하나 다른것이 있다면 $.ajax 에서 $.getJSON 으로 바뀌었으며
	// 밑에 한줄씩 적어내리는 $.ajax 방식과 다르게 type이 없고 url,date 만 ()안에 적고 바로 사용하며
	// .done, .fail, .always 를 사용한다.
</script>
</body>
</html>