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
	<h1>필터링 하기</h1>
	<div class="row">
		<div class="col">
			<div class="box-1">
				<div class="mb-3"><button class="btn btn-primary">.first()</button></div>
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
				<div class="mb-3"><button class="btn btn-primary">.last()</button></div>
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
				<div class="mb-3"><button class="btn btn-primary">.eq()</button></div>
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
				<div class="mb-3"><button class="btn btn-primary">.has()</button></div>
					<ul class="list-group">
						<li class="list-group-item">item1</li>
						<li class="list-group-item">item2</li>
						<li class="list-group-item">item3</li>
						<li class="list-group-item"><a>item4a있음</a></li>
						<li class="list-group-item">item5</li>
						<li class="list-group-item">item6</li>
						<li class="list-group-item">item7</li>
					</ul>
			</div>
		</div>
		<div class="col">
			<div class="box-5">
				<div class="mb-3"><button class="btn btn-primary">.not()</button></div>
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
			<div class="box-6">
				<div class="mb-3"><button class="btn btn-primary">.filter()</button></div>
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
	
	// .first()
	$('.box-1 .btn').click(function(){
		$(this).closest('.box-1').find('.list-group-item').first().addClass('list-group-item-primary');
	})
	
	// .last()
	$('.box-2 .btn').click(function(){
		$(this).closest('.box-2').find('.list-group-item').last().addClass('list-group-item-primary');
	})

	// .eq(index)
	$('.box-3 .btn').click(function(){
		$(this).closest('.box-3').find('.list-group-item').eq(3).addClass('list-group-item-primary');
	})

	// .has(selector)
	$('.box-4 .btn').click(function(){
		$(this).closest('.box-4').find('.list-group-item').has('a').addClass('list-group-item-primary');
	})

	// .not(selector)
	$('.box-5 .btn').click(function(){
		$(this).closest('.box-5').find('.list-group-item').not(':first-child').addClass('list-group-item-primary');
	})

	// filter(selector)
	$('.box-6 .btn').click(function(){
		$(this).closest('.box-6').find('.list-group-item').filter(function(index, el){
			var check = $(el).text();
			return check == 'item6';
		}).addClass('list-group-item-primary');
	})
})

	// .box-1 의 클래스에서 .btn 클래스를 클릭하면 클릭한곳(this)에서 가장 가까운 .box-1을 찾아서 그 안을 탐색하여(find) .list-group-item을 모두 찾아내고
	// list-group-item중의 first(), last(), eq(), has(), not(), filter() 를 사용하여 해당되는 list-group-item에 addClass('list-group-item-primary')
	// 를 각 추가해준다.

</script>
</body>
</html>