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
	<h1>HTML DOM 조작하기</h1>
	<p>텍스트 컨텐츠, HTML 컨텐츠, 폼의 입력값, 엘리먼트의 프로퍼티 값 조회하기
	
	<div id="box-1">
		<h3>.text(), .html()로 텍스트 컨텐츠, html 컨텐츠 조회하기</h3>
		<p>jQuery 연습하기</p>
		<p><strong>jQuery</strong>연습하기</p>
	</div>
	
	<div id="box-2">
		<h3>폼 입력요소의 값 조회하기</h3>
		<form>
		이름 : <input type="text" name="username" id="user-name" /> <br />
		비번 : <input type="password" name="userpwd" id="user-pwd" /> <br />
		성별 : <input type="radio" name="usergender" id="user-gender-female" value="여자" checked>여성
		      <input type="radio" name="usergender" id="user-gender-male" value="남자"/>남성 <br />
		기술 : <input type="checkbox" name="userskill" id="user-skill-1" value="java"/>자바
			  <input type="checkbox" name="userskill" id="user-skill-2" value="db" checked/>데이터베이스
		      <input type="checkbox" name="userskill" id="user-skill-3" value="python" />파이썬<br />
	    경력 : <select name="carrer" id="user-carrer">
	    		<option value="1">1년이상</option>
	    		<option value="3">3년이상</option>
	    		<option value="5" selected>5년이상</option>
	    		<option value="7">7년이상</option>
	    	</select><br />
		메모 : <textarea name="usermemo" id="user-memo">나는 나다</textarea>
		</form>
	</div>
	<div class="box-3">
		<div class="row">
			<div class="col-3">
				<img src="../images/1.JPG" class="img-thumbnail" id="image-gallary" alt="아파트 사진">
				<h3>속성값 조회하기</h3>
			</div>
		</div>
	</div>
	
	<div class="box-4">
		<h3>비활성화 여부/ 읽기전용/ 체크여부 조회하기</h3>
		<input type="text" id="form-element-1" disabled readonly>
		<input type="text" id="form-element-2" disabled>
		<input type="text" id="form-element-3" readonly>
		<input type="checkbox" id="form-element-4" checked>
		<input type="checkbox" id="form-element-5">
		<button type="button" id="form-element-6" disabled>버튼</button>
		<button type="button" id="form-element-7">버튼</button>
	</div>
</div>

<script type="text/javascript">

	$('div').css({border:'1px solid black', padding: '10px', margin: '10px'})
	
	// box-1의 p엘리먼트의 텍스트 컨텐츠 읽어오기
	var textContent1 = $('#box-1 p:eq(0)').text();
	var textContent2 = $('#box-1 p:eq(1)').text();
	console.log("textContent1", textContent1);
	console.log("textContent2", textContent2);
	
	// box-1의 p엘리먼트 html 컨텐츠 읽어오기
	var HtmlContent1 = $('#box-1 p:eq(0)').html();
	var HtmlContent2 = $('#box-1 p:eq(1)').html();
	console.log("HtmlContent1", HtmlContent1);
	console.log("HtmlContent2", HtmlContent2);
	
	////////////////////////////////////////////////////////////////////////////
	// 폼 입력값 조회하기
	
	// 입력필드의 값 조회하기(input type="text")
	var name = $('#user-name').val();
	// 비밀번호 필드의 값 조회(input type="password")
	var pwd = $('#user-pwd').val();
	// 경력 조회하기(select)
	var carrer = $('#user-carrer').val();
	// 메모조회하기(textarea)
	var memo = $('#user-memo').val();
	// 체크된 성별의 값 조회하기(radio)
	var gender = $(':radio[name=usergender]:checked').val();
	// 체크된 기술의 값 조회하기(checkbox) <-- 본 예제에서는 1가지만 체크하는 것으로 가정함
	var skill = $(':checkbox[name=userskill]:checked').val();
	
 	console.log("이름",name);
	console.log("비번",pwd);
	console.log("성별",gender);
	console.log("기술",skill)
	console.log("경력",carrer);
	console.log("메모",memo);
	console.log("사진",imageSrc) 
	
	////////////////////////////////////////////////////////////////////////////
	// 속성값 조회하기
	var imageSrc = $('#image-gallary').attr('src');
	var imageClass = $('#image-gallary').attr('class');
	var imageAlt = $('#image-gallary').attr('alt');
	var imageId = $('#image-gallary').attr('id');
	console.log("imageSrc", imageSrc);
	console.log("imageClass", imageClass);
	console.log("imageAlt", imageAlt);
	console.log("imageId", imageId);
	////////////////////////////////////////////////////////////////////////////
	
	// 비활성화 여부 조회하기
	var isDisabled1 = $('#form-element-1').prop('disabled');
	var isDisabled2 = $('#form-element-2').prop('disabled');
	var isDisabled3 = $('#form-element-3').prop('disabled');
	var isDisabled4 = $('#form-element-4').prop('disabled');
	var isDisabled5 = $('#form-element-5').prop('disabled');
	var isDisabled6 = $('#form-element-6').prop('disabled');
	var isDisabled7 = $('#form-element-7').prop('disabled');
	console.log("isDisabled1",isDisabled1);
	console.log("isDisabled2",isDisabled2);
	console.log("isDisabled3",isDisabled3);
	console.log("isDisabled4",isDisabled4);
	console.log("isDisabled5",isDisabled5);
	console.log("isDisabled6",isDisabled6);
	console.log("isDisabled7",isDisabled7);
	
	//읽기전용 여부
	var isReadOnly1 = $('#form-element-1').prop('readOnly');
	var isReadOnly2 = $('#form-element-2').prop('readOnly');
	var isReadOnly3 = $('#form-element-3').prop('readOnly');
	var isReadOnly4 = $('#form-element-4').prop('readOnly');
	var isReadOnly5 = $('#form-element-5').prop('readOnly');
	var isReadOnly6 = $('#form-element-6').prop('readOnly');
	var isReadOnly7 = $('#form-element-7').prop('readOnly');
	console.log("isReadOnly1",isReadOnly1);
	console.log("isReadOnly2",isReadOnly2);
	console.log("isReadOnly3",isReadOnly3);
	console.log("isReadOnly4",isReadOnly4);
	console.log("isReadOnly5",isReadOnly5);
	console.log("isReadOnly6",isReadOnly6);
	console.log("isReadOnly7",isReadOnly7);
	
	//체크 여부
	var isChecked1 = $('#form-element-1').prop('checked');
	var isChecked2 = $('#form-element-2').prop('checked');
	var isChecked3 = $('#form-element-3').prop('checked');
	var isChecked4 = $('#form-element-4').prop('checked');
	var isChecked5 = $('#form-element-5').prop('checked');
	var isChecked6 = $('#form-element-6').prop('checked');
	var isChecked7 = $('#form-element-7').prop('checked');
	console.log("isChecked1",isChecked1);
	console.log("isChecked2",isChecked2);
	console.log("isChecked3",isChecked3);
	console.log("isChecked4",isChecked4);
	console.log("isChecked5",isChecked5);
	console.log("isChecked6",isChecked6);
	console.log("isChecked7",isChecked7);	
</script>

</body>
</html>