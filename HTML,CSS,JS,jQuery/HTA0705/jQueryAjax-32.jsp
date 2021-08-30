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
	<h1>json 형식의 응답데이터 다루기</h1>
	
	<div class="row">
		<div class="col-4">
			<h3>베스트셀러</h3>
			<ul class="list-group" id="bestseller-list">
			
			</ul>
		</div>
		<div class="col-8">
			<h3>책 상세정보</h3>
			<table class="table table-bordered">
				<colgroup>
					 <col width="15%">
					 <col width="35%">
					 <col width="15%">
					 <col width="35%">
				</colgroup>
				<tbody>
					<tr>
						<th>번호</th>
						<td id="no-cell"></td>
						<th>가격</th>
						<td id="price-cell"></td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3" id="title-cell"></td>
					</tr>
					<tr>
						<td>저자</td>
						<td id="writer-cell"></td>
						<th>출판사</th>
						<td id="publisher-cell"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function(){
	
	$.get('../ajax2', function(value){
		var $ul = $('#bestseller-list');
		
		$.each(value, function(index, book){
			var $li = $("<li></li>");
				$li.addClass('list-group-item');
				$li.attr('data-book-no',book.no);
				$li.text(book.title);
				
				$ul.append($li);
		})
	})
	// ajax 방법2
	// 먼저 모든 책정보를 내려보낸 ajax2에서 값을 내려받는다.
	// 내려받은 값을 담을 $ul 변수에 저장한다.(ul)
	// 내려받은 값이 배열이므로 $.each(내려받은값, function(index,book)) 으로 값을 한바퀴씩 돌린다.
	// 저장할 변수(var $li)를 생성한후 값을 담는다.
	// 이전과 다르게 첫번째 변수에 $('<li></li>')를 담는다.
	// $()로 값이 담겼기 때문에 addClass로 class를 추가한다.
	// 각 데이터마다 고유한 값을 주기 위하여 data-???를 사용하여 책 번호를 attr로 속성에 넣는다.
	// text()안에 내려받은값중 책의 이름을 넣는다.
	// 이전에 만들어둔 데이터를 넣을 $ul에 값이 한줄씩 담긴 $li를 전달한다.
	
		$('#bestseller-list').on('click','.list-group-item', function(){
			$(this).addClass('active').siblings().removeClass('active');
			
			var bookNo = $(this).data('book-no');
			$.ajax({
				// 값을 servlet으로 보내는곳
				type : "GET",
				url : "../ajax3",
				data : {no:bookNo},
				dataType : "json",
				// 값을 servelt에서 받아오는곳
				success : function(data){
					$('#no-cell').text(data.no);
					$('#price-cell').text(data.price);
					$('#title-cell').text(data.title);
					$('#writer-cell').text(data.writer);
					$('#publisher-cell').text(data.publisher);
				},
				error : function(){
					alert('에러가 발생하였습니다.')
				}
			})
		})
		
	// ajax방법2에서 사용된 li는 미리 생성되있는게 아닌, 신규로 생성된 것이므로 $().click(function)을 사용할수 없다.
	// 그러므로 $(선택자).on('click','선택자 안의 선택',function(){})을 사용해서 .click 대신 사용할 수 있다.
	// 내가 클릭한곳에 active를 주기 위해 $(this).addClass('active')를 하고 나를 제외한 나머지 형제들을(siblings)
	// .remove('active')시킨다.
	// $.get()과는 다르게 $.ajax({}) 방식을 사용해서 이용한다.
	// $.ajax({type:"타입", url:"servlet받는값", data:{파라미터명:데이터값},dataType:데이터종류(ex)json),
	// success : function(성공되면전달될값){성공되면 실행하는곳},error:function(실패되면전달될값){실패되면실행하는곳}})
	// 을 이용하여 상황에 대비한 값을 입력해준다.
	// success: function(성공되면값(배열)등이 전달된다.) 
	// 위 값에 저장된 값을 각 넣을곳  $(아이디).text(function매개변수.이름)으로 모두 설정할 수 있다.
})
</script>
</body>
</html>