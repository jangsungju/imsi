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
 table {
        width: 100%; /* 테이블 전체 너비 설정 */
    }

    td:nth-child(1) {
        width: 15%; /* 첫 번째 열의 너비 설정 */
    }

    td:nth-child(2) {
        width: 35%; /* 두 번째 열의 너비 설정 */
    }

    td:nth-child(3) {
        width: 15%; /* 세 번째 열의 너비 설정 */
    }

    td:nth-child(4) {
        width: 35%; /* 네 번째 열의 너비 설정 */
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
						<form method="post" action="/board/register" id="registerForm" name="registerForm">
						 <input type="hidden">
							<table border="1">
								<tr>
									<td colspan="4"
										style="background-color: #cee3f6; font-weight: bold;"><span
										class="redFont">(*필수입력)</span> 사원정보입력</td>
								</tr>
								<tr>
									<td>아 이 디<span class="redFont">*</span></td>
									<td><input type="text" id="uId" name="uId" placeholder="영어,숫자 4~20자리" required maxlength="20"></td>
									<td><p style="display:inline"><span id="idCheck_text" style="font-size:0.8em"></p></span></td>
									<td></td>
								</tr>
								<tr>
									<td>비밀 번호<span class="redFont">*</span></td>
									<td><input type="password" id="pwd" name="pwd" placeholder="비밀번호" required maxlength="20"></td>
									<td>비밀 번호 확인<span class="redFont">*</span></td>
									<td><input type="password" name="pwd_re" id="pwd_re"
										placeholder="비밀번호 확인" required maxlength="20"></td>
								</tr>
								<tr>
								    <td></td>
									<td><p style="display:inline"><span id="pwdCheck_text" style="font-size:0.8em"></p></span></td>
								    <td></td>
								    <td><p style="display:inline"><span id="repwdCheck_text" style="font-size:0.8em"></p></span></td>
								</tr>
								<tr>
									<td>이 름<span class="redFont">*</span></td>
									<td><input type="text" name="unm" placeholder="이름" required maxlength="20"></td>
									<td>생 년 월 일</td>
									<td><input type="date" name="birth" min="1940-01-01"
										id="dateInput1"></td>
								</tr>
								<tr>
									<td>성별<span class="redFont">*</span></td>
									<td>남자<input type="radio" name="sex" value="01" required>
										&nbsp;&nbsp;&nbsp; 여자<input type="radio" name="sex" value="02">
									</td>
									<td>입 사 일<span class="redFont">*</span></td>
									<td><input type="date" name="entrDate" min="1960-01-01"
										id="dateInput2" required></td>
								</tr>
								<tr>
									<td>재직 상태<span class="redFont">*</span></td>
									<td><select name="inoffiSts" required>
											<option value=""></option>
											<option value="01">재직</option>
											<option value="02">휴직</option>
											<option value="03">퇴직</option>
									</select></td>
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
								</tr>
								<tr>
									<td>기술 등급<span class="redFont">*</span></td>
									<td><select name="jobSkill" required>
											<option value=""></option>
											<option value="01">특급</option>
											<option value="02">고급</option>
											<option value="03">중급</option>
											<option value="04">초급</option>
									</select></td>
									<td>개발 분야<span class="redFont">*</span></td>
									<td><select name="devPt" required>
											<option value=""></option>
											<option value="01">풀스텍</option>
											<option value="02">백엔드</option>
											<option value="03">프론트엔드</option>
									</select></td>
								</tr>
								<tr>
									<td>이 메 일</td>
									<td><input type="text" name="emailAddr"
										placeholder="이메일을 입력해주세요."></td>
									<td>사진 첨부<span class="redFont">*</span></td>
									<td><input type="file" name="photo"></td>
								</tr>
								<tr>
									<td>핸드폰 번호</td>
									<td><input type="text" name="mblNo" 
										placeholder="전화번호를 입력해주세요." onkeyup=""></td>
									<td>보관여부</td>
									<td>
										<select name="deleteCol">
												<option value=""></option>
												<option value="01">삭제</option>
												<option value="02">보관</option>
										</select>
									</td>		
								</tr>
								<tr	>
								<td>권한</td>
								<td>
								<select name="authoNo">
												<option value=""></option>
												<option value="01">관리자</option>
												<option value="02">사원</option>
										</select>
								</td>
								<td>
								</td>
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
    if ($("#idCheck_text").css("color") !== "rgb(0, 0, 255)") {
        alert("아이디를 중복 검사를 해주세요.");
        registerForm.uId.focus();
        return false;
    } else if (registerForm.pwd.value == "") {
        alert("비밀번호를 입력해주세요");
        registerForm.pwd.focus();
        return false;
  	} else if ($("#repwdCheck_text").css("color") !== "rgb(0, 0, 255)") {
        alert("비밀번호를 다시 확인해주세요.");
        registerForm.pwd_re.focus();
        return false;
    } else if (registerForm.unm.value == "") {
        alert("이름을 입력해주세요");
        registerForm.unm.focus();
        return false; 
    } else if (registerForm.sex.value == "") {
        alert("성별을 선택해주세요");
        // Instead of registerForm.sex.focus(), focus on the radio button input directly
        $("input[name='sex']").first().focus();
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
<script>

let check= false;

function idCheck(id) {
	
	
	console.log("id:"+id);
	
	if (id === "") {
        $("#idCheck_text").text("");
        return false;
    }
	
	// 여기서 유효성 검사를 추가하고, 유효하지 않으면 바로 반환
    if (!isValidId(id)) {
        return false;
    }
	
	 	
	  // AJAX를 사용하여 서버에 아이디 중복체크 요청
	  $.ajax({
	    type: "POST",
	    url: "/board/idCheck",
	    contentType: "application/json",
        dataType: "json",
	    data: id, // 데이터를 JSON 문자열로 변환
	    success: function(response) {
	    	
	    	console.log("idCheckResult:" +response.idCheckResult);
	      // 서버로부터의 응답 처리
	    	  // 서버로부터의 응답 처리
	        if (response.idCheckResult === 0) {
	            $("#idCheck_text").text("사용 가능");
	            $("#idCheck_text").css("color", "blue");
	            // 중복이 아닌 경우에만 check 값을 true로 설정
	            check = true;
	        } else {
	            $("#idCheck_text").text("사용 불가");
	            $("#idCheck_text").css("color", "red");
	            $("#uId").focus();
	            // 중복인 경우에는 check 값을 false로 설정
	            check = false;
	        }

	    },
	    error: function () {
	        alert("서버 오류가 발생했습니다.");
	        // 오류 발생 시에도 check 값을 false로 설정
	        check = false;

	    }
	});
	 
	}

function isValidId(id) {
	
	 // 정규표현식을 사용하여 유효성 검사
    const regex = /^[a-zA-Z0-9]{4,20}$/;


    if (!regex.test(id)) {
        // 유효하지 않은 경우 메시지를 표시하고 false 반환
        $("#idCheck_text").text("영어,숫자 4~20자리.");
        $("#idCheck_text").css("color", "red");
        return false;
    }
	
    return true; // 예시로 항상 true를 반환하도록 했습니다.
}



// 입력란에 입력이 발생할 때마다 호출되는 이벤트 핸들러
$("input[name='uId']").keyup(function () {
    let uId = $(this).val();

    // 실시간으로 아이디 중복 체크
    idCheck(uId);

});


//pwd실시간으로 유효성 검사 및 확인검사
 $("input[name='pwd']").keyup(function(){
        let password = $(this).val();
        var passwordReg = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~!@#$%^&*()_+|<>?:{}]).{8,20}$/;
        if (!passwordReg.test(password)) {
            $("#pwdCheck_text").html("비밀번호 형식이 맞지 않습니다.").css("color", "red");
            return false;
        } else {
            $("#pwdCheck_text").html("사용 가능한 비밀번호 입니다.").css("color", "blue");
        }
    });
  
 $("input[name='pwd_re']").keyup(function(){
     var password = $("#pwd").val();
     
     console.log("1차 비밀번호:", password);
     var confirmPassword = $(this).val();


     if (password === confirmPassword) {
         $("#repwdCheck_text").html("비밀번호가 일치합니다.").css("color", "blue");
     } else {
    	 $("#repwdCheck_text").html("비밀번호가 일치하지 않습니다.").css("color", "red");
     }
 });

	
</script>
</html>