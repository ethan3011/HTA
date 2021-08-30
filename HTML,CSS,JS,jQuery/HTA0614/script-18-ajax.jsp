<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<div class="row my-2">
		<div class="col-12">
			<h3 class="p-2 border bg-light">부서별 사원조회</h3>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-3">
			<div class="card">
				<div class="card-header">부서목록</div>
				<div class="card-body">
					<ul class="list-group">
					<c:forEach var="dept" items="${departments }">
						<li class="list-group-item" onclick="getEmployees('${dept.id}')">${dept.name }</li>
					</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-9">
			<div class="card">
				<div class="card-header">사원목록</div>
				<div class="card-body">
					<table class="table" id="employees-table">
						<colgroup>
							<col width="14%">
							<col width="14%">
							<col width="14%">
							<col width="14%">
							<col width="14%">
							<col width="14%">
							<col width="14%">
						</colgroup>
						<thead>
							<tr>
								<th>id</th>
								<th>name</th>
								<th>phone</th>
								<th>email</th>
								<th>job</th>
								<th>salary</th>
								<th>commission</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	// 부서명을 클릭했을 때 실행되는 함수
	function getEmployees(deptId){
		// 조회된 사원정보가 추가될 tbody 엘리먼트 획득하기
		var tbodyEl = document.querySelector("#employees-table tbody");
		tbodyEl.innderHTML = "";
		
		// XMLHttpRequest 객체 생성
		var xhr = new XMLHttpRequest();
		
		// XMLHttpRequest객체에서 onreadystatechange 이벤트 발생시 실행할 콜백함수 등록
		xhr.onreadystatechange = function(){
			// 서버로부터 성공적인 응답을 받았을 때만 응답데이터를 처리하는 수행문이 실행되게 함
			if(xhr.readyState == 4 && xhr.status == 200){
				// 서버가 보낸 응답데이터(json표기법으로 작성된 텍스트데이터) 획득하기
				var jsonTextData = xhr.responseText;
				// jsone 표기법으로 작성된 텍스트를 자바스크립트 배열로 변경하기
				// (응답데이터가 json 배열표기법으로 작성되어 있기 때문에 자바스크립트 배열로 변환됨)
				var employees = JSON.parse(jsonTextData);
				// 배열의 처음부터 끝까지 반복하면서 사원정보로 <tr/>,<td>태그를 생성하기
				var rows = "";
				for(var i=0; i<employees.length; i++){
					var emp = employees[i]
					
					rows += "<tr>";
					rows += "<td>"+emp.id+"</td>"
					rows += "<td>"+emp.firstName+"</td>"
					rows += "<td>"+emp.phone+"</td>"
					rows += "<td>"+emp.email+"</td>"
					rows += "<td>"+emp.jobId+"</td>"
					rows += "<td>"+emp.salary+"</td>"
					rows += "<td>"+emp.commissionPct+"</td>"
					rows += "</tr>";
				}
				// <tbody> 엘리먼트에 <tr>,<td>태그로 구성된 HTMl 컨텐츠를 추가하기  
				tbodyEl.innerHTML = rows;
			}
		}
		// XMLHttpRequest 객체 초기화
		xhr.open("GET", "employees?id=" + deptId);
		// 서버로 HTTP요청 보내기
		xhr.send();
	}
</script>
</body>
</html>