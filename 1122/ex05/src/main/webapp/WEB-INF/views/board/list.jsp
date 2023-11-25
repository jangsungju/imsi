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
					<form name="searchForm" method="post">
						<div style="display: inline-block;">
							<div class="form-row">
								<label>이름 :<input type="text" name="unm" id="unmInput" maxlength="5">
									<input type="hidden" value="N">
								</label>
							</div>
							<div class="form-row">
								<label class="form-label"> 기술등급 <select name="jobSkill"
									class="form-input" id="jobSkillInput" value="R">
										<option value=""></option>
										<option value="01">특급</option>
										<option value="02">고급</option>
										<option value="03">중급</option>
										<option value="04">초급</option>
								</select>
								</label>
							</div>
							<div class="form-row">
								<label class="form-label">재직상태 <select name="inoffiSts"
									class="form-input" id="inoffiStsInput" value="I">
										<option value=""></option>
										<option value="01">재직</option>
										<option value="02">휴직</option>
										<option value="03">퇴직</option>
								</select>
								</label>
							</div>
						</div>
						<div class="form-ent" style="text-align: left;">
							<label class="form-label"> 입사일<input type="date"
								name="startDate" min="1990-01-01" class="dateInput"
								id="dateInput1"> ~ <input type="date" name="endDate"
								min="1990-01-01" class="dateInput" id="dateInput2">
							</label>
						</div>
						<div class="form-submit">
							<input type="button" value="조회" onclick="search2();">
							<!--<input type="button" value="조회2" id="testBtn" />  -->
						</div>
					</form>
				</nav>

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
						
						</tbody>
						<tfoot>
						</tfoot>
					</table>
				</div>
				<div style="text-align: center;">
				    <c:forEach var="num" begin="${pageDTO.startPage}" end="${pageDTO.endPage}">
				      <code><c:out value ="${num}"/></code>
				    </c:forEach>
				</div>
				<div style="text-align: right;">
					<input type="button" value="등록"
						onclick="location.href='/board/register'">
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
document.getElementById('dateInput1').max = new Date().toISOString().split('T')[0];
document.getElementById('dateInput2').max = new Date().toISOString().split('T')[0];
</script>
<script>


$("#testBtn").on("click", function(){
	
	alert("22");
	
	
});


// 1. 버튼을 클릭한다.
function search2(){
	
	
	
	// 2. 서버로 파라미터 전달 후 조회한다.
	// ex)검색조건 등 갖고오기.
	var formData1 = $("form[name=searchForm]").serialize() ;
	console.log("####" , formData1);
	
	// JSON 만들기 샘플
	var sampleData = {};
	sampleData.test = "aa";
	sampleData.test2 = "bb";
	console.log("%%%" , sampleData);
	
	
	
	// 검색 조건 가져오기
	var formData = {
		unm: $("#unmInput").val()
		, jobSkill: $("#jobSkillInput").val()
		, inoffiSts: $("#inoffiStsInput").val()
		, startDate: $("#dateInput1").val()
		, endDate: $("#dateInput2").val()
		, pageNum: 1 //처음시작 페이지
		, amount: 10 //한번에 보여줄 데이터갯수
	};
	

	
	$.ajax({
		url: "/board/search",
		type: "POST",
		contentType: "application/json", // 요청 데이터의 Content-Type 설정
		dataType: 'json',
		data: JSON.stringify(formData), // JavaScript 객체를 JSON 문자열로 변환하여 전달
		success: function(data) {
			$("#appendBody").empty();
			alert("성공");
			
			// 결과값을 확인 후 grid에 뿌려주기
			console.log("결과값 data == " , data);
			
			if(data != null){
				let bodyHtml = "";
				$.each(data, function (index, item) {
					
					bodyHtml += '<tr class="tBody">';
					bodyHtml += '<td class="ckNum"><input name="code" type="checkbox" ' + item.uno + '></td>';
					bodyHtml += '<td class="uno"><a href="/board/modify?uno=' + item.uno +'">'+ item.uno + '</a></td>';
					bodyHtml += '<td class="unm">'+ item.unm +'</td>';
					bodyHtml += '<td class="birth">'+ item.birth +'</td>';
					bodyHtml += '<td class="sex">'+ item.sex +'</td>';
					bodyHtml += '<td class="jobRank">'+ item.jobRank +'</td>';
					bodyHtml += '<td class="jobSkill">'+ item.jobSkill +'</td>';
					bodyHtml += '<td class="inoffiSts">'+ item.inoffiSts +'</td>';
					bodyHtml += '<td class="entrDate">'+ item.entrDate +'</td>';
					bodyHtml += '<td class="project"><a href="#" class="button small">보기 (${uno})</a></td>/tr>';
				});
				
				$("#appendBody").append(bodyHtml);
			}
			else{
				let bodyHtml = "";
				bodyHtml += '<tr class="tBody">';
			}
		},
		error: function(xhr, status, error) {
			console.error(error);
		}
	});
	
	
}

$("input[type='reset']").click(function() {
	// 검색 결과 영역 초기화
	$("#appendBody").empty();
	
	// 검색 조건 초기화
	$("#unmInput").val("");
	$("#jobSkillInput").val("");
	$("#inoffiStsInput").val("");
	$("#dateInput1").val("");
	$("#dateInput2").val("");
});

/*
function updateList(response) {
	  console.log(response);
	  
	  var memberList = response.memberList; // JSON 형식의 데이터를 그대로 memberArray에 할당
      
	  console.log(memberList);
	  
	  var template = "";

	  memberList.forEach (fuction (member) {
	    template += `
	      <tr class="tBody">
	        <td class="ckNum"><input name="code" type="checkbox" ' + member.uno + '></td>
	        <td class="uno"><a href="/board/modify' + member.uno +'">'+ member.uno + '</a></td>
	        <td class="unm">'+ member.unm +'</td>
	        <td class="birth">'+ member.birth +'</td>
	        <td class="sex">'+ member.sex +'</td>
	        <td class="jobRank">'+ member.jobRank +'</td>
	        <td class="jobSkill">'+ member.jobSkill +'</td>
	        <td class="inoffiSts">'+ member.inoffiSts +'</td>
	        <td class="entrDate">'+ member.entrDate +'</td>
	        <td class="project"><a href="#" class="button small">보기 (${uno})</a></td>
	      </tr>
	    `;
	  });

	  if (template === "") {
	    template = "<tr><td colspan='10'>검색 결과가 없습니다.</td></tr>";
	  }

	  // 테이블에 템플릿 추가
	  $("tbody").html(template);
	}

	  function search(e) {
		  e.preventDefault();
		  console.log("조회 버튼이 클릭되었습니다.");

		  // 검색 조건 가져오기
		  var formData = {
		    name: $("#nameInput").val(),
		    jobSkill: $("#jobSkillInput").val(),
		    inoffiSts: $("#inoffiStsInput").val(),
		    startDate: $("#dateInput1").val(),
		    endDate: $("#dateInput2").val()
		  };

		  // AJAX 요청 보내기
		  $.ajax({
		    url: "/board/search",
		    type: "POST",
		    contentType: "application/json", // 요청 데이터의 Content-Type 설정
		    data: JSON.stringify(formData), // JavaScript 객체를 JSON 문자열로 변환하여 전달
		    success: function(response) {
		      console.log(response);
		      // 리스트 화면 업데이트
		      updateList(response);
		    },
		    error: function(xhr, status, error) {
		      console.error(error);
		    }
		  });
		}
	  
*/
</script>
</html>