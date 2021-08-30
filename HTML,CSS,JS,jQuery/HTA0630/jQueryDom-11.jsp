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
	<h1>텍스트 컨텐츠, html 컨텐츠, 속성, 폼 요소의 값, 비활성화/일긱전용/체크상태 변경하기</h1>
	
	<div id="box-1">
		<p>텍스트</p>
		<p>텍스트</p>
	</div>
	<div id="box-2">
		이름 : <input type="text" name="username" /><br/>
		경력 : <select name="userskill">
				<option value="1">1년 이상</option>
				<option value="3">3년 이상</option>
				<option value="5">5년 이상</option>
				<option value="7">7년 이상</option>
			</select>
		메모 : <textarea rows="3" cols="60" name="usermemo"></textarea>
	</div>
	
	<div id="box-3">
		<img alt="아파트 사진" src="../images/1.JPG" id="image-box" height="200" width="150" >
	</div>
	
	<div id="box-4">
		<input type="text" name="empNo" /><br />
		<input type="checkbox" name="empSkill" value="java" />자바
		<input type="checkbox" name="empSkill" value="python" />파이썬
		<input type="checkbox" name="empSkill" value="db" />데이터베이스
	</div>
	
</div>
<script type="text/javascript">
	$('div').css({border: '1px solid black', padding:'10px', margin:'10px'})

	// box-1의 0번째 텍스트 컨텐츠를 변경하기
	$('#box-1 p:eq(0)').text('텍스트를 변경하즈아');
	
	// box-1의 html 방식으로 변경하기
	$('#box-1 p:eq(1)').html('<strong>html방식 변경하즈아</strong>');
	
	// box-2의 text를 김유신으로 변경하기
	$('#box-2 :text[name=username]').val('김유신');
	
	// box-2의 skill을 3으로 변경하기
	$('#box-2 select[name=userskill]').val('3');
	
	// box-2의 textarea를 '나는 나다'로 변경하기
	$('#box-2 textarea[name=usermemo]').val("나는 나다");
	var num = 1;
	setInterval(function(){
		$('#image-box').attr('src','../images/'+(num%3+1)+'.JPG');
		num++;
	}, 1500);
	 
	 // box-4의 입력폼들 전부 비활성화 시키기
	 $('#box-4 input[name=empNo]').prop('disabled',true);
	 $('#box-4 :checkbox[name=empSkill]:eq(0)').prop('disabled',true);
	 $('#box-4 :checkbox[name=empSkill]:eq(1)').prop('disabled',true);
	 $('#box-4 :checkbox[name=empSkill]:eq(2)').prop('disabled',true);
	 $('#box-4 :checkbox[name=empSkill]:eq(2)').prop('checked', true);
	
	
	
	/*
		// 선택하기
		var textContent = $(selector).text();
		var htmlContent = $(selector).html();
		var varlue = $(selector).val();
		var attrValue = $(selector).attr("attrName");
		var propValue = $(selector).prop.("propName");
		* 반환값이 문자열 혹은 boolean 값이다.
		* 조회기능은 반환값으로 텍스트를 반환하기 때문에 메소드 체이닝을 이어갈 수 없다.
		
		// 변경하기
		$(selector).text("textcontent")
		$(selector).html("htmlContent")
		$(selector).val("value")
		$(selector).attr("attrName","attrValue")
		$(selector).prop("propName",propValue);
		* 이 메소드들의 반환값으로 $(selector)로 검색된 jQuery 집합객체를 그대로 다시 반환한다.
		* 이 메소드들은 메소드체이닝을 이어갈 수 있다.
	*/

</script>
</body>
</html>