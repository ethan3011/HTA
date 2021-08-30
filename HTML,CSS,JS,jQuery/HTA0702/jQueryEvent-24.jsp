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
	<h1>hover(onmouseenter와 onmouseleave) 이벤트 처리</h1>
	
	<div class="row">
		<div class="col-7">
			<div class="row" id="img-items">
				<div class="col">
					<img alt="사진1" src="../images/1.JPG" class="img-thumbnail">
				</div>
				<div class="col">
					<img alt="사진2" src="../images/2.JPG" class="img-thumbnail">
				</div>
				<div class="col">
					<img alt="사진3" src="../images/3.JPG" class="img-thumbnail">
				</div>
			</div>
		</div>
		<div class="col-5">
			<div>
				<img alt="사진2" src="../images/2.JPG" class="img-thumbnail" id="img-box">
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	// 사진 1,2,3 을 클릭하면 col-5안에 있는 사진이 흐릿하게 변경되고 마우스가 다시 밖에 나가면 원래대로 돌아가게 하기
	$(function(){
		// 기존에 있는 이미지를 opacity로 투명도로 0.4를 선택한다.
		$('#img-box').css('opacity','0.4');
		// img-items 안에 있는 img 들을 hover(onmouseenter,onmouseleave)시키는 함수를 생성한다.
		$('#img-items img').hover(function(){
			// 내가 마우스를 올린 곳에 src라는 속성으로 저장된 이미지를 imagePath 변수에 저장한다.
			var imagePath = $(this).attr('src');
			// img-box에 들어있는 src 속성을 imagePath에서 저장한 src 속성으로 변경하고 css로 opacity 투명도를 1.0(100%)로 다시 설정한다.
			$('#img-box').attr('src',imagePath).css('opacity','1.0');
			// onmouseleave를 하게 될 경우 실행되는 이벤트이다.
		},function(){
			// 다시 해당 사진이 0.4의 투명도로 설정된다(40%)
			$('#img-box').css('opacity','0.4');
		})
	})
</script>

</body>
</html>