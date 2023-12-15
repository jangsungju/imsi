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

input[readonly] {
    background-color: #f2f2f2; /* 읽기 전용 배경색 지정 */
    border: 3px solid #b3e0f2; /* 테두리 스타일 지정 */
    color: #666; /* 글자색 지정 */
    cursor: not-allowed; /* 커서 모양 변경 */
}

select[disabled]{
 
 	background-color: #f2f2f2; /* 읽기 전용 배경색 지정 */
    border: 3px solid #b3e0f2; /* 테두리 스타일 지정 */
    color: #666; /* 글자색 지정 */
    cursor: not-allowed; /* 커서 모양 변경 */
	
}

select[disabled]:active {
    border-color: #ff0000;
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
					<h1>프로젝트 등록하기</h1>
				</header>
				<!-- Table -->
				<div class="content">
					<div class="form">
						<form id="registerForm" action="/project/register" method="post">
							<table border="1">
								<tbody>
									<tr>
										<td>프로젝트 명<span>*</span></td>
									    <td><input type="text" id="pjtNm" name="pjtNm" maxlength="30"  minlength="4" pattern="[a-zA-Z가-힣0-9]+" required ></td>
									    <td>고객사명<span>*</span></td>
										<td>
											<select name="compyNo" id="compyNo" required>
												<option value=""></option>
												<option value="01" >삼성</option>
												<option value="02" >CJ</option>
												<option value="03" >SK</option>
												<option value="04" >LG</option>
												<option value="05" >롯데</option>
												<option value="06" >한화</option>
												<option value="07" >농협</option>
												<option value="08" >GS</option>
												<option value="09" >신세계</option>
												<option value="10" >두산</option>
												<option value="11" >동부</option>
												<option value="12" >현대자동차</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>시작일<span>*</span></td>
										<td><input type="date" name="pjtFromDate" required id="dateInput1" onchange="limitDateInput('dateInput1')"></td>
										<td>종료일</td>
										<td><input type="date" name="pjtToDate" id="dateInput2" onchange="limitDateInput('dateInput2')"></td>
									</tr>
								</tbody>
								<tfoot>	
									<tr>
										<td colspan="4">
											<div style="text-align: right;">
												<input type="button" value="등록" onclick="submitCheck();">
												&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="취소"
													onclick="goBack()">
											</div>
										</td>
									</tr>
								</tfoot>
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
function goBack() {
    history.go(-1);
}

</script>
<script>
function submitCheck() {
    const pjtNmValue = document.getElementById('pjtNm').value.trim();
    const compyNoValue = document.getElementById('compyNo').value;
    const pjtFromDateValue = document.getElementById('dateInput1').value;
    const pjtToDateValue = document.getElementById('dateInput2').value;

    if (pjtNmValue.length < 4 || !/^[a-zA-Z가-힣0-9\s]+$/u.test(pjtNmValue)) {
        
    	alert('프로젝트 명은 최소 4글자 이상이어야 하며, 한글, 영어, 숫자, 공백만 입력 가능합니다.');
        pjtNmInput.focus();
        return false;
    
    }

    // 고객사 체크
    if (!compyNoValue) {
        alert('고객사를 선택하세요.');
        compyNoInput.focus();
        return false;
    }

    // 시작일 체크
    if (!pjtFromDateValue) {
        alert('시작일을 선택하세요.');
        dateInput1.focus();
        return false;
    }
    
    // 시작일 체크
    if (!pjtToDateValue) {
        alert('종료일을 선택하세요.');
        dateInput2.focus();
        return false;
    }

    // 종료일 체크
    if (pjtToDateValue && pjtToDateValue < pjtFromDateValue) {
        alert('종료일은 시작일 이후이어야 합니다.');
        dateInput2.focus();
        return false;
    }

    // 모든 체크가 통과하면 폼을 제출합니다.
    // 여기에 폼을 서버에 제출하는 로직을 추가하세요.
    register();
    return true;
}


</script>
<script>

	function register(){
	
	let formDataArray = $('#registerForm').serializeArray();
	
	formData ={};
	
	formDataArray.forEach(input => {
    	
		const value = input.value.trim();
			
		if (value !== '') {
    
			formData[input.name] = value;

		}

	});
	
	
	console.log("검색 조건이 입력 된 것만 json에 추가하기 search", JSON.stringify(formData));
	
	$.ajax({
	    
		url: "/project/register",
        type: "POST",
        contentType: "application/json",
        dataType: "json",
        data: JSON.stringify(formData),
        success: function (data) {
    
        	console.log("===============data================" , data.registertResult);
        	
        	alert(data.registertResult);
        	
        	window.location.href = '/project/list';
        	
        },

        error: function (xhr, status, error) {
    
        	console.error(error);

        }

	});

}
	
</script>
<script>
function validateDateRange() {
    var pjtFromDate = new Date(document.getElementById('dateInput1').value);
    var pjtToDate = new Date(document.getElementById('dateInput2').value);

    // 종료일이 시작일보다 빠른 경우
    if (pjtToDate < pjtFromDate) {
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
   /*  // 현재 날짜 이후인지 확인합니다.
    if (selectedDate > currentDate) {
        alert('현재 날짜 이후의 날짜는 조회할 수 없습니다.');
        input.value = ''; // 입력 값을 지웁니다.
        return;
    }
 */
 
	// 시작일(dateInput1)에 대해서만 현재 날짜 이후인지 확인합니다.
	if (inputId === 'dateInput1' && selectedDate > currentDate) {
    	
		alert('현재 날짜 이후의 날짜는 조회할 수 없습니다.');
		input.value = ''; // 입력 값을 지웁니다.
     
    	 return;
 	}
 
 
    // 유효성 검사를 한 후에 validateDateRange 함수를 호출합니다.
    validateDateRange();
}



</script>
</html>