<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTA 0520 Review</title>
</head>
<body>

	<h1>POST 방식으로 요청파라미터값 보내기</h1>
	
	<h3>회원가입 정보를 demo4-1.jsp로 제출하기</h3>
	<!--  form태그 : 이름, 아이디, 비밀번호, 성별, 보유기술, 근무경력, 제출 -->
	<form method="post"  action="demo4-1.jsp">
	이름<br />
	<input type="text" name="username" /><br />
	아이디<br />
	<input type="text" name="userid" /><br />
	비밀번호<br />
	<input type="password" name="userpwd" /><br />
	성별<br />
	<input type="radio" name="gender" value="male">남성
	<input type="radio" name="gender" value="female" checked>여성<br />
	보유기술 <br />
	<input type="checkbox" name="skill" value="java" />Java
	<input type="checkbox" name="skill" value="db" />DataBase
	<input type="checkbox" name="skill" value="HTML" />HTML 
	<input type="checkbox" name="skill" value="Big" />Big data
	<input type="checkbox" name="skill" value="AI" /> AI <br />
	근무경력 <br />
	<select name="workyears">
		<option value=""> --- 선택하세요 --- </option>
		<option value="1"> 1년 이하 </option>
		<option value="3"> 3년 이하 </option>
		<option value="5"> 5년 이하 </option>
		<option value="7"> 7년 이하 </option>
	</select><br/>
	<button type="submit">제출</button>
	</form>
	<p><a href="main.jsp">메인페이지로 돌아가기</a></p>

</body>
</html>