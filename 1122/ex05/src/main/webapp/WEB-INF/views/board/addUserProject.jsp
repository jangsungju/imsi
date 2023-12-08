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

input[type="checkbox"] {
	-moz-appearance: checkbox;
	-webkit-appearance: checkbox;
	-ms-appearance: checkbox;
	appearance: checkbox;
	opacity: 1;
	padding-top: 10px;
	padding-left: 5px;
}

.search-table {
    width: 100%; /* 원하는 너비 조절 */
    margin: 10 auto; /* 가운데 정렬 */
    text-align: center;
  }

  .search-table tr td {
    width: 25%; /* 셀 너비 조절 */
    padding: 5px; /* 여백 조절 */
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
					<h1>개인 프로젝트 추가</h1>
				</header>
				<!-- Table -->
				<div class="content">
					<div class="form">
						<form id="searchNotAddProject">
							<input type="hidden" name="uno" value="${uno}">
							<table class="search-table" style="text-align:center;">
								<tr>
									<td>프로젝트명</td>
									<td><input type="text" name="pjtnm"></td>
									<td>고객사명</td>
									<td>
										<select name="compyno">
											<option value=""></option>
											<option value="01">삼성</option>
											<option value="02">CJ</option>
											<option value="03">SK</option>
											<option value="04">LG</option>
											<option value="05">롯데</option>
											<option value="06">한화</option>
											<option value="07">농협</option>
											<option value="08">GS</option>
											<option value="09">신세계</option>
											<option value="10">두산</option>
											<option value="11">동부</option>
											<option value="12">현대자동차</option>
										</select>
									</td>
							</table>
								<div style="text-align: right;">
									<input type="button" value="조회" onclick="searchNotAddUserProjects();">
								</div>
						</form>
							<table class="project-table" style="text-align: center;">
								<tr>
								 <td style="text-align: center;"><input type="checkbox" id="selectAllCheckbox" onchange="selectAllCheckboxes();"></td>
								 <td>프로젝트명</td>
								 <td>고객사명</td>
								 <td>시작일</td>
								 <td>종료일</td>
								</tr>
								<c:choose>
        							<c:when test="${addUserProject == null or addUserProject[0].pjtnm == null}">
            							<tr>
                							<td colspan="5">프로젝트가 없습니다.</td>
            							</tr>
        							</c:when>
        							<c:otherwise>
            							<c:forEach var="project" items="${addUserProject}" varStatus="loop">
					                    	<tr>
						                        <td><input type="checkbox" name="addProjectCheckbox" value="${uno}-${project.pjtNo}"></td>
						                        <td>${project.pjtnm}</td>
						                        <td>${project.companyNm}</td>
						                        <td><input type="date" value="${project.pjtFromDate}" disabled></td>
						                        <td><input type="date" value="${project.pjtToDate}" disabled></td>
						                    </tr>
            							</c:forEach>
        							</c:otherwise>
    							</c:choose>
   								<tr>
									<td colspan="6">
										<div style="text-align: right;">
											<input type="button" value="추가" onclick="#">
											&nbsp;&nbsp;&nbsp;&nbsp; 
											<input type="button" value="취소"onclick="goBack()">
										</div>
									</td>
								</tr>
							</table>
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
	function searchNotAddUserProjects(){
	 
		let formData = {};
		 
		let formDataArray = $('#searchNotAddProject').serializeArray();

		formData = {
			    uno: $('[name="uno"]').val()
			};
		
		formDataArray.forEach(input => {
		    const value = input.value.trim();
		    
		    if (value !== '') {
		        formData[input.name] = value;
		    }
		});

		console.log("검색 조건이 입력된 것만 json에 추가하기 search", JSON.stringify(formData));
	 
		// Ajax를 이용하여 서버로 검색 요청을 보냅니다.
		$.ajax({
	        
			type: "POST",
	        url: "/board/searchNotAddUserProjects", // 실제 검색을 처리하는 컨트롤러의 URL로 수정
	        contentType: "application/json",
	        dataType: "json",
	        data: JSON.stringify(formData),
	        success: function(result) {
	            
	        
	            console.log("검색 결과:", result);
	            // 예를 들어, 검색된 결과를 테이블에 표시하는 등의 로직을 추가할 수 있습니다.
	        
	        },
	        error: function(error) {
	            console.log("Error during project search:", error);
	        }
	    });
	}


	function getUrlParameter(name) {
	    
		var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
	        results = regex.exec(window.location.href);
	    if (!results) return null;
	    if (!results[2]) return '';
    	return decodeURIComponent(results[2].replace(/\+/g, ' '));

	}
</script>