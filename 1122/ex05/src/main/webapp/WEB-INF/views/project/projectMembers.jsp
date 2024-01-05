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
					<h1>프로젝트 인원관리</h1>
				</header>
				<!-- Table -->
				<div class="content">
					<div class="form">
							<table border="1">
								<tr>
									<td>프로젝트 명</td>
									<td><input type="text" name="pjtNm" value="${projectMembers[0].pjtNm}" readonly></td>
									<td>고객 사명</td>
									<td><input type="text" name="companyNm" value="${projectMembers[0].unm}"readonly></td>
								</tr>
								<tr>	
									<td>시작일</td>
									<td><input type="date" name="pjtFromDate"  id="dateInput1" value="${projectMembers[0].pjtFromDate}"></td>
									<td>종료일</td>
									<td><input type="date" name="pjtToDate" readonly disabled id="dateInput2" value="${projectMembers[0].pjtToDate}"></td>
								</tr>
							</table>
								<div style="text-align: right; margin-bottom: 25px;">
    								<form action="/project/addProjectMember" method="post" style="display: inline;">
        								<input type="hidden" name="pjtNo" value="${pjtNo}">
        								<input type="hidden" name="pjtToDate" value="${projectMembers[0].pjtToDate}">
        								<button type="submit" class="button" style="font-size: 16px;">인원 추가</button>
    								</form> &nbsp;&nbsp;&nbsp;&nbsp;
    									<input type="button" value="수정" onclick="changeProjectUsers('update')">&nbsp;&nbsp;&nbsp;
								</div>
							<table style="text-align:center;">
								<thead>
									<tr>
										 <td><input type="checkbox" id="selectAllCheckbox" onchange="selectAllCheckboxes();"></td>
										 <td>사번</td>
										 <td>성명</td>
										 <td>투입일</td>
										 <td>철수일</td>
										 <td>역할</td>
									</tr>
								</thead>
								<tbody>
									<c:choose>
	        							<c:when test="${projectMembers == null or projectMembers[0].uno == null}">
	            							<tr>
	                							<td colspan="6">프로젝트가 없습니다.</td>
	            							</tr>
	        							</c:when>
        							<c:otherwise>
            							<c:forEach var="project" items="${projectMembers}" varStatus="loop">
					                    	<tr>
						                        <td><input type="checkbox" name="projectCheckbox" value="${project.uno}-${project.pjtNo}"></td>
						                        <td>${project.uno}</td>
						                        <td>${project.unm}</td>
						                        <td><input type="date" value="${project.inpDate}"></td>
						                        <td><input type="date" value="${project.wdpDate}"></td>
						                        <td>
						                        	<select name="jobRank">
														<option value="${project.pjtRole}" ${project.pjtRole != null ? 'selected' : ''}></option>
														<option value="01" ${project.pjtRole == '01' ? 'selected' : ''}>Project Manager</option>
														<option value="02" ${project.pjtRole == '02' ? 'selected' : ''}>Project Leader</option>
														<option value="03" ${project.pjtRole == '03' ? 'selected' : ''}>Application Architect</option>
														<option value="04" ${project.pjtRole == '04' ? 'selected' : ''}>Technical Architect</option>
														<option value="05" ${project.pjtRole == '05' ? 'selected' : ''}>Data Architect</option>
														<option value="06" ${project.pjtRole == '06' ? 'selected' : ''}>Quality Architect</option>
														<option value="07" ${project.pjtRole == '07' ? 'selected' : ''}>Business Architect</option>
														<option value="08" ${project.pjtRole == '08' ? 'selected' : ''}>Developer</option>
													</select>
												</td>
					                    	</tr>
            							</c:forEach>
        							</c:otherwise>
    							</c:choose>
    							</tbody>
   								<tfoot>
	   								<tr>
										<td colspan="6">
											<div style="text-align: right;">
												<input type="button" value="삭제" onclick="changeProjectUsers('delete')">
												&nbsp;&nbsp;&nbsp;&nbsp; 
												<form action='/project/list' method='post' style="display: inline;">
        											<input type="hidden" name="uno" value="${uno}">
        											<input type="button" value="취소" onclick="location.href = '/project/list'">
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

	function changeProjectUsers(action) {
	    // 선택된 프로젝트 정보 수집
	    var selectedProjects = [];
	    
	    // 체크박스가 하나도 선택되지 않은 경우 알림 띄우기
	    if ($('input[name="projectCheckbox"]:checked').length === 0) {
	        alert("수정 또는 삭제할 프로젝트를 선택해주세요.");
	        return;
	    }
	    
	    $('input[name="projectCheckbox"]:checked').each(function() {
	        
	    	var values = $(this).val().split("-");
	        var uno = values[0];
	        var pjtNo = values[1];
	        var inpDate = $(this).closest('tr').find('input[type="date"][value]').eq(0).val();
	        var wdpDate = $(this).closest('tr').find('input[type="date"][value]').eq(1).val();
	        var pjtRole = $(this).closest('tr').find('select[name="jobRank"]').val();

	     	// console.log를 사용하여 선택된 아이템의 값들을 확인
	        console.log("uno: " + uno + ", pjtNo: " + pjtNo + ", inpDate: " + inpDate + ", wdpDate: " + wdpDate + ", pjtRole: " + pjtRole + ",action:" + action);

        	selectedProjects.push({
	            
	       		uno: uno,
	            pjtNo: pjtNo,
	            inpDate: inpDate,
	            wdpDate: wdpDate,
	            pjtRole: pjtRole,
	            action: action  // 수정 또는 삭제 여부를 추가
	            
        	});
    
	    });

    // AJAX를 이용해 서버로 전송
    	$.ajax({
        
    		type: "POST",
	        url: "/project/changeProjectUsers",
	        contentType: "application/json",
	        data: JSON.stringify(selectedProjects),
	        dataType: "json",
	        success: function(response) {
            
	        	   // 성공적으로 업데이트된 경우에 수행할 동작
	            if (response.updateResult) {
	                
	            	alert(response.updateResult);
	            	 location.reload(); // 페이지 리로드
	            }
	            
	            // 성공적으로 삭제된 경우에 수행할 동작
	            if (response.deleteResult) {
	                
	            	alert(response.deleteResult);
	            	 location.reload(); // 페이지 리로드
	            }
	        
	        	},error: function(error) {
	            // 에러 처리
	            alert("프로젝트 사원정보 수정 중 오류가 발생했습니다.");
	        	  }
	            
    	});

	}

</script>

<script>

function selectAllCheckboxes() {
    // 전체 체크박스의 상태를 가져옴
    var isAllChecked = $('#selectAllCheckbox').prop('checked');

    // 모든 체크박스의 상태를 전체 선택 버튼과 동일하게 설정
    $('input[name="projectCheckbox"]').prop('checked', isAllChecked);
}
</script>

<script>

</script>


</html>