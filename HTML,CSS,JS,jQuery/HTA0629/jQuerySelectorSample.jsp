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

<!-- 기본선택자
	*			$("*")			모든 엘리먼트 선택
	#id			$("#box")		id="box"인 엘리먼트 선택
	.class			$(".btn")		class="btn"인 모든 엘리먼트 선택
	tag			$("p")			모든 P 엘리먼트 선택
	tag,tag,tag		$('h1,h2,h3')		모든 h1, h2, h3 엘리먼트 선택	
!-->


<!-- 		
	필터선택자
	:first			$("p:first")		첫번째 P엘리먼트 선택
	:last			$("p:last")		마지막번째 P엘리먼트 선택
	:even			$("p:even")		짝수번째 P엘리먼트 선택
	:odd			$("p:odd")		홀수번째 P엘리먼트 선택
!-->


<!-- 
	자식, 자손, 형제 선택자
	parent > child 		$("div > p")		div의 자식 중에서 모든 P엘리먼트 선택
	parent descendant	$("div p")		div의 후손 중에서 모든 P엘리먼트 선택
	element + next		$("div + p")		div 바로 아랫동생 P엘리먼트 선택
	element ~ siblings	$("div ~ p")		div 동생들중에서 P엘리먼트 선택
!-->


<!-- 
	자식 필터선택자
	:first-child		$("p:first-child")	p엘리먼트 중에서 장남인 모든 P엘리먼트 선택
	:last-child		$("p:last-child")	p엘리먼트 중에서 막내자식인 모든 P엘리먼트 선택
	:nth-child(n)		$("p:nth-child(2)")	p엘리먼트 중에서 둘째 자식인 모든 P엘리먼트 선택
!-->


<!-- 
	순서 필터선택자
	:eq(index)		$("p:eq(0)")		p엘리먼트 중에서 0번째 P엘리먼트 선택
	:gt(index)		$("p:gt(2)")		p엘리먼트 중에서 2번째 다음의 모든 P엘리먼트 선택
	:lt(index)		$("p:lt(2)")		p엘리먼트 중에서 2번째 이전의 모든 P엘리먼트 선택
!-->


<!-- 
	기타 필터선택자
	:contains(text)		$("p:contains('안녕')")	p엘리먼트 중에서 '안녕'이라는 텍스트를 포함하고 있는 모든 P엘리먼트  선택
	:has(selector)		$("div:has(p)")		div엘리먼트 중에서 p엘리먼트 가지고 있는 모든 div엘리먼트를 선택
	:not(selector)		$("p:not(:last-child)")	p엘리먼트 중에서 막내가 아닌 모든 p엘리먼트를 선택
!-->


<!-- 
	속성 선택자
	[attr]			$('[src]')		src속성을 가지고 있는 모든 엘리먼트 선택
	[attr=value]		$('[type="date"]')	type속성값이 date인 모든 엘리먼트 선택
	[attr!=value]		$('[type!="hidden"]')	type속성값이 hidden이 아닌 모든 엘리먼트 선택
	[attr^=value]		$('[href^="http"]')	href속성값이 http로 시작하는 모든 엘리먼트 선택
	[attr$=value]		$('[href$=".pdf"]')	href속성값이 .pdf로 끝나는 모든 엘리먼트 선택
	[attr*=value]		$('[alt*="모자"]')	alt속성값에 '모자'가 포함되는 모든 엘리먼트 선택
	[attr~=value]		$('[alt~="모자"]')	alt속성값에 '모자'가 분리된 단어로 포함되어 있는 모든 엘리먼트 선택
!-->


<!--
	폼 선택자
	:input			$(":input")		모든 폼요소엘리먼트(input,select,textarea)를 선택
	:text			$(":text")		모든 <input type="text"> 엘리먼트 선택
	:password		$(":password")		모든 <input type="password"> 엘리먼트 선택
	:radio			$(":radio")		모든 <input type="radio"> 엘리먼트 선택
	:checkbox		$(":checkbox")		모든 <input type="checkbox"> 엘리먼트 선택
	:file			$(":file")		모든 <input type="file"> 엘리먼트 선택
	:submit			$(":submit")		모든 <input type="submit"> 엘리먼트 선택
	:reset			$(":reset")		모든 <input type="reset"> 엘리먼트 선택
	:selected		$(":selected")		select엘리먼트에서 선택된 option 엘리먼트를 선택
	:checked		$(":checked")		라디오버튼, 체크박스에 체크된 엘리먼트만 선택
	:enabled		$(":enable")		활성화된 모든 폼요소 엘리먼트 선택
	:disabled		$(":disable")		비활성화된 모든 폼요소 엘리먼트 선택
!-->


<!--
	기타 필터 선택자
	:animated		$(":animated")		현재 애니메이션효과가 실행중인 엘리먼트 선택	
	:focus			$(":focus")		현재 포커스를 가지고 있는 엘리먼트 선택
	:empty			$('p:empty')		p엘리먼트 중에서 컨텐츠를 가지고 있지 않는 p엘리먼트 선택
	:hidden			$(":hidden")		display:none 로 설정돼서 화면에 표시되지 않는 모든 엘리먼트 선택
	:visible		$(":visible")		현재 화면에 표시되고 있는 모든 엘리먼트 선택
-->

	<p>p1</p>
	<p>p2</p>
	<p>p3</p>
	<p>p4</p>
	<p>p5</p>
	<p>p6</p>
	<p>p7</p>
	<p>p8</p>
	<p>p9</p>
	<p>p10</p>
	
	

</div>

</body>
</html>