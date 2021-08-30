<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>자바스크립트 이벤트 연습</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
	<div class="row">
		<div class="col-12">
			<form id="register-form" action="register" method="post" class="border p-3 bg-light">
				<div class="form-group">
					<label>아이디</label>
					<input type="text" class="form-control" id="user-id" name="userId" />
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input type="password" class="form-control" id="user-pwd" name="userPwd" />
				</div>
				<div class="form-group">
					<label>비밀번호 확인</label>
					<input type="password" class="form-control" id="user-pwd-confirm" name="userPwdConfirm" />
				</div>
				<div class="form-group">
					<label>경력사항</label>
					<select name="carrer" class="form-control">
						<option value="">선택하세요</option>
						<option value="1">1년 이상</option>
						<option value="3">3년 이상</option>
						<option value="5">5년 이상</option>
						<option value="7">7년 이상</option>
					</select>
				</div>
				<div class="form-group">
					<label>보유기술(중복선택 가능)</label>
					<div class="form-group form-check">
						<div class="form-check form-check-inline">
							<input type="checkbox" class="form-check-input" id="skill-1" name="skill" value="java" />
							<label class="form-check-label">자바</label>
						</div>
						<div class="form-check form-check-inline">
							<input type="checkbox" class="form-check-input" id="skill-1" name="skill" value="db" />
							<label class="form-check-label">데이터베이스</label>
						</div>
						<div class="form-check form-check-inline">
							<input type="checkbox" class="form-check-input" id="skill-1" name="skill" value="python" />
							<label class="form-check-label">파이썬</label>
						</div>
						<div class="form-check form-check-inline">
							<input type="checkbox" class="form-check-input" id="skill-1" name="skill" value="spring" />
							<label class="form-check-label">전자정부표준프레임</label>
						</div>						
					</div>
					<div class="form-group">
						<label>기타사항</label>
						<textarea rows="5" class="form-control" name="etc" id="etc" ></textarea>
					</div>
					<div class="form-group form-check">
						<input type="checkbox" id="check-me" class="form-check-input" />
						<label class="form-check-label">개인정보 제공 여부</label>
					</div>
					<div class="text-right">
						<button type="button" class="btn btn-primary" onclick="checkForm()">등록</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">

	function checkForm() {													// 등록 버튼에 클릭하면 해당 이벤트를 실행하도록 한다.
	var userIdEl = document.querySelector("#user-id");						// document.getElementById로 user-id에 입력된 값을 가져온다.
	if(!userIdEl.value.trim()){												// 아이디 값이 비어있다면(trim으로 공백제외) 아래의 함수를 실행한다.
		alert("아이디는 필수입력값 입니다.");										// 아이디는 필수입력값이라는 메세지를 표시한다.
		userIdEl.focus();													// 빈 아이디가 있는 곳으로 focus()를 통해 이동시킨다.
		return;																	// 해당 함수를 멈추게한다.(return이 없을 경우 밑에 나머지가 실행된다.)
	}
	
	if(userIdEl.value.trim().length < 4){									// 검색된 아이디로 글자가 4자 미만(length를 사용해서 길이를 획득한다.) 일 경우 아래 함수를 실행한다.
		alert("아이디는 4글자 이상 입력해야 합니다.");								// 오류메세지를 내보낸다.
		userIdEl.focus();													// 아이디가 있는 곳으로 focus()를 통해 이동시킨다.
		return;																// 해당 함수를 멈추게한다.
	}
	
	if(!/^[a-zA-Z0-9]+$/.test(userIdEl.value)){								// 아이디에 소문자(a-z), 대문자(A-Z), 숫자(0-9)외에의 값이 들어가있을경우 발생한다.
		alert("아이디에는 영어 대소문자와 숫자만 이용 가능합니다.");						// 오류메세지를 내보낸다.
		userIdEl.focus();													// 아이디가 있는 곳으로 focus()를 통해 이동시킨다.
		return;																// 해당 함수를 멈추게 한다.
	}
	
	var pwd = document.getElementById("user-pwd");							// getElementById로 user-pwd에 해당하는 엘리먼트를 가져온다.
	var confirmPwd = document.getElementById("user-pwd-confirm");			// user-pwd-confirm 해당하는 엘리먼트를 가져온다.
	if(pwd.value != confirmPwd.value){										// 두개의 비밀번호가 일치하지 않을경우 아래의 함수가 실행된다.
		alert("비밀번호가 서로 일치하지 않습니다. 다시 입력해주세요");					// 오류메세지를 내보낸다.
		confirmPwd.value = "";												// user-pwd-confirm 의 값을 빈 문자열로 변경한다.
		confirmPwd.focus();													// user-pwd-confirm 창으로 이동시킨다.
		return;																// 해당 함수를 멈추게 한다.
	}
	
	if(!pwd.value || !confirmPwd.value){									// pwd나 confirmPwd가 false(0,"",'',flase) 면 아래의 함수가 실행된다.
		alert("비밀번호는 필수값 입니다.");										// 오류메세지를 내보낸다.
		pwd.focus();														// user-pwd 창으로 이동시킨다.
		return;																// 해당함수를 멈추게 한다.
	}
	
	var carrerEl = document.querySelector("select[name='carrer']");			// select에 있는 name이 carrer인 엘리먼트를 querySelector를 통하여 가져온다.
	if(!carrerEl.value){													// carrerEl이 한개도 선택되지 않은(false,0,'',"")경우 아래의 함수가 실행된다.
		alert("경력사항을 선택해주세요.");											// 오류메세지를 내보낸다.
		carrerEl.focus();													// carrer로 이동시킨다.
		return;																// 해당함수를 멈추게 한다.
	}
	
	var skillsEl = document.querySelectorAll("input[name='skill']");		// input에 있는 name이 skill인 모든 엘리먼트를 조회한다.
	var isChecked = false;													// 값을 저장하기 위해 false인 isChecked를 생성한다.
	for(var i=0; i<skillsEl.length; i++){									// skillsEl배열에 들어있는(실제 배열이 아니지만) 값들을 조회하기 위해 임의의 for문을 skillsEl길이만큼 돌려준다.
		var skillEl = skillsEl[i];											// skillEl 이라는 곳에 배열에 들어있는 첫번째의 값부터 담아서 검사를 한다.
		if(skillEl.checked){												// checked를 사용해서 check가 되었는지, 안되었는지 확인후 체크가 되있을 경우 아래의 함수가 실행된다.
			isChecked = true;												// isChecked에 true를 담는다.
			break;															// 해당함수를 멈추게 한다.
		}
	}
	if(!isChecked){															// isChecked가 false(checked되어 있지 않음)인 경우에 아래의 함수가 실행된다.
		alert("보유기술을 하나 이상 선택해주세요.");				`					// 오류 메세지를 내보낸다.
		return;																// 해당 함수를 멈추게 한다.
	}
	
	var etcEl = document.getElementById("etc");								// docuemnt.getElementById로 etc라는 id를 사용하는 엘리먼트를 생성한다.
	
	if(!etcEl.value.trim()){												// etc가 비어있을 경우 아래의 함수를 실행한다.
		var confirmValue = confirm("기타사항에 입력이 하나도 없는데 괜찮아?");		// confirmValue에 confirm(내용)을 담아 확인/취소 선택이 가능하게 한다.
		if(!confirmValue){													// confirmValue에서 취소를 누를경우 아래의 함수가 실행된다.
			etcEl.focus();													// etc창으로 이동시킨다.
			return;															// 해당함수를 멈추게 한다.
		}
	}
	
	var checkmeEl = document.querySelector("#check-me");					// document.querySelector에 있는 check-me라는 엘리먼트를 가져온다.
	if(!checkmeEl.checked){													// checked를 사용해서 체크가 되어 있지 않을 경우 아래의 함수가 실행된다.
		alert("개인정보 동의를 거절하시면 가입하실수 없습니다.");						// 오류 메세지를 내보낸다.
		checkmeEl.focus();													// etc창이 있는 곳으로 이동시킨다.
		return;																// 해당 함수를 멈추게 한다.
	}
	
	document.getElementById("register-form").submit();						// 모든 확인이 끝날경우 form에 있는 id(register-form)을 가져와서 .submit()함수로 해당폼의 action에 있는 곳으로 이동시킨다.
	}
	
</script>
</body>
</html>