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
	// XML 이용
	$(function(){
		$('#btn-boxoffice-1').click(function(){
			
			var $tbody = $('#table-boxoffice tbody');
			var StringDate = $('#date-boxoffice-1').val();
			
			if(!StringDate){
				alert('날짜를 입력해 주세요');
				return;
			}
			if(!isBeforeToday(StringDate)){
				alert('오늘 날짜 이전으로 선택해 주십시오.');
				return;
			}
			
			StringDate = StringDate.replace(/-/g, '');
			
			$.ajax({
				type:"GET",
				url:"http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml",
				data:{key:"f5eef3421c602c6cb7ea224104795888",targetDt:StringDate},
				dateType:"xml",
				success:function(xmlDoc){
					$(xmlDoc).find('dailyBoxOffice').each(function(index, item){
						var rank = $(item).find('rank').text();
						var movieNm = $(item).find('movieNm').text();
						var openDt = $(item).find('openDt').text();
						var salesShare = $(item).find('salesShare').text();
						
						var $tr = $('<tr></tr>');
						$('<td></td>').text(rank).appendTo($tr);
						$('<td></td>').text(movieNm).appendTo($tr);
						$('<td></td>').text(openDt).appendTo($tr);
						$('<td></td>').text(salesShare).appendTo($tr);
						
						$tbody.append($tr);
					})
				},
				error:function(){
					alert('조회 도중 에러가 발생하였습니다.');
					return;
				}
			})
			function getTodayTime(){
				var day = new Date();
				var year = day.getFullYear();
				var month = day.getMonth();
				var date = day.getDate();
				var today = new Date(year,month,date);
				return today.getTime();
			}
			
			function searchedDateTime(StringDate){
				var searchTime = new Date(StringDate);
				return searchTime.getTime();
			}
			
			function isBeforeToday(StringDate){
				return getTodayTime() > searchedDateTime(StringDate);
			}
			
		})
	})
	//
	// ajax를 사용해서 XML 의 데이터를 영화진흥위원회 오픈 API 로 부터 받아온다.
	// 조회 버튼을 클릭하면 클릭한 날짜의 값을 기준으로 오픈API에서 검색하여 내려보낸다.
	// 먼저 검색한 날짜를 String으로 입력받고(yyyy-mm-dd), input에서 값을 받았으므로 .val()로 값을 변수에 저장한다.
	// 전달받은 값은 String이므로 Date로 변경하기 위해 밑에 새로운 함수를 생성한다(getSearchTime)
	// getTime()으로 유닉스 타임을 반환받고, 오늘 날짜도 새로운 함수를 생성해서 return 값으로 getTime으로 유닉스 타임을 반환받는다.
	// isBeforeToday라는 함수를 생성해서 두개의 유닉스 타임을 비교해서 선택한 날짜가 오늘 날짜 이전인지 비교한다.
	// 검색값이 비었으면 alert로 에러메세지를 내보내고 return으로 이벤트를 종료한다.
	// 검색값이 오늘 날짜이거나 오늘 날짜 이후일 경우에도 에러메세지를 내보내고 이벤트를 종료한다.
	// 이 두개가 모두 통과되었으면 replace로 yyyy-mm-dd 형식에서 -를 삭제해준다.(/-/g, '') //안에 있는 값을 g를 사용해 모두 빈 공간으로 변경한다 
	// yyyymmdd 값이 된 StringDate를 기준으로 조회하기 위한 상태로 변경되었다.
	// $.ajax({})를 사용해서 type:"GET", url:"오픈API주소",data:{key값,targetDt(진흥위원회조회조건):StringDate(입력받은값)},dateType:"xml",success:function(성공시),error:(실패시) 를 생성한다.
	// 값을 모두 넣고 정상적으로 데이터를 내려 받았으면 success:function(값) 값 안에 데이터가 들어온다.
	// 내려받은 데이터가 XMl이고 <> 태그 안에 포함되어 있기 때문에 find로 태그명을 검색해서 찾을수 있다.
	// $(xmlDoc).find('배열명').each(function(index, 각배열){}) 를 사용해서 배열을 하나씩 불러올 수 있다.
	// 불러온 배열을 각 변수를 생성해서 $(각배열).find(변수명)으로 원하는 데이터를 찾아서 저장해준다.
	// 저장된 데이터를 $('<tr></tr>'), $('<td></td').text(값).appendTo($tr) 에 담고 바로 저장해준다.
	// 저장이 끝나면 $tbody에 append한다.
	// JSON과 다른것은 JSON은 텍스트가 들어있어서 정확한 위치를 찾아서 새로운 변수에 담아서 이용해야 하지만 XML은 데이터가 아닌 태그형식으로 내려받기 때문에 find를 써서 바로 찾아서 이용할 수 있다.
	// json이 조금 더 익숙하지만 XML 이 불러올때 사용하기 조금 더 편한것 같다.
</script>

</body>
</html>