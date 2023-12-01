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
					<h1><a href="/board/main">사원 관리</a></h1>
				</header>
				<nav class="form-container">
					<form name="searchForm" method="post" id="searchForm">
						<div style="display: inline-block;">
							<div class="form-row">
								<label>이름 :<input type="text" name="unm" id="unmInput" maxlength="5" value="${memberDTO.unm}">
								</label>
							</div>
							<div class="form-row">
								<label class="form-label"> 기술등급 <select name="jobSkill"
									class="form-input" id="jobSkillInput" >
										<option value="" ${memberDTO.jobSkill == '' ? 'selected' : '' }></option>
										<option value="01" ${memberDTO.jobSkill == '01' ? 'selected' : '' }>특급</option>
										<option value="02" ${memberDTO.jobSkill == '02' ? 'selected' : '' }>고급</option>
										<option value="03" ${memberDTO.jobSkill == '03' ? 'selected' : '' }>중급</option>
										<option value="04" ${memberDTO.jobSkill == '04' ? 'selected' : '' }>초급</option>
								</select>
								</label>
							</div>
							<div class="form-row">
								<label class="form-label">재직상태 
								<select name="inoffiSts" class="form-input" id="inoffiStsInput">
									<option value="" ${memberDTO.inoffiSts == '' ? 'selected' : ''}></option>
           							<option value="01" ${memberDTO.inoffiSts == '01' ? 'selected' : ''}>재직</option>
            						<option value="02" ${memberDTO.inoffiSts == '02' ? 'selected' : ''}>휴직</option>
            						<option value="03" ${memberDTO.inoffiSts == '03' ? 'selected' : ''}>퇴직</option>
        							</select>
								</label>
							</div>
						</div>
						<div class="form-ent" style="text-align: left;">
							<label class="form-label"> 입사일
							<input type="date" name="startDate" min="1990-01-01" class="dateInput"
				                    id="dateInput1" oninput="limitDateInput('dateInput1'); validateDateRange()" value="${memberDTO.startDate}">
				           </label>
				                     ~ 
							<label><input type="date" name="endDate"
								min="1990-01-01" class="dateInput" id="dateInput2" oninput="limitDateInput('dateInput2'); validateDateRange()"  value="${memberDTO.endDate}">
							</label>
						</div>
						<div class="form-submit">
							<input type="button" value="조회" onclick="search2();">
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
								<th class="uno">사번</th>
								<th class="unm">성명</th>
								<th class="birth">생년월일</th>
								<th class="sex">성별</th>
								<th class="jobRank">직급</th>
								<th class="jobSkill">기술등급</th>
								<th class="inoffiSts">재직상태</th>
								<th class="entrDate">입사일</th>
								<th class="project">개인 프로젝트 관리</th>
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
							<input type="button" value="등록" onclick="location.href = '/board/register'">
							&nbsp;&nbsp;&nbsp; <input type="button" value="삭제">
							&nbsp;&nbsp;&nbsp; <input type="reset" value="취소">
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
<script>

	const amount = 4; // 페이지당 표시할 데이터 개수
	let pageNum =1; // 현재 페이지 번호
	let endPage; // 전체 페이지 개수
	let startPage;
	let currentPage;
	let realEnd;
	var prev, next;
	let formData = null; // 현재 검색 조건 데이터
    let savedFormData = null;//검색조건 저장해서 넘길거

    
   
    
    function goPage(item) {
        if (item !== currentPage) {
            let localPageNum = item;
            currentPage = localPageNum;
            formData.pageNum = localPageNum;

            // 검색 조건이 저장된 경우 Flash 속성으로 추가
            if (savedFormData) {
                formData = savedFormData;
            }

            loadData(formData);
        }
    }
    

    function search2() {
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

        console.log("검색 조건이 입력 된 것만 json에 추가하기", JSON.stringify(formData));

        $.ajax({
            url: "/board/search",
            type: "POST",
            contentType: "application/json",
            dataType: "json",
            data: JSON.stringify(formData),
            success: function (data) {
                savedFormData = formData;

                console.log("검색조건 저장 확인 ", JSON.stringify(savedFormData));

                console.log(data);
                
                var memberList = data.memberList;
                var totalCount = data.totalCount;

                if (memberList.length === 0) {
                    bodyHtml = '<tr class="tBody">';
                    bodyHtml += '<td colspan="10" class="noData">검색 결과가 없습니다.</td>';
                    bodyHtml += '</tr>';
                    $("#appendBody").empty().append(bodyHtml);
                } else {
                    bodyHtml = "";
                    $.each(memberList, function (index, item) {
                        bodyHtml += '<tr class="tBody">';
                        bodyHtml += '<td class="ckNum"><input name="code" type="checkbox" ' + item.uno + '></td>';
                        bodyHtml += '<td class="uno"><a href="/board/modify?uno=' + item.uno + '">' + item.uno + "</a></td>";
                        bodyHtml += '<td class="unm">' + item.unm + "</td>";
                        bodyHtml += '<td class="birth">' + item.birth + "</td>";
                        bodyHtml += '<td class="sex">' + item.sex + "</td>";
                        bodyHtml += '<td class="jobRank">' + item.jobRank + "</td>";
                        bodyHtml += '<td class="jobSkill">' + item.jobSkill + "</td>";
                        bodyHtml += '<td class="inoffiSts">' + item.inoffiSts + "</td>";
                        bodyHtml += '<td class="entrDate">' + item.entrDate + "</td>";
                        bodyHtml += '<td class="project"><a href="#" class="button small">보기 (' + item.uno + ')</a></td>/tr>';
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
        console.log("뭐야 왜 실행 안되 나와?=============================="+formData.pageNum+"===========================");

        $.ajax({
            url: "/board/search",
            type: "POST",
            contentType: "application/json",
            dataType: "json",
            data: JSON.stringify(formData),
            success: function (data) {
                console.log("검색조건 저장 확인 ", JSON.stringify(savedFormData));

                console.log(data);
                var memberList = data.memberList;
                var totalCount = data.totalCount;

                if (memberList.length === 0) {
                    let bodyHtml = '<tr class="tBody">';
                    bodyHtml += '<td colspan="10" class="noData">검색 결과가 없습니다.</td>';
                    bodyHtml += '</tr>';
                    $("#appendBody").empty().append(bodyHtml);
                } else {
                    let bodyHtml = "";
                    $.each(memberList, function (index, item) {
                        bodyHtml += '<tr class="tBody">';
                        bodyHtml += '<td class="ckNum"><input name="code" type="checkbox" ' + item.uno + '></td>';
                        bodyHtml += '<td class="uno"><a href="/board/modify?uno=' + item.uno + '">' + item.uno + "</a></td>";
                        bodyHtml += '<td class="unm">' + item.unm + "</td>";
                        bodyHtml += '<td class="birth">' + item.birth + "</td>";
                        bodyHtml += '<td class="sex">' + item.sex + "</td>";
                        bodyHtml += '<td class="jobRank">' + item.jobRank + "</td>";
                        bodyHtml += '<td class="jobSkill">' + item.jobSkill + "</td>";
                        bodyHtml += '<td class="inoffiSts">' + item.inoffiSts + "</td>";
                        bodyHtml += '<td class="entrDate">' + item.entrDate + "</td>";
                        bodyHtml += '<td class="project"><a href="#" class="button small">보기 (' + item.uno + ')</a></td>/tr>';
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

		
/* 	function goRegister(){
		
		if (savedFormData) {
			console.log("검색조건 저장 확인 " , savedFormData);
	        // register 페이지로 이동 값을 가지고 이동
	        window.location.href = '/board/register?' + $.param(savedFormData);
	    } else {
	    	// 그냥이동
	    	window.location.href = '/board/register'
	    }
		 
	}*/

	$("input[type='reset']").click(function() {
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
	
	// 뒤로가기및 취소 감지
	window.addEventListener('popstate', function (event) {
	    // 여기서 검색 폼의 값을 이용하여 board/list 페이지 호출
	    
	    loadData(savedFormData);
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