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
	<h1>일반 텍스트를 응답데이터로 받는 ajax 처리</h1>
	
	<div class="row">
		<div class="col-2">
			<h3>장르</h3>
			<ul class="list-group">
				<li class="list-group-item">소설</li>
				<li class="list-group-item">기술</li>
				<li class="list-group-item">외국어</li>
			</ul>
		</div>
		<div class="col-8">
			<h3>장르별 베스트셀러</h3>
			<table class="table">
				<thead>
					<tr>
						<th>순위</th>
						<th>제목</th>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$('.list-group-item').click(function(){
		$('table tbody').empty();
		$(this).addClass('active').siblings().removeClass('active');
		var name = $(this).text();
		$.get('../ajax1',{genre:name},function(items){
			var item = items.split(',');
			
		$.each(item,function(index, el){
			var rows = "<tr>";
			rows += "<td>"+(index+1)+"</td>"
			rows += "<td>"+el+"</td>"
			rows += "</tr>"
			
			$(rows).appendTo('table tbody');
		})
		})
	})
})
// ajax 사용법 1
// SampleAjaxServlet1에1 genre라는 이름으로 this.text()인 name을 보내고 function(itmes)라는 값을 내려받는다.
// 값을 내려받은후 split을 통하여 ,로 구분자를 나눠서 배열에 각 요소로 저장해준다.
// $.each를 통해 배열을 돌리고 값을 담을 변수를 생성하여 각 요소들을 더해준다.(<"tr">,etc...)
// 값이 다 더해진 변수를 table tbody안에 appendTo로 넣어주거나 table tbody를 append하여 rows를 안에 넣어준다.

</script>

</body>
</html>