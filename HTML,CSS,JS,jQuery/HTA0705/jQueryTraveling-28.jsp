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
	<h1>형제 엘리먼트 찾아가기</h1>
	<div class="row">
		<div class="col">
			<div class="box-1">
				<h3>.prev()</h3>
					<ul class="list-group">
						<li class="list-group-item">item1</li>
						<li class="list-group-item">item2</li>
						<li class="list-group-item">item3</li>
						<li class="list-group-item">item4</li>
						<li class="list-group-item">item5</li>
						<li class="list-group-item">item6</li>
						<li class="list-group-item">item7</li>
					</ul>
			</div>
		</div>
		<div class="col">
			<div class="box-2">
				<h3>.prevAll()</h3>
					<ul class="list-group">
						<li class="list-group-item">item1</li>
						<li class="list-group-item">item2</li>
						<li class="list-group-item">item3</li>
						<li class="list-group-item">item4</li>
						<li class="list-group-item">item5</li>
						<li class="list-group-item">item6</li>
						<li class="list-group-item">item7</li>
					</ul>
			</div>
		</div>
		<div class="col">
			<div class="box-3">
				<h3>.next()</h3>
					<ul class="list-group">
						<li class="list-group-item">item1</li>
						<li class="list-group-item">item2</li>
						<li class="list-group-item">item3</li>
						<li class="list-group-item">item4</li>
						<li class="list-group-item">item5</li>
						<li class="list-group-item">item6</li>
						<li class="list-group-item">item7</li>
					</ul>
			</div>
		</div>
		<div class="col">
			<div class="box-4">
				<h3>.nextAll()</h3>
					<ul class="list-group">
						<li class="list-group-item">item1</li>
						<li class="list-group-item">item2</li>
						<li class="list-group-item">item3</li>
						<li class="list-group-item">item4</li>
						<li class="list-group-item">item5</li>
						<li class="list-group-item">item6</li>
						<li class="list-group-item">item7</li>
					</ul>
			</div>
		</div>
		<div class="col">
			<div class="box-5">
				<h3>.sibilngs()</h3>
					<ul class="list-group">
						<li class="list-group-item">item1</li>
						<li class="list-group-item">item2</li>
						<li class="list-group-item">item3</li>
						<li class="list-group-item">item4</li>
						<li class="list-group-item">item5</li>
						<li class="list-group-item">item6</li>
						<li class="list-group-item">item7</li>
					</ul>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	// .prev();
	$('.box-1 .list-group-item').click(function(){
		$(this).siblings().removeClass('active list-group-item-primary');
		$(this).addClass('active');
		$(this).prev().addClass('list-group-item-primary');
		
		})
	// .prevAll()
	$('.box-2 .list-group-item').click(function(){
		$(this).siblings().removeClass('active list-group-item-primary');
		$(this).addClass('active');
		$(this).prevAll().addClass('list-group-item-primary');
	})
	
	// .next()
	$('.box-3 .list-group-item').click(function(){
		$(this).siblings().removeClass('active list-group-item-primary');
		$(this).addClass('active');
		$(this).next().addClass('list-group-item-primary');
	})
	
	// .nextAll()
	$('.box-4 .list-group-item').click(function(){
		$(this).siblings().removeClass('active list-group-item-primary');		
		$(this).addClass('active');
		$(this).nextAll().addClass('list-group-item-primary');
	})

	// .siblings()
	$('.box-5 .list-group-item').click(function(){
		$(this).siblings().removeClass('active list-group-item-primary');
		$(this).addClass('active');
		$(this).siblings().addClass('list-group-item-primary');
	})
	})
	
	// .box 1~5 안에있는 .list-group-item 을 모두 선택한 후 click 이벤트를 주어 클릭하면 active 상태로 되고
	// prev(이전), prevAll(이전모두), next(다음), nextAll(다음모두),siblings(본인제외모두)를 primary상태로 변경한다.
	
</script>
</body>
</html>