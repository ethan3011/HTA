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
	// JSON 이용
$(function(){
	$('#btn-boxoffice-1').click(function(){
		var $tbody = $('#table-boxoffice tbody').empty();
		
		var StringDate = $('#date-boxoffice-1').val();
		
		
		if(!StringDate){
			alert('날짜를 선택해 주세요.');
			return;
		}
		if(!isBeforeToday(StringDate)){
			alert('오늘 이후 날짜는 선택할 수 없습니다.')
			return;
		}
		
		// replace를 사용해서 날짜 안에 들어있는 모든 - 를 공백으로 설정한다. 
		var StringDate = StringDate.replace(/-/g,'');
		
		$.ajax({
			type:"GET",
			url:"http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json",
			data:{key:"f5eef3421c602c6cb7ea224104795888",targetDt:StringDate},
			dataType:"json",
			success:function(boxOffice){
				
					var searchedDate = boxOffice.boxOfficeResult.dailyBoxOfficeList;
					$.each(searchedDate, function(index, item){
						console.log(item);
					
					var $tr = $("<tr></tr>");
					$('<td></td>').text(item.rank).appendTo($tr);
					$('<td></td>').text(item.movieNm).appendTo($tr);
					$('<td></td>').text(item.openDt).appendTo($tr);
					$('<td></td>').text(item.salesShare).appendTo($tr);
					
					$tr.appendTo($tbody);
					
				})
			},
			error:function(){
				alert('조회 도중 알수없는 오류가 발생하였습니다.');
				return;
			}
		})
	})
	// 오늘 자정의 시간을 getTime값으로 받아온다.
	function getTodayTime(){
		var day = new Date();
		var year = day.getFullYear();
		var month = day.getMonth();
		var day = day.getDate();
		
		var today = new Date(year, month, day);
		return today.getTime();
	}
	
	   // 선택한 날짜의 유닉스타임을 반환한다.
	   function getSearchTime(dateString) {
	      var date = new Date(dateString);
	      return date.getTime();
	   }
	   
	// 선택된 날짜가 오늘 이전인지 확인한다.
	function isBeforeToday(StringDate){
		return getTodayTime() > getSearchTime(StringDate);
	}
})
	
	// ajax를 사용해서 JSON 의 데이터를 영화진흥위원회 오픈 API 로 부터 받아온다.
	// 조회 버튼을 클릭하면 클릭한 날짜의 값을 기준으로 오픈API에서 검색하여 내려보낸다.
	// 먼저 검색한 날짜를 String으로 입력받고(yyyy-mm-dd), input에서 값을 받았으므로 .val()로 값을 변수에 저장한다.
	// 전달받은 값은 String이므로 Date로 변경하기 위해 밑에 새로운 함수를 생성한다(getSearchTime)
	// getTime()으로 유닉스 타임을 반환받고, 오늘 날짜도 새로운 함수를 생성해서 return 값으로 getTime으로 유닉스 타임을 반환받는다.
	// isBeforeToday라는 함수를 생성해서 두개의 유닉스 타임을 비교해서 선택한 날짜가 오늘 날짜 이전인지 비교한다.
	// 검색값이 비었으면 alert로 에러메세지를 내보내고 return으로 이벤트를 종료한다.
	// 검색값이 오늘 날짜이거나 오늘 날짜 이후일 경우에도 에러메세지를 내보내고 이벤트를 종료한다.
	// 이 두개가 모두 통과되었으면 replace로 yyyy-mm-dd 형식에서 -를 삭제해준다.(/-/g, '') //안에 있는 값을 g를 사용해 모두 빈 공간으로 변경한다 
	// yyyymmdd 값이 된 StringDate를 기준으로 조회하기 위한 상태로 변경되었다.
	// $.ajax({})를 사용해서 type:"GET", url:"오픈API주소",data:{key값,targetDt(진흥위원회조회조건):StringDate(입력받은값)},dateType:"json",success:function(성공시),error:(실패시) 를 생성한다.
	// 값을 모두 넣고 정상적으로 데이터를 내려 받았으면 success:function(값) 값 안에 데이터가 들어온다.
	// 받은 데이터를 봤을떄 영화 리스트는 boxOffice.boxOfficeResult.dailyBoxOfficeList 안에 있으므로 새로운 변수를 생성해서 내가 필요한 배열 값.boxOfficeResult.dailyBoxOfficeList의 데이터를 담는다.
	// 담은 데이터를 $.each(배열,function(index, 콜백값){ ... })을 사용하여 하나씩 순차적으로 데이터를 전달받는다.
	// 전달받은 콜백값에 하나씩 배열이 들어가있으므로 $tr 변수를 생성한다.이때 =$('<tr></tr>') 을 사용하여 제이쿼리 기능들을 사용할수 있게 만들어준다.
	// 그 이후 값이 들어갈 <td></td>공간도 $()로 감싸주어서 $('<td></td>').text(변경할 값).appendTo($tr)을 사용하여 변경과 동시에 $tr에 추가를 시켜준다.
	// 모든 값을 더한 이후 Table안에 있는 tbody를 설정하여 값을 넣어준다.

</script>
</body>
</html>