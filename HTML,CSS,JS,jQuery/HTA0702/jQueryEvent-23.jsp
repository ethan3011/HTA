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
	<h1>onscroll 이벤트 처리</h1>
		
	<div class="row">
		<div class="col-6 offset-3">
			<div class="row mt-3" id="box-images">
				<div class="col-4 p-2">
					<img src="../images/1.JPG" class="img-thumbnail" alt="사진" style="width: 500px; height: 500px;"/>
				</div>
				<div class="col-4 p-2">
					<img src="../images/2.JPG" class="img-thumbnail" alt="사진" style="width: 500px; height: 500px;"/>
				</div>
				<div class="col-4 p-2">
					<img src="../images/3.JPG" class="img-thumbnail" alt="사진" style="width: 500px; height: 500px;"/>
				</div>
				<div class="col-4 p-2">
					<img src="../images/1.JPG" class="img-thumbnail" alt="사진" style="width: 500px; height: 500px;"/>
				</div>
				<div class="col-4 p-2">
					<img src="../images/2.JPG" class="img-thumbnail" alt="사진" style="width: 500px; height: 500px;"/>
				</div>
				<div class="col-4 p-2">
					<img src="../images/3.JPG" class="img-thumbnail" alt="사진" style="width: 500px; height: 500px;"/>
				</div>
				<div class="col-4 p-2">
					<img src="../images/1.JPG" class="img-thumbnail" alt="사진" style="width: 500px; height: 500px;"/>
				</div>
				<div class="col-4 p-2">
					<img src="../images/2.JPG" class="img-thumbnail" alt="사진" style="width: 500px; height: 500px;"/>
				</div>
				<div class="col-4 p-2">
					<img src="../images/3.JPG" class="img-thumbnail" alt="사진" style="width: 500px; height: 500px;"/>
				</div>
			</div>
		</div>
	</div>
	
</div>
<script type="text/javascript">
$(function(){
	//	파일이름이 담긴 배열을 생성하고 파일 이름을 넣는다.
	var imageFilenames = ['../images/1.JPG','../images/2.JPG','../images/3.JPG'];
	// 내가 보는 브라우저의 최대 높이를 확인할때 사용한다.
	var windowHeight = $(window).height();
	
	// 윈도우의 스크롤창이 움직이면 발생하는 이벤트이다.
	$(window).scroll(function(){
		// 전체 콘텐츠의 높이를 확인한다.
		var documentHeight = $(document).height();
		// 스크롤이 움직였을때 0번부터 움직인 높이를 확인한다.
		var scrollTop = $(window).scrollTop();
		
		// 내가 보는 브라우저의 높이 + 스크롤이 움직인 길이 + 100 이 총 컨텐츠의 길이보다 크게 될 경우에는
		if(windowHeight + scrollTop + 100 >= documentHeight){
			// 랜덤 이미지를 images 변수에 저장한다.
			var images = randomImages();
			// $.each 기능으로 이미지,function(0번부터시작하는index, 파일이름)
			$.each(images, function(index,imageName){
			// 	createNewImages(imageName)을 appnedTo #box-images에 추가한다.
				$(createNewImages(imageName)).appendTo('#box-images')
			});
		}
	});
	
	// 새로운 이미지를 추가할때 사용되는 함수이다.
	function createNewImages(imageName){
		var content = 	'<div class="col-4 p-2">';
			content +=	'<img src="'+imageName+'" class="img-thumbnail" alt="사진" style="width: 500px; height: 500px;"/>';
			content +=	'</div>';
		return content;
	}
	
	// 랜덤으로 이미지의 이름을 가져오는 함수이다.
	function randomImages(){
		// 빈 배열을 생성한다.
		var images =[];
		// 최대 가져올 갯수를 정한다.
		var maxCount = 6;
		
		for(var i=0; i<maxCount; i++){
			// Math.radnom()X10으로 랜덤의 숫자를 받아오고, Math.trunc로 소수점 뒷자리를 자른다.
			// 그이후 %3으로 최대 9.미만의 값을 받기 때문에 3의 나머지를 구하면 0,1,2가 된다.
			var index = Math.trunc(Math.random()*10)%3;
			// images배열에 imagesFilenames[0,1,2]를 추가한다.
			images.push(imageFilenames[index]);
		}
		// 6개가 저장된 배열을 리턴한다.
		return images;
	}
})
</script>

</body>
</html>