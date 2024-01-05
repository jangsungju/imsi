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
					<h1>프로젝트 인원 추가</h1>
				</header>
				<!-- Table -->
				<div class="content">
					<div class="form">
							<form id="searchNAPMember">
							<input type="hidden" name="pjtNo" value="${pjtNo}">
							<input type="hidden" name="pjtToDate" value="${pjtToDate}">
							<table class="search-table" style="text-align:center; width:40%; float: left;">
								<tr>
									<td>이름</td>
									<td><input type="text" name="unm"></td>
							</table>
								<div style="text-align: right; margin-right: 135px;">
									<input type="button" value="조회" onclick="searchNAPMembers();">
								</div>
						</form>
							<table class="project-table" style="text-align: center;">
								<thead>
									<tr class="tHead">
										 <td style="text-align: center;"><input type="checkbox" id="selectAllCheckbox" onchange="selectAllCheckboxes();"></td>
										 <td>사번</td>
										 <td>이름</td>
										 <td>직급</td>
										 <td>기술등급</td>
									</tr>
								</thead>
								<tbody id="memberNAPTableBody">
    								<tr class="tBody">
        								<td colspan="10" class="noData">검색 결과가 없습니다.</td>
    								</tr>
	    							<c:forEach var="member" items="${memberNAPList}" varStatus="loop">
        								<tr>
								            <td><input type="checkbox"  name="addMemberCheckbox" value="${uno}-${project.pjtNo}"></td>
								            <td>${project.uno}</td>
								            <td>${project.unm}</td>
											<td>
												<select name="jobRank" disabled>
													<option value=""></option>
													<option value="01" ${member.jobRank == '01' ? 'selected' : ''}>사장</option>
													<option value="02" ${member.jobRank == '02' ? 'selected' : ''}>상무</option>
													<option value="03" ${member.jobRank == '03' ? 'selected' : ''}>이사</option>
													<option value="04" ${member.jobRank == '04' ? 'selected' : ''}>부장</option>
													<option value="05" ${member.jobRank == '05' ? 'selected' : ''}>차장</option>
													<option value="06" ${member.jobRank == '06' ? 'selected' : ''}>과장</option>
													<option value="07" ${member.jobRank == '07' ? 'selected' : ''}>대리</option>
													<option value="08" ${member.jobRank == '08' ? 'selected' : ''}>사원</option>
												</select>
											</td>
								            <td>
								            	<select name="jobSkill">
													<option value=""></option>
													<option value="01" ${member.jobSkill == '01' ? 'selected' : ''}>특급</option>
													<option value="02" ${member.jobSkill == '02' ? 'selected' : ''}>고급</option>
													<option value="03" ${member.jobSkill == '03' ? 'selected' : ''}>중급</option>
													<option value="04" ${member.jobSkill == '04' ? 'selected' : ''}>초급</option>
												</select>
											</td>
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
												<input type="button" value="추가" onclick="addProjectMember()">
												&nbsp;&nbsp;&nbsp;&nbsp; 
    											<form action='/project/projectMembers' method='post' style="display: inline;">
        											<input type="hidden" name="pjtNo" value="${pjtNo}">
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
	
	
	
	function searchNAPMembers(){
	 
		pageNum = 1;
		let formDataArray = $('#searchNAPMember').serializeArray();

		formData = {
			    unm: $('[name="unm"]').val()
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
	        url: "/project/searchNAPMembers", // 실제 검색을 처리하는 컨트롤러의 URL로 수정
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
	    var tbody = $('#memberNAPTableBody');

	    // 기존의 내용을 지웁니다.
	    tbody.empty();

	    // 검색 결과가 없을 때
	    if (result.memberNAPList == null || result.memberNAPList.length === 0) {
	        tbody.html('<tr class="tBody"><td colspan="5" class="noData">검색 결과가 없습니다.</td></tr>');
	        return; // 검색 결과가 없으면 함수 종료
	    }

	    // 검색 결과를 순회하며 각각의 프로젝트를 테이블에 추가합니다.
	    for (var i = 0; i < result.memberNAPList.length; i++) {
	        var member = result.memberNAPList[i];

	        console.log(member);
	        // 새로운 행 생성
	        var row = $('<tr>');

	        // 체크박스 열
	        var checkboxCell = $('<td>').append('<input type="checkbox" name="addMemberCheckbox" value="' + result.pjtNo + '-' + member.uno + '">');
	        row.append(checkboxCell);

	        // 사원번호 열
	        var unoCell = $('<td>').text(member.uno);
	        row.append(unoCell);

	        // 이름 열
	        var unmCell = $('<td>').text(member.unm);
	        row.append(unmCell);

	        // 직급 열
	        var jobRankCell = $('<td>').text(member.jobRank);
	        row.append(jobRankCell);

	        // 기술등급 열
	        var jobSkillCell = $('<td>').text(member.jobSkill);
	        row.append(jobSkillCell);

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
        
		url: "/project/searchNAPMembers",
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
    $('input[name="addMemberCheckbox"]').prop('checked', isAllChecked);
}
</script>

<script>
function addProjectMember() {
	 // 선택된 사원 정보 수집
	var selectedMembers = [];
    
 	// 체크박스가 하나도 선택되지 않은 경우 알림 띄우기
    if ($('input[name="addMemberCheckbox"]:checked').length === 0) {
        alert("프로젝트에 추가하고 싶은 사원을 선택해주세요.");
        return;
    }

    $('input[name="addMemberCheckbox"]:checked').each(function() {
        var values = $(this).val().split("-");
        var pjtNo = values[0];
        var uno = values[1];
        var unm = $(this).closest('tr').find('td:eq(2)').text(); // 3번째 열의 텍스트 가져오기

        // console.log를 사용하여 선택된 아이템의 값들을 확인
        console.log("addProjectMember, " + "uno: " + uno + ", pjtNo: " + pjtNo + ", unm: " + unm);

        selectedMembers.push({
            uno: uno,
            pjtNo: pjtNo,
            unm: unm
        });
    });

    // AJAX를 이용해 서버로 전송
    $.ajax({
        type: "POST",
        url: "/project/addProjectMembers",
        contentType: "application/json",
        data: JSON.stringify(selectedMembers),  // 수정된 부분
        dataType: "JSON",
        success: function(response) {
        	

        	console.log("==========================response=================="+response.insertResult);
            // 성공적으로 업데이트된 경우에 수행할 동작
            if (response) {
            
            	alert(response.addtResult);


            	 // 새로운 form 요소 생성
                var form = $('<form action="/project/projectMembers" method="post"></form>');
                
                // form에 필요한 input 추가
                //form.append('<input type="hidden" name="uno" value="' + encodeURIComponent(uno) + '">');
                form.append('<input type="hidden" name="pjtNo" value="' + ${pjtNo} + '">');
                
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
