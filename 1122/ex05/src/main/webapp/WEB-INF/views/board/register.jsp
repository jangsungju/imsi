<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Board</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<style>
body {
	transform: scale(0.8);
	margin-top: -50px;
}

input[type="checkbox"], input[type="radio"] {
	-moz-appearance: checkbox; /* Firefox */
	-webkit-appearance: checkbox; /* Chrome and Safari */
	-ms-appearance: checkbox; /* Internet Explorer */
	appearance: checkbox; /* Standard */
	display: inline-block;
	float: none;
	margin-right: 0;
	opacity: 1;
	width: auto;
	z-index: auto;
}

.redFont {
	color: red;
	font-size: 18px;
	font-style: italic;
}

input:invalid {
  border: 3px solid #b3e0f2;
}
</style>
</head>
<body class="is-preload">
	<!-- Main -->
	<div id="main">
		<div class="wrapper">
			<div class="inner">

				<!-- Elements -->
				<header class="major">
					<h1>사원 정보 등록</h1>
				</header>
				<!-- Table -->
				<div class="content">
					<div class="form">
						<form method="post" action="/board/register" id="registForm" name="registerForm">
						 <input type="hidden">
							<table border="1">
								<tr>
									<td colspan="4"
										style="background-color: #cee3f6; font-weight: bold;"><span
										class="redFont">(*필수입력)</span> 사원정보입력</td>
								</tr>
								<tr>
									<td>사 번<span class="redFont">*</span></td>
									<td><input type="text" name="uno" placeholder="사번" required maxlength="7" pattern="[0-9]+"></td>
									<td>이 름<span class="redFont">*</span></td>
									<td><input type="text" name="unm" placeholder="이름" required maxlength="20"></td>
								</tr>
								<tr>
									<td>비밀 번호<span class="redFont">*</span></td>
									<td><input type="password" name="pwd" placeholder="비밀번호" required maxlength="20"></td>
									<td>비밀 번호 확인<span class="redFont">*</span></td>
									<td><input type="password" name="pwd_re"
										placeholder="비밀번호 확인" required maxlength="20"></td>
								</tr>
								<tr>
									<td>생 년 월 일</td>
									<td><input type="date" name="birth" min="1940-01-01"
										id="dateInput1"></td>
									<td>성별<span class="redFont">*</span></td>
									<td>남자<input type="radio" name="sex" value="01" required>
										&nbsp;&nbsp;&nbsp; 여자<input type="radio" name="sex" value="02">
									</td>
								</tr>
								<tr>
									<td>입 사 일<span class="redFont">*</span></td>
									<td><input type="date" name="entrDate" min="1960-01-01"
										id="dateInput2" required></td>
									<td>재직 상태<span class="redFont">*</span></td>
									<td><select name="inoffiSts" required>
											<option value=""></option>
											<option value="01">재직</option>
											<option value="02">휴직</option>
											<option value="03">퇴직</option>
									</select></td>
								</tr>
								<tr>
									<td>직 급<span class="redFont">*</span></td>
									<td><select name="jobRank" required>
											<option value=""></option>
											<option value="01">사장</option>
											<option value="02">상무</option>
											<option value="03">이사</option>
											<option value="04">부장</option>
											<option value="05">차장</option>
											<option value="06">과장</option>
											<option value="07">대리</option>
											<option value="08">사원</option>
									</select></td>
									<td>기술 등급<span class="redFont">*</span></td>
									<td><select name="jobSkill" required>
											<option value=""></option>
											<option value="01">특급</option>
											<option value="02">고급</option>
											<option value="03">중급</option>
											<option value="04">초급</option>
									</select></td>
								</tr>
								<tr>
									<td>개발 분야<span class="redFont">*</span></td>
									<td><select name="devPt" required>
											<option value=""></option>
											<option value="01">풀스텍</option>
											<option value="02">백엔드</option>
											<option value="03">프론트엔드</option>
									</select></td>
									<td>사진 첨부<span class="redFont">*</span></td>
									<td><input type="file" name="photo"></td>
								</tr>
								<tr>
									<td>이 메 일</td>
									<td><input type="text" name="emailAddr"
										placeholder="이메일을 입력해주세요."></td>
									<td>핸드폰 번호</td>
									<td><input type="text" name="mblNo" 
										placeholder="전화번호를 입력해주세요." onkeyup=""></td>
								</tr>
								<tr>
									<td colspan="3">보관여부</td>
									<td><select name="deleteCol">
											<option value=""></option>
											<option value="01">삭제</option>
											<option value="02">보관</option>
								</tr>
								<tr>
									<td colspan="4">
										<div style="text-align: right;">
											<input type="button" value="등록" onclick="submitCheck();">
											&nbsp;&nbsp;&nbsp;&nbsp; 
											<input type="button" value="취소" onclick="goBack()">
										</div>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<!-- Scripts -->
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>

<script type="text/javascript">

function submitCheck() {
    if (registerForm.uno.value == "") {
        alert("사번을 입력해주세요");
        registerForm.uno.focus();
        return false;
    } else if (registerForm.unm.value == "") {
        alert("이름을 입력해주세요");
        registerForm.unm.focus();
        return false;
    } else if (registerForm.pwd.value == "") {
        alert("비밀번호를 입력해주세요");
        registerForm.pwd.focus();
        return false;
    } else if (registerForm.pwd_re.value == "") {
        alert("비밀번호를 확인해주세요");
        registerForm.pwd_re.focus();
        return false;
    } else if (registerForm.sex.value == "") {
        alert("성별을 선택해주세요");
        registerForm.sex.focus();
        return false;
    } else if (registerForm.entrDate.value == "") {
        alert("입사일을 입력해주세요");
        registerForm.entrDate.focus();
        return false;
    } else if (registerForm.inoffiSts.value == "") {
        alert("재직 상태를 입력해주세요");
        registerForm.inoffiSts.focus();
        return false;
    } else if (registerForm.jobRank.value == "") {
        alert("직급을 입력해주세요");
        registerForm.jobRank.focus();
        return false;
    } else if (registerForm.jobSkill.value == "") {
        alert("기술등급을 입력해주세요");
        registerForm.jobSkill.focus();
        return false;
    } else if (registerForm.devPt.value == "") {
        alert("개발분야를 입력해주세요");
        registerForm.devPt.focus();
        return false;
    }
    
    var noReg = /\d{7}/g;
    if (!noReg.test(registerForm.uno.value)) {
        alert("사번은 7자리 정수로 입력해주세요.");
        registerForm.uno.focus();
        return false;
    }
    
    var password = registerForm.pwd.value;
    var confirmPassword = registerForm.pwd_re.value;

    if (password !== confirmPassword) {
        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
        return false;
    }
     
    var name = registerForm.unm.value;
    var nameReg = /^[가-힣a-zA-Z]+$/;
    
    if (!nameReg.test(name)) {
        alert("이름은 한글 또는 영어만 입력 가능합니다.");
        return false;
    }

    if (nameReg.test(name) && /[가-힣]/.test(name) && name.length > 5) {
        alert("한글 이름은 최대 5글자까지 입력 가능합니다.");
        return false;
    }

    if (nameReg.test(name) && /[a-zA-Z]/.test(name) && name.length > 12) {
        alert("영어 이름은 최대 12글자까지 입력 가능합니다.");
        return false;
    }
    
    var passwordReg = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~!@#$%^&*()_+|<>?:{}]).{8,20}$/;
    if (!passwordReg.test(password)) {
        alert("비밀번호는 8~20자리의 영문, 숫자, 특수문자를 포함해야 합니다.");
        registerForm.pwd.focus(); // 수정된 부분: 포커스를 비밀번호 입력 필드로 이동
        return false;
    }
    
    // 폼 제출
    registerForm.submit();
    return true;
}

</script>

<script>

	function goBack() {
    
		history.go(-1);

	}

</script>
<script>
function validateDateRange() {
    var birthDate = new Date(document.getElementById('dateInput1').value);
    var entrDate = new Date(document.getElementById('dateInput2').value);

    // 종료일이 시작일보다 빠른 경우
    if (endDate < startDate) {
        alert('종료일은 시작일보다 이후여야 합니다. 다시 입력해주세요.');
        document.getElementById('dateInput2').value = ''; // 종료일 입력 값을 지웁니다.
    }
}

function limitDateInput(inputId) {
	var input = document.getElementById(inputId);
    var selectedDate = new Date(input.value);
    var currentDate = new Date();
    var minDate = new Date(input.min);
   
    
    // 입력된 날짜가 유효한지 확인합니다.
    if (isNaN(selectedDate)) {
        alert('올바르지 않은 날짜 형식입니다.');
        input.value = ''; // 입력 값을 지웁니다.
        return;
    }

    // 최소값(min)을 확인합니다.
    if (selectedDate < minDate) {
        alert('입력 가능한 최소 날짜는 ' + input.min + '입니다.');
        input.value = ''; // 입력 값을 지웁니다.
        return;
    }
    // 현재 날짜 이후인지 확인합니다.
    if (selectedDate > currentDate) {
        alert('현재 날짜 이후의 날짜는 조회할 수 없습니다.');
        input.value = ''; // 입력 값을 지웁니다.
        return;
    }

    // 유효성 검사를 한 후에 validateDateRange 함수를 호출합니다.
    validateDateRange();
}

</script>


</html>