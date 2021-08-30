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
	<h1>onchange 이벤트</h1>
	
	<div class="box-1">
		<table class="table" id="table-cart-items">
			<thead>
				<tr>
					<th><input type="checkbox" id="checkbox-all-selected"/></th>
					<th>제품명</th>
					<th>가격</th>
					<th>구매수량</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr id="row-10001">
					<td><input type="checkbox" name="productNo" value="10001"/></td>
					<td>맥북 프로</td>
					<td>2,000,000 원</td>
					<td>1 개</td>
					<td>
						<a href="order?productNo=10001" class="btn btn-primary btn-sm">구매</a>
						<button class="btn btn-warning btn-sm" data-item-no="10001">삭제</button>
					</td>
				</tr>
				<tr id="row-20001">
					<td><input type="checkbox" name="productNo" value="20001"/></td>
					<td>아이팟</td>
					<td>400,000 원</td>
					<td>2 개</td>
					<td>
						<a href="order?productNo=20001" class="btn btn-primary btn-sm">구매</a>
						<button class="btn btn-warning btn-sm" data-item-no="20001">삭제</button>
					</td>
				</tr>
				<tr id="row-10033">
					<td><input type="checkbox" name="productNo" value="10033"/></td>
					<td>애플워치</td>
					<td>600,000 원</td>
					<td>2 개</td>
					<td>
						<a href="order?productNo=10033" class="btn btn-primary btn-sm">구매</a>
						<button class="btn btn-warning btn-sm" data-item-no="10033">삭제</button>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="mt-3">
			<button class="btn btn-secondary btn-sm" id="btn-remove-all-row">전체 삭제</button>
			<button class="btn btn-secondary btn-sm" id="btn-remove-checked-row">선택 삭제</button>
		</div>
	</div>
</div>
<script type="text/javascript">
	// 페이지 로딩시 장바구니 테이블의 모든 체크박스를 체크된 상태로 설정하기
	$(function(){
		$('#table-cart-items :checkbox').prop("checked",true);
		// table-cart-itmes 안에 있는것중 :checkbox 필터 선택자로 prop("checked",true) 로 모두 체크되게 바꾼다.
	})
	
	// 전체 삭제
	$('#btn-remove-all-row').click(function(){
		$('table tbody').remove();
		$('#checkbox-all-selected').prop("checked",false);
		// table 안의 tbody 안에 있는 모든 내용을 삭제한다.
		// 전체체크되있는것을 해제한다.
	})
	// 선택 삭제
	$('#btn-remove-checked-row').click(function(){
		$('#table-cart-items tbody tr:has(:checked)').remove();
		$('#checkbox-all-selected').prop('checked',false);
		// #table-cart-items 안에 있는 tobdy 안에 있는 tr에서 :checked필터로 검색됬을때 체크되있는것들을 remove로 삭제한다.
		// 전체체크되있는것을 해제한다.
	})
	
	// 전체 선택/해제 처리하기
	$('#checkbox-all-selected').change(function(){
		var isChecked = $(this).prop('checked');
		
	$('#table-cart-items tbody :checkbox').prop('checked',isChecked);
	// checkbox-all-selected에 change로 ischecked라는 변수를 선언하여 현재의 checked상태를 담는다.
	// 담은 ischecked값이 true,false로 저장되므로 저장된 값을 이용하여 table안의 tbody안에 있는 :checkbox 필터선택자로 모든 checkbox를 true,false로 변경한다.
	})
	
	
	// 아이템의 체크박스를 선택/해제할 때 전체 선택/해제 버튼에 반영하기
	$('#table-cart-items tbody :checkbox').change(function(){
		changeCheckbox();
		// 밑에서 만든 함수를 사용한다.(모든 체크박스가 선택되면 전체선택이 선택, 아닐시 해제)
	})
	
	// 삭제버튼 클릭시 해당 행을 삭제하기
	$('#table-cart-items tbody .btn-warning').click(function(){
		//방법1 : 선택된 버튼이 있는 곳의 data-item-no를 찾아서 #row+itemNo 로 해당 행을 삭제하기
		// var itemNo = $(this).data('item-no');
		// $('#row-'+itemNo).remove();
		
		//방법2 : 선택된 곳에서 그 행의 정보를 담고 있는 가장 가까운 tr을 삭제하기
		$(this).closest('tr').remove();
		changeCheckbox();
	})
	
	// 총 체크박스의 갯수와 체크된 체크박스의 갯수를 비교해서 전체 선택/해제 체크박스의 상태를 변경하는 함수
	function changeCheckbox(){
		
		var checkboxCount = $('#table-cart-items tbody :checkbox').length;
		
		if(checkboxCount == 0){
			$('#checkbox-all-selected').prop('checked',false);
			return;
		}
		
		var checkedCount = $('#table-cart-items tbody :checkbox:checked').length;
		
		if(checkboxCount != checkedCount){
			$('#checkbox-all-selected').prop('checked',false);
		}else{
			$('#checkbox-all-selected').prop('checked',true);
		}
		// table-cart-tiems tobdy 안에 있는 :checkbox의 총 갯수를 계산한다.
		// 만약 체크된 갯수가 0개이면 check-box-selected 를 선택되지 않게 한다.
		// 체크된것이 있으면 :checkbox:checked로 체크박스 안에 체크된 것의 총 갯수를 구한다.
		// 체크된것의 총 개수와 checkbox의 값이 같으면 전체체크, 아니면 전체체크가 해재되도록 한다.
	}
		
</script>
</body>
</html>