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
									class="form-input" id="jobSkillInput" >
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
									class="form-input" id="inoffiStsInput">
										<option value=""></option>
										<option value="01">재직</option>
										<option value="02">휴직</option>
										<option value="03">퇴직</option>
								</select>
								</label>
							</div>
						</div>
						<div class="form-ent" style="text-align: left;">
							<label class="form-label"> 입사일
							<input type="date" name="startDate" min="1990-01-01" class="dateInput"
				                    id="dateInput1" oninput="limitDateInput()"> ~ 
								<input type="date" name="endDate"
								min="1990-01-01" class="dateInput" id="dateInput2" oninput="limitDateInput()">
							</label>
						</div>
						<div class="form-submit">
							<input type="button" value="조회" onclick="search2();">
							<!--<input type="button" value="조회2" id="testBtn" />  -->
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
				<div id="pagination"></div>
				</div>
				<div style="text-align: right;">
					<input type="button" value="등록"
						onclick="location.href='/board/register'">
					&nbsp;&nbsp;&nbsp; <input type="button" value="삭제">
					&nbsp;&nbsp;&nbsp; <input type="reset" value="취소">
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



const pageSize = 10; // 페이지당 표시할 데이터 개수
let currentPage = 1; // 현재 페이지 번호
let totalPage = 0; // 전체 페이지 개수



//1. 버튼을 클릭한다.
function search2() {
  let bodyHtml = "";

  var pageNum = 1;
  var amount = 10;
  // 검색 조건 가져오기
  var formData = {
    unm: $("#unmInput").val(),
    jobSkill: $("#jobSkillInput").val(),
    inoffiSts: $("#inoffiStsInput").val(),
    startDate: $("#dateInput1").val(),
    endDate: $("#dateInput2").val(),
    pageNum: pageNum, // 처음 시작 페이지
    amount: amount // 한 번에 보여줄 데이터 개수
  };

  $.ajax({
    url: "/board/search",
    type: "POST",
    contentType: "application/json",
    dataType: "json",
    data: JSON.stringify(formData),
    success: function(data) {
      alert("성공");

      var memberList = data.memberList;
      var totalCount = data.totalCount;
      // 결과값을 확인 후 grid에 뿌려주기
      console.log("결과값 data == ", data);

      if (memberList.length === 0) {
        bodyHtml = '<tr class="tBody">';
        bodyHtml += '<td colspan="10" class="noData">검색 결과가 없습니다.</td>';
        bodyHtml += '</tr>';
        $("#appendBody").empty().append(bodyHtml);
      } else {
        bodyHtml = "";
        $.each(memberList, function(index, item) {
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
    },
    error: function(xhr, status, error) {
      console.error(error);
    }
  });

  currentPage = 1;
  loadData();
}

//초기화
loadData();

//검색 버튼 클릭 이벤트에 search2 함수 바인딩
$("input[type='button']").click(search2);

function createPaginationUI() {
  // 이전 페이지로 이동하는 버튼 생성
  const prevButton = document.createElement('button');
  prevButton.innerText = '이전';
  prevButton.addEventListener('click', () => {
    if (currentPage > 1) {
      currentPage--;
      loadData();
    }
  });

  // 다음 페이지로 이동하는 버튼 생성
  const nextButton = document.createElement('button');
  nextButton.innerText = '다음';
  nextButton.addEventListener('click', () => {
    if (currentPage < totalPage) {
      currentPage++;
      loadData();
    }
  });

  // 페이지 버튼 생성 로직 작성
  const paginationContainer = document.getElementById('pagination');
  paginationContainer.innerHTML = '';
  paginationContainer.appendChild(prevButton);
  paginationContainer.appendChild(nextButton);
}

function loadData() {
  // 서버에 현재 페이지에 해당하는 데이터 요청을 보내고, 응답을 받아서 처리하는 로직 작성
  const requestData = {
    pageNum: currentPage,
    amount: pageSize
  };

  // AJAX 요청
  $.ajax({
    url: '/board/search', // 실제 요청 주소를 적절히 수정해야 합니다.
    type: 'POST',
    data: JSON.stringify(requestData),
    contentType: 'application/json',
    success: function(response) {
      // 서버로부터 받은 응답을 처리하는 로직을 작성해야 합니다.
      var memberList = response.memberList;

      // TODO: 받은 데이터를 사용하여 표시하는 로직 작성
      if (memberList.length === 0) {
        let bodyHtml = '<tr class="tBody">';
        bodyHtml += '<td colspan="10" class="noData">검색 결과가 없습니다.</td>';
        bodyHtml += '</tr>';
        $("#appendBody").empty().append(bodyHtml);
      } else {
        let bodyHtml = "";
        $.each(memberList, function(index, item) {
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

      // 페이지네이션 UI 갱신
      totalPage = Math.ceil(response.totalCount / pageSize);
      createPaginationUI();
    },
    error: function(error) {
      console.error('Error:', error);
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
</script>
	
<script>

function limitDateInput() {
	  // 시작 날짜 입력 요소
	  var startDateInput = document.getElementById("dateInput1");
	  // 종료 날짜 입력 요소
	  var endDateInput = document.getElementById("dateInput2");

	  // 현재 날짜
	  var currentDate = new Date();

	  // 입력된 년도, 월, 일
	  var startYear = parseInt(startDateInput.value.substr(0, 4));
	  var startMonth = parseInt(startDateInput.value.substr(5, 2));
	  var startDay = parseInt(startDateInput.value.substr(8, 2));
	  var endYear = parseInt(endDateInput.value.substr(0, 4));
	  var endMonth = parseInt(endDateInput.value.substr(5, 2));
	  var endDay = parseInt(endDateInput.value.substr(8, 2));

	  // 현재 년도와 월
	  var currentYear = currentDate.getFullYear();
	  var currentMonth = currentDate.getMonth() + 1; // getMonth()는 0부터 시작하므로 1을 더해줌

	  // 입력된 년도가 현재 년도보다 큰 경우, 현재 년도까지만 입력 가능
	  if (startYear > currentYear) {
	    startDateInput.value = currentDate.toISOString().split("T")[0];
	    startYear = currentYear;
	  }
	  if (endYear > currentYear) {
	    endDateInput.value = currentDate.toISOString().split("T")[0];
	    endYear = currentYear;
	  }

	  // 입력된 월이 현재 월보다 큰 경우, 현재 월로 변경
	  if (startYear === currentYear && startMonth > currentMonth) {
	    startDateInput.value = currentYear + "-" + ("0" + currentMonth).slice(-2) + "-" + ("0" + startDay).slice(-2);
	    startMonth = currentMonth;
	  }
	  if (endYear === currentYear && endMonth > currentMonth) {
	    endDateInput.value = currentYear + "-" + ("0" + currentMonth).slice(-2) + "-" + ("0" + endDay).slice(-2);
	    endMonth = currentMonth;
	  }

	  // 입력된 월의 마지막 날짜 가져오기
	  var startMonthLastDay = new Date(startYear, startMonth, 0).getDate();
	  var endMonthLastDay = new Date(endYear, endMonth, 0).getDate();

	  // 2월의 마지막 날짜 처리
	  if (startMonth === 2 && startDay > startMonthLastDay) {
	    if ((startYear % 4 === 0 && startYear % 100 !== 0) || startYear % 400 === 0) {
	      startDateInput.value = startYear + "-" + ("0" + startMonth).slice(-2) + "-" + ("0" + startMonthLastDay).slice(-2);
	    } else {
	      startDateInput.value = startYear + "-" + ("0" + startMonth).slice(-2) + "-28";
	    }
	  }

	  if (endMonth === 2 && endDay > endMonthLastDay) {
	    if ((endYear % 4 === 0 && endYear % 100 !== 0) || endYear % 400 === 0) {
	      endDateInput.value = endYear + "-" + ("0" + endMonth).slice(-2) + "-" + ("0" + endMonthLastDay).slice(-2);
	    } else {
	      endDateInput.value = endYear + "-" + ("0" + endMonth).slice(-2) + "-28";
	    }
	  }
	}

</script>
</html>