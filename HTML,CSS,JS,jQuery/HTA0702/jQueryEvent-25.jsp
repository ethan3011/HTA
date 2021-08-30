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
    <style type="text/css">
    	div {border: 1px solid black; padding: 15px; margin: 15px;}
    </style>
</head>
<body>

<div class="container">
	<h1>새로 추가된 엘리먼트에 대한 이벤트 처리하기</h1>
	
	<div id="box-1">
		<button id="btn-add-button">추가</button>
	</div>
	
	<div id="box-2">
		<button>버튼</button>
	</div>
</div>
 
<script type="text/javascript">
	// 추가 버튼을 클릭하면 버튼에 추가가 되도록 한다. (기능도 실행이 되게 해야함)
	$(function(){
		// 버튼의 id를 클릭하였을때 발생하는 이벤트를 생성한다.
		$('#btn-add-button').click(function(){
			// #box-2에 append뒤로 컨텐츠 뒤에 HTML 양식을 추가한다
			$('#box-2').append('<button class="ml-4">버튼</button>');
		})
		
		// #box-2안에 있는 on.click으로 button의 기능을 사용하게 할떄 사용하는 방법이다.
		// .on('이벤트명','대상자',기능(){})을 이용하면 추가된 버튼에도 해당 이벤트가 작동하게 한다.
		$('#box-2').on('click','button',function(){
			alert('버튼을 누르셨습니다.');
		})
	})
	
</script>
</body>
</html>