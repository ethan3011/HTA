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
	<h1>클래스 조작하기</h1>
		<div id="box-1">
			<button id="btn-1" class="btn btn-primary ">버튼</button>
			<button id="btn-2" class="btn btn-primary disabled ">버튼</button>
		</div>
</div>
<script type="text/javascript">
	// button 0번째 btn-danger를 추가하고 btn-primary를 삭제하기
	$('button:eq(0)').removeClass('btn-primary').addClass('btn-danger');
	
	// button 1째를 toggleClass로 disabled 시키고 존재하는지 console.log로 확인해보기
	$('button:eq(1)').toggleClass('disabled')
	var isDisabled = $('button:eq(1)').hasClass('disabled');
	console.log('isDisabled은 disabled를 가지고 있는가?', isDisabled)
	
	// button 1째를 disabled 다시한번 시키고 disabled이 존재하는지 console.log로 확인해보기
	$('button:eq(1)').toggleClass('disabled');
	var isDisabled2 = $('button:eq(1)').hasClass('disabled');
	console.log('isDisabled2는 disabled를 가지고 있는가?', isDisabled2)
	
	// toggleClass(값)은 '값'에 적힌게 존재하면 없애버리고,
	// 값이 없으면 새롭게 추가가된다. 즉 반대로 상태를 바꿔버린다

</script>
</body>
</html>	