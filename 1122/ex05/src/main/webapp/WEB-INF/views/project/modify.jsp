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
					<h1>프로젝트 수정하기</h1>
				</header>
				<!-- Table -->
				<div class="content">
					<div class="form">
						<form id="modifyForm"action="/project/modify" method="post">
							<table border="1">
								<tbody>
									<tr>
										<td>프로젝트 번호</td>
										<td><input type="text" name="pjtNo" value="${project.pjtNo}" readonly></td>
										<td>프로젝트 명<span>*</span></td>
									    <td><input type="text" name="pjtNm" value="${project.pjtNm}"></td>
									</tr>
									<tr>
										<td>시작일<span>*</span></td>
										<td><input type="date" name="pjtFromDate" value="${project.pjtFromDate}"></td>
										<td>종료일<span>*</span></td>
										<td><input type="date" name="pjtToDate" value="${project.pjtToDate}"></td>
									</tr>
									<tr>
										<td>고객사명<span>*</span></td>
										<td>
											<select name="compyNo">
												<option value=""></option>
												<option value="01" ${project.compyNo == '01' ? 'selected' : ''}>삼성</option>
												<option value="02" ${project.compyNo == '02' ? 'selected' : ''}>CJ</option>
												<option value="03" ${project.compyNo == '03' ? 'selected' : ''}>SK</option>
												<option value="04" ${project.compyNo == '04' ? 'selected' : ''}>LG</option>
												<option value="05" ${project.compyNo == '05' ? 'selected' : ''}>롯데</option>
												<option value="06" ${project.compyNo == '06' ? 'selected' : ''}>한화</option>
												<option value="07" ${project.compyNo == '07' ? 'selected' : ''}>농협</option>
												<option value="08" ${project.compyNo == '08' ? 'selected' : ''}>GS</option>
												<option value="09" ${project.compyNo == '09' ? 'selected' : ''}>신세계</option>
												<option value="10" ${project.compyNo == '10' ? 'selected' : ''}>두산</option>
												<option value="11" ${project.compyNo == '11' ? 'selected' : ''}>동부</option>
												<option value="12" ${project.compyNo == '12' ? 'selected' : ''}>현대자동차</option>
											</select>
										</td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
								<tfoot>	
									<tr>
										<td colspan="4">
											<div style="text-align: right;">
												<input type="button" value="수정" onclick="modify();">
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

function modify(){
	
	let formDataArray = $('#modifyForm').serializeArray();
	
	formData ={};
	
	formDataArray.forEach(input => {
    	
		const value = input.value.trim();
			
		if (value !== '') {
    
			formData[input.name] = value;

		}

	});
	
	
	console.log("검색 조건이 입력 된 것만 json에 추가하기 search", JSON.stringify(formData));
	
	$.ajax({
	    
		url: "/project/modify",
        type: "POST",
        contentType: "application/json",
        dataType: "json",
        data: JSON.stringify(formData),
        success: function (data) {
    
        	console.log("===============data================" , data.modifytResult);
        	
        	alert(data.modifytResult);
        	
        	window.location.href = '/project/list';
        	
        },

        error: function (xhr, status, error) {
    
        	console.error(error);

        }

	});

}
	


</script>
</html>