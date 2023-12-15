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


table {
    table-layout: fixed; /* 테이블 레이아웃을 고정으로 설정 */
    width: 100%; /* 테이블 전체의 너비를 100%로 설정 */
}

/* 첫 번째 열의 너비를 5%로 설정 */
.project-table th:first-child,
.project-table td:first-child {
    width: 5%;
}

/* 나머지 열의 너비를 균등하게 설정 */
.project-table th:not(:first-child),
.project-table td:not(:first-child) {
    width: calc(95% / 4);
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
							<input type="hidden" name="entrDate" value="${entrDate}">
							<table class="search-table" style="text-align:center;">
								<tr>
									<td>프로젝트명</td>
									<td><input type="text" name="pjtNm"></td>
									<td>고객사명</td>
									<td>
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
									</td>
							</table>
								<div style="text-align: right;">
									<input type="button" value="조회" onclick="searchNotAddUserProjects();">
								</div>
						</form>
							<table class="project-table" style="text-align: center;">
								<thead>
									<tr class="tHead">
										 <td style="text-align: center;"><input type="checkbox" id="selectAllCheckbox" onchange="selectAllCheckboxes();"></td>
										 <td>프로젝트명</td>
										 <td>고객사명</td>
										 <td>시작일</td>
										 <td>종료일</td>
									</tr>
								</thead>
								<tbody id="projectTableBody">
    								<tr class="tBody">
        								<td colspan="10" class="noData">검색 결과가 없습니다.</td>
    								</tr>
	    							<c:forEach var="project" items="${addUserProject}" varStatus="loop">
        								<tr>
								            <td><input type="checkbox"  name="addProjectCheckbox" value="${uno}-${project.pjtNo}"></td>
								            <td>${project.pjtnm}</td>
								            <td>${project.companyNm}</td>
								            <td><input type="date" value="${project.pjtFromDate}" disabled></td>
								            <td><input type="date" value="${project.pjtToDate}" disabled></td>
        								</tr>
	    							</c:forEach>
								</tbody>
	   							<tfoot>	
	   								<tr>
	   									<td colspan="5">
	   										<div id="pagination" style="text-align:center;"></div>
	   									</td>
	   								</tr>
	   								<tr>
										<td colspan="5">
											<div style="text-align: right;">
												<input type="button" value="추가" onclick="addUserProject()">
												&nbsp;&nbsp;&nbsp;&nbsp; 
    											<form action='/board/userProject' method='post' style="display: inline;">
        											<input type="hidden" name="uno" value="${uno}">
        											<input type="hidden" name="entrDate" value="${entrDate}">
        											<button type="submit" class="button" style="font-size: 16px;">취소</button>
    											</form>
											</div>
										</td>
									</tr>
							 	</tfoot>		
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

<script>

    let amount = 5;
    let pageNum = 1; // 현재 페이지 번호
	let endPage;
	let startPage;
	let currentPage;
	let realEnd;
	let prev, next;
	let formData = null; // 현재 검색 조건 데이터

	
	function goPage(item) {
	    console.log("goPage!!? PageNum : " + item);
	    
	    if (item !== currentPage) {
	        currentPage = item;
	        formData.pageNum = currentPage;
	    
	        console.log("검색 조건이 입력 된 것만 json에 추가하기 goPage", JSON.stringify(formData));

	        loadData(formData);
	    }
	}
	
	
	
	function searchNotAddUserProjects(){
	 
		pageNum = 1;
		let formDataArray = $('#searchNotAddProject').serializeArray();

		formData = {
			    uno: $('[name="uno"]').val()
			    , entrDate: $('[name="entrDate"]').val()
			    , amount: amount
			    , pageNum: pageNum
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
	            
	        
	            console.log("====검색 결과====:", result); // 검색 결과 출력
	            
	            // 테이블에 결과 추가
	            appendSearchResultToTable(result);
	           
					endPage = result.endPage;
					startPage = result.startPage;
					prev = result.prev;
					next = result.next;
					pageNum = result.pageNum;
					realEnd = result.realEnd;

					console.log("SearchNotADDendPage ======================== : ===================" + endPage);
					console.log("SearchNotADDFirstpageNum ====================== : ================" + pageNum);

		            createPaginationUI(pageNum, startPage, endPage, prev, next, realEnd);
	        
	        },
	        error: function(error) {
	            console.log("Error during project search:", error);
	        }
	    });
	}

	function appendSearchResultToTable(result) {
	    var tbody = $('#projectTableBody');

	    // 기존의 내용을 지웁니다.
	    tbody.empty();

	    // 검색 결과를 순회하며 각각의 프로젝트를 테이블에 추가합니다.
	    for (var i = 0; i < result.projectLists.length; i++) {
	        var project = result.projectLists[i];

	        console.log(project);
	        // 새로운 행 생성
	        var row = $('<tr>');

	        // 체크박스 열
	        var checkboxCell = $('<td>').append('<input type="checkbox" name="addProjectCheckbox" value="' + result.uno + '-' + project.pjtNo + '">');
	        row.append(checkboxCell);

	        // 프로젝트명 열
	        var pjtnmCell = $('<td>').text(project.pjtNm);
	        row.append(pjtnmCell);

	        // 고객사명 열
	        var companyNmCell = $('<td>').text(project.companyNm);
	        row.append(companyNmCell);

	        // 시작일 열
	        var pjtFromDateCell = $('<td>').append('<input type="date" value="' + project.pjtFromDate + '" disabled>');
	        row.append(pjtFromDateCell);

	        // 종료일 열
	        var pjtToDateCell = $('<td>').append('<input type="date" value="' + project.pjtToDate + '" disabled>');
	        row.append(pjtToDateCell);

	        // 행을 tbody에 추가
	        tbody.append(row);
	    }
	}

	
function createPaginationUI(pageNum, startPage, endPage, prev, next, realEnd) {
    	
	   console.log("PagingUI==================pageNum=============" + pageNum);
	
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
	
function loadData(formData) {
    
	console.log("여기 loadData===================================");
	console.log("=============================="+formData.pageNum+"===========================");


	$.ajax({
        
		url: "/board/searchNotAddUserProjects",
        type: "POST",
        contentType: "application/json",
        dataType: "json",
        data: JSON.stringify(formData),
        success: function(result) {
            
	        
            console.log("검색 결과:", result); // 검색 결과 출력
            
            // 테이블에 결과 추가
            appendSearchResultToTable(result);
           
            	endPage = result.endPage;
	           startPage = result.startPage;
	           prev = result.prev;
	           next = result.next;
	           pageNum = result.pageNum;
	           realEnd = result.realEnd;

				console.log("endPage ======================== : ===================" + endPage);
				console.log("pageNum ====================== : ================" + pageNum);

	            createPaginationUI(pageNum, startPage, endPage, prev, next, realEnd);
        
        },
        error: function(error) {
            console.log("Error during project search:", error);
        }
    });
}
	
</script>
<script>

function selectAllCheckboxes() {
    // 전체 체크박스의 상태를 가져옴
    var isAllChecked = $('#selectAllCheckbox').prop('checked');

    // 모든 체크박스의 상태를 전체 선택 버튼과 동일하게 설정
    $('input[name="addProjectCheckbox"]').prop('checked', isAllChecked);
}
</script>

<script>
function addUserProject() {
    // 선택된 프로젝트 정보 수집
    var selectedProjects = [];

    $('input[name="addProjectCheckbox"]:checked').each(function() {
        var values = $(this).val().split("-");
        var uno = values[0];
        var pjtNo = values[1];
        var pjtFromDate = $(this).closest('tr').find('input[type="date"]').eq(0).val();
        var pjtToDate = $(this).closest('tr').find('input[type="date"]').eq(1).val();

        // console.log를 사용하여 선택된 아이템의 값들을 확인
        console.log("addUserProject, "+"uno: " + uno + ", pjtNo: " + pjtNo + ", pjtFromDate: " + pjtFromDate + ", pjtToDate: " + pjtToDate);

        selectedProjects.push({
            uno: uno,
            pjtNo: pjtNo,
            pjtFromDate: pjtFromDate,
            pjtToDate: pjtToDate
        });
    });

    // AJAX를 이용해 서버로 전송
    $.ajax({
        type: "POST",
        url: "/board/addUserProjects",
        contentType: "application/json",
        data: JSON.stringify(selectedProjects),
        dataType: "JSON",  // 수정된 부분
        success: function(response) {
        	

        	
        	console.log("==========================response=================="+response.insertResult);
            // 성공적으로 업데이트된 경우에 수행할 동작
            if (response) {
            
            	alert(response.insertResult);


            	 // 새로운 form 요소 생성
                var form = $('<form action="/board/userProject" method="post"></form>');
                
                // form에 필요한 input 추가
                //form.append('<input type="hidden" name="uno" value="' + encodeURIComponent(uno) + '">');
                form.append('<input type="hidden" name="uno" value="' + ${uno} + '">');
                
                // body에 form 추가
                $('body').append(form);
                
                // form submit
                form.submit();
            
            	
            }
        
        	},error: function(error) {
            // 에러 처리
            alert("프로젝트 추가 중 오류가 발생했습니다.");
        
        	}
        	
   
    
    });

}
</script>
</html>
