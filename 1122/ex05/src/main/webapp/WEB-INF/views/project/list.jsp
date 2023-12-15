<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Board</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<style>
body {
	transform: scale(0.8);
}

header p {
	width: 250px;
	display: inline-block;
	margin-left: 20px;
}

label {
	display: inline;
	font-size: 0.9rem;
	font-weight: 700;
	margin: 0 0 1rem 0;
}

.form-row {
	display: inline-block;
	align-items: center;
	margin: 15px;
}

.form-ent {
	display: inline-block;
	padding: 5px;
}

.form-submit {
	display: inline;
	justify-content: flex-end;
}

input[type="checkbox"] {
	-moz-appearance: checkbox;
	-webkit-appearance: checkbox;
	-ms-appearance: checkbox;
	appearance: checkbox;
	opacity: 1;
}

table th, table td {
	text-align: center;
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
					<h1><a href="/board/main">프로젝트관리</a></h1>
				</header>
				<nav class="form-container">
					<form name="searchForm" method="post" id="searchForm">
						<div style="display: inline-block;">
							<div class="form-row">
								<label>프로젝트 명 :<input type="text" name="pjtNm" id="pjtNmInput" maxlength="5" value="${memberDTO.unm}">
								</label>
							</div>
							<div class="form-row">
								<label>고객 사명 :
									<select name="compyNo">
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
								</label>
							</div>
							<div class="form-ent" style="text-align: left;">
								<label class="form-label"> 기 간
									<input type="date" name="startDate" min="1990-01-01" class="dateInput"
				                    id="dateInput1" oninput="limitDateInput('dateInput1'); validateDateRange()" value="${memberDTO.startDate}">
				           		</label>
				                     ~ 
								<label>
								<input type="date" name="endDate"
								min="1990-01-01" class="dateInput" id="dateInput2" oninput="limitDateInput('dateInput2'); validateDateRange()"  value="${memberDTO.endDate}">
								</label>
							</div>
						<div class="form-submit">
							<input type="button" value="조회" onclick="search();">
						</div>
					</form>
				</nav>
                           <div><p id="total"></p></div>
				<!-- Table -->
				<div class="table-wrapper">
					<table>
						<thead>
							<tr class="tHead">
								<th class="ckNum"><input style="" name="ckNum"
									type="checkbox" value=""></th>
								<th class="pjtNo">프로젝트 번호</th>
								<th class="pjtNm">프로젝트 명</th>
								<th class="companyNm">고객사명</th>
								<th class="pjtFromDate">시작일</th>
								<th class="pjtToDate">종료일</th>
								<th class="member">인원관리</th>
							</tr>
						</thead>
						<tbody id="appendBody">
						 <tr class="tBody">
        						<td colspan="10" class="noData">검색 결과가 없습니다.</td>
      					</tr>
						</tbody>
						<tfoot>
						</tfoot>
					</table>
				</div>
					<div id="pagination" style="text-align:center;"></div>
						<div style="text-align: right;">
							<input type="button" value="등록" onclick="location.href = '/project/register'">
							&nbsp;&nbsp;&nbsp; <input type="button" value="삭제">
							&nbsp;&nbsp;&nbsp; <input type="reset" value="취소" id="cancelButton">
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
<script >
	const amount = 4; // 페이지당 표시할 데이터 개수
	let pageNum = 1; // 현재 페이지 번호
	let endPage;
	let startPage;
	let currentPage;
	let realEnd;
	let prev, next;
	let formData = null; // 현재 검색 조건 데이터

	function saveSearchCondition(formData) {
    
		sessionStorage.setItem('searchCondition', JSON.stringify(formData));
	    console.log("세션 스토리지에 검색 조건 저장: ", formData);

	}


	function loadSearchCondition() {
    
		const savedCondition = sessionStorage.getItem('searchCondition');
	    return savedCondition ? JSON.parse(savedCondition) : null;

	}


	//윈도우 로드 시 세션 스토리지에서 데이터 로드
	window.onload = function () {
    
		const savedCondition = loadSearchCondition();
	    if (savedCondition) {
       
	    	formData = savedCondition;
	        loadData(formData);
    
    	}

	};


	function goPage(item) {

		if (item !== currentPage) {

		currentPage = item;
		formData.pageNum = currentPage;

		console.log("검색 조건이 입력 된 것만 json에 추가하기 goPage", JSON.stringify(formData));

		saveSearchCondition(formData);
		loadData(formData);
		
		}

	}

	function search() {

	let bodyHtml = "";
	pageNum = 1;
	let formDataArray = $('#searchForm').serializeArray();

	formData = {

			amount: amount,
			pageNum: pageNum

	};

	formDataArray.forEach(input => {
	
		const value = input.value.trim();
			
		if (value !== '') {
    
			formData[input.name] = value;

		}

	});

	console.log("검색 조건이 입력 된 것만 json에 추가하기 search", JSON.stringify(formData));

	saveSearchCondition(formData);

	$.ajax({

		url: "/project/search",
        type: "POST",
        contentType: "application/json",
        dataType: "json",
        data: JSON.stringify(formData),
        success: function (data) {

			console.log(data);
    
    		var projectList = data.projectList;
			var totalCount = data.totalCount;

            if (projectList.length === 0) {
	        
            	bodyHtml = '<tr class="tBody">';
                bodyHtml += '<td colspan="10" class="noData">검색 결과가 없습니다.</td>';
                bodyHtml += '</tr>';
                $("#appendBody").empty().append(bodyHtml);
    		} else {
        
    			bodyHtml = "";
        		$.each(projectList, function (index, item) {
            
        			bodyHtml += '<tr class="tBody">';
                    bodyHtml += '<td class="ckpjtNo"><input name="code" type="checkbox" ' + item.pjtNo + '></td>';
                    bodyHtml += '<td class="pjtNo"><a href="/project/modify?pjtNo=' + item.pjtNo + '">' + item.pjtNo + "</a></td>";
                    bodyHtml += '<td class="pjtNm">' + item.pjtNm + "</td>";
                    bodyHtml += '<td class="companyNm">' + item.companyNm + "</td>";
                    bodyHtml += '<td class="inoffiSts">' + item.pjtFromDate + "</td>";
                    bodyHtml += '<td class="entrDate">' + item.pjtToDate + "</td>";
                    bodyHtml += '<td class="member">';
                    bodyHtml += '<form action="/project/projectMembers" method="post" style="display: inline;">';
	                 
                    // formData에 있는 모든 필드를 hidden input으로 추가
	                    for (const key in formData) {
	                        
	                    	if (formData.hasOwnProperty(key)) {
                            
	                    		const value = formData[key];
                            
	                    		bodyHtml += '<input type="hidden" name="' + key + '" value="' + value + '">';
	                        
	                    	}
	                    
	                    }
					bodyHtml += '<input type="hidden" name="pjtNo" value="' + item.pjtNo + '">';
                    bodyHtml += '<button type="submit" class="button small">보기</button>';
                    bodyHtml += '</form>';
                    bodyHtml += '</td></tr>';
        	
        		});

        	$("#appendBody").empty().append(bodyHtml);
    
    		}

       endPage = data.endPage;
       startPage = data.startPage;
       prev = data.prev;
       next = data.next;
       pageNum = data.pageNum;
       realEnd = data.realEnd;

		console.log("endPage ======================== : ===================" + endPage);
		console.log("pageNum ====================== : ================" + pageNum);

        createPaginationUI(pageNum, startPage, endPage, prev, next, realEnd);

        },

        error: function (xhr, status, error) {
    
        	console.error(error);

        }

	});

}

function loadData(formData) {

	console.log("여기 loadData===================================");
	console.log("loadData에서 받아온 formData: ", JSON.stringify(formData));
	console.log("=============================="+formData.pageNum+"===========================");


	$.ajax({
        
		url:  "/project/search",
        type: "POST",
        contentType: "application/json",
        dataType: "json",
        data: JSON.stringify(formData),
        success: function (data) {
    

            console.log(data);
        	var projectList = data.projectList;
			var totalCount = data.totalCount;

            if (projectList.length === 0) {
	        
            	bodyHtml = '<tr class="tBody">';
                bodyHtml += '<td colspan="10" class="noData">검색 결과가 없습니다.</td>';
                bodyHtml += '</tr>';
                $("#appendBody").empty().append(bodyHtml);
    		} else {
        
    			bodyHtml = "";
        		$.each(projectList, function (index, item) {
            
        			bodyHtml += '<tr class="tBody">';
                    bodyHtml += '<td class="ckpjtNo"><input name="code" type="checkbox" ' + item.pjtNo + '></td>';
                    bodyHtml += '<td class="pjtNo"><a href="/project/modify?pjtNo=' + item.pjtNo + '">' + item.pjtNo + "</a></td>";
                    bodyHtml += '<td class="pjtNm">' + item.pjtNm + "</td>";
                    bodyHtml += '<td class="companyNm">' + item.companyNm + "</td>";
                    bodyHtml += '<td class="inoffiSts">' + item.pjtFromDate + "</td>";
                    bodyHtml += '<td class="entrDate">' + item.pjtToDate + "</td>";
                    bodyHtml += '<td class="member">';
                    bodyHtml += '<form action="/project/projectMembers" method="post" style="display: inline;">';
	                 
                    // formData에 있는 모든 필드를 hidden input으로 추가
	                    for (const key in formData) {
	                        
	                    	if (formData.hasOwnProperty(key)) {
                            
	                    		const value = formData[key];
                            
	                    		bodyHtml += '<input type="hidden" name="' + key + '" value="' + value + '">';
	                        
	                    	}
	                    
	                    }
					bodyHtml += '<input type="hidden" name="pjtNo" value="' + item.pjtNo + '">';
                    bodyHtml += '<button type="submit" class="button small">보기</button>';
                    bodyHtml += '</form>';
                    bodyHtml += '</td></tr>';
        	
        		});

        	$("#appendBody").empty().append(bodyHtml);
    
    		}

       endPage = data.endPage;
       startPage = data.startPage;
       prev = data.prev;
       next = data.next;
       pageNum = data.pageNum;
       realEnd = data.realEnd;

		console.log("endPage ======================== : ===================" + endPage);
		console.log("pageNum ====================== : ================" + pageNum);

        createPaginationUI(pageNum, startPage, endPage, prev, next, realEnd);

        },

        error: function (xhr, status, error) {
    
        	console.error(error);

        }

	});

}



function createPaginationUI(pageNum, startPage, endPage, prev, next, realEnd) {

var paginationHtml = '<div>'; // 페이징 UI를 감싸는 div 태그 열기

if (prev) {

	paginationHtml += '<a href="#" onclick="goPage(' + (startPage - 1) + ')">이전</a>';

}

for (var i = startPage; i <= endPage; i++) {

	if (i === pageNum) {
    
		paginationHtml += '<code>' + i + '</code>';

	} else {
    
		paginationHtml += '<a class="changePage" href="#" onclick="goPage(' + i + ')"><code>' + i + '</code></a>';

	}

}

if (endPage < realEnd) {

	paginationHtml += '<a href="#" onclick="goPage(' + (endPage + 1) + ')">다음</a>';

}

paginationHtml += '</div>'; // 페이징 UI를 감싸는 div 태그 닫기

$("#pagination").empty().append(paginationHtml);

}



function clearSession() {

	sessionStorage.clear();

}


//"취소" 버튼 클릭 시
$("#cancelButton").click(function () {

	// 세션 스토리지 초기화
	clearSession();


	// 검색 결과 영역 초기화
	$("#appendBody").empty();

	// 페이징 초기화
	$("#pagination").empty();

	// 검색 조건 초기화
	$("#unmInput").val("");
    $("#jobSkillInput").val("");
    $("#inoffiStsInput").val("");
    $("#dateInput1").val("");
    $("#dateInput2").val("");

    // "검색 결과가 없습니다." 메시지 표시
    let bodyHtml = '<tr class="tBody">';
    bodyHtml += '<td colspan="10" class="noData">검색 결과가 없습니다.</td>';
    bodyHtml += '</tr>';

    $("#appendBody").empty().append(bodyHtml);

});





</script>
<script>
function validateDateRange() {
    var startDate = new Date(document.getElementById('dateInput1').value);
    var endDate = new Date(document.getElementById('dateInput2').value);

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