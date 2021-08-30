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
    	div {border: 1px solid black; margin: 15px; padding 15px;}
    </style>
</head>
<body>

<div class="container">
	<h1>onchange 이벤트</h1>
	
	<div id="box-1">
		<form>
			<div class="form-group">
				<label>경력사항</label>
				<select class="form-control" name="carrer" id="combobox-carrer">
					<option value="" selected disabled>선택하세요.</option>
					<option value="N">신입</option>
					<option value="Y">경력직</option>
				</select>
			</div>
			<div class="form-group" id="box-worked">
				<label>경력사항</label>
				<input type="text" class="form-control" name="worked" />
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	// 경력사항을 Y를 하였을때만 아래 경력사항 칸을 표시하기
	$(function(){
		$('#box-worked').hide();
		
		$('#combobox-carrer').change(function(){
			var condition = $(this).val();
			console.log("condition", condition);			
			
			if(condition == 'Y'){
				$("#box-worked").show();
			}
			if(condition == 'N'){
				$('#box-worked').hide();
			}
		})
	})
	
	// onchange의 값을 읽어 오기 위해서 $(this).val()을 사용한다.
	// 그 값을 변수에 저장하여 if문으로 비교를 하여 #id 선택자로 show와 hide를 결정한다.
	

</script>
</body>
</html>