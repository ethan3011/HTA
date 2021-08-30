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
	<div class="row mt-3">
		<div class="col-12">
			<h3>파일 업로드 폼</h3>
			<!-- 
				- 첨부파일이 있는 경우에 method(요청방법)은 무조건 post여야함!!
				enctype
					- 폼 입력값을 서버로 전송할 때 사용되는 인코딩(변환)방식을 지정하는 속성이다.
					- 기본값은 "application/x-www-form-urlencoded"이다.
					
					- enctype="application/x-www-form-urlencoded"
						- 폼입력값을 name=value&name=value&name=value로 변환해서 전송한다.
						- name은 폼 입력요소의 name속성에 지정된 이름이다.
						- [변환예시]
						- title=휴가신청서&description=휴가신청시 다운받아서 작성하세요&upfile=신청서.hwp
						- 첨부파일이 없는 폼 입력값 제출에 사용된다.
						
					- enctype="multipart/form-data"
						- 첨부파일이 포함된 폼 입력값을 제출할 때 사용되는 인코딩 방식이다.
						- 요청메세지의 요청파라미터값을 request.getParameter(String name)로 조회할 수 없다.
						- 요청메세지의 요청파라미터값, 업로드되는 첨부파일 처리를 위한 추가 라이브러리가 필요함
							cos.jar, commons-fileupload.jar 등이 필요함
						- [변환예시]
		 					 ----WebKitFormBoundaryQtk5bV9PVWAMOkEI
		                     Content-Disposition: form-data; name="title"
		                     휴가신청서
		                     
		                     ----WebKitFormBoundaryQtk5bV9PVWAMOkEI
		                     Content-Disposition: form-data; name="description"
		                     휴가 신청시 작성해서 제출하세요
		                     
		                     ----WebKitFormBoundaryQtk5bV9PVWAMOkEI
		                     Content-Disposition: form-data; name="upfile"; filename="휴가신청서.hwp"
		                     Content-Type: application/x-hwp
		
		                     ----WebKitFormBoundaryQtk5bV9PVWAMOkEI
							
			-->
			<form method="post" action="/sam/up" enctype="multipart/form-data" class="p-3 border bg-light"> 
				<div class="form-group">
					<label>제목</label>
					<input type="text" class="form-control" name="title"/>
				</div>
				<div class="form-group">
					<label>설명</label>
					<textarea rows="3" class="form-control" name="description"></textarea>
				</div>
				<div class="form-group">
					<label>첨부파일</label>
					<input type="file" class="form-control" name="upfile">
				</div>
				<div class="text-right">
					<a href="../index.jsp" class="btn btn-secondary">취소</a>
					<button type="submit" class="btn btn-primary">전송</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>