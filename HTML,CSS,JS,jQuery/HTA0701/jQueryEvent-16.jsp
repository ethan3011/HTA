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
	<h1>이벤트처리</h1>
	
	<div>
		<input type="number" value="1" class="w-50"><button class="btn btn-outline-primary">버튼1</button>
		<input type="number" value="2" class="w-50"><button class="btn btn-outline-primary">버튼2</button>
		<input type="number" value="3" class="w-50"><button class="btn btn-outline-primary">버튼3</button>
		<input type="number" value="4" class="w-50"><button class="btn btn-outline-primary">버튼4</button>
	</div>

</div>
<script type="text/javascript">

	//button 을 클릭하였을때 글자색을 red로 변경하고 상태를 dsiabled로 하고 값을 input의 값을10000 으로 변경시키시오
	$(function(){
		$('button').click(function(){
			$(this).css('color','red');
			$(this).prop('disabled', true).prev().val(10000);
		})
	})
	// button을 클릭하면 실행하게 되기 위해어 $('button').on('click', function(){  ...  })을 사용하였다
	// this는 이벤트를 발생시킨 객체가 담긴다.
	// this를 $()로 감싸게 되면 제이쿼리의 여러가지 기능들을 사용할 수 있다.
	// prev()는 바로 윗 형을 뜻한다. // next()는 바로 아래 동생
	// preveAll()은 위 모든 형들	// nextAll()는 아래 모든 동생들
	// $(function(){ ... }) 를 사용하면 페이지를 로딩할때 같이 실행된다.	

</script>

</body>
</html>