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

/* 수정창에서 읽기 전용 상태에서 포커스 시 스타일 지정 */
input[readonly]:focus {
    outline: none; /* 포커스 효과 제거 */
    cursor: not-allowed; /* 커서 모양 변경 */
    background-color: #f2f2f2; /* 포커스 시 배경색 유지 */
    border: 1px solid #ccc; /* 포커스 시 테두리 스타일 유지 */
    color: #666; /* 포커스 시 글자색 유지 */
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
					<h1>사원정보 수정하기</h1>
				</header>
				<!-- Table -->
				<div class="content">
					<div class="form">
						<form action="/board/modify" method="post">
							<table border="1">
								<tr>
									<td colspan="6">사원정보 수정</td>
								</tr>
								<tr>
									<td colspan="2" rowspan="4">사진<input type="file"
										name="photo"></td>
									<td>사번</td>
									<td>
									<input type="text" name="uno" value="${member.uno}"
										readonly></td>
									<td>이 름</td>
									<td><input type="text" name="unm" value="${member.unm}"
										readonly></td>
								</tr>
								<tr>
									<td>생년월일</td>
									<td><input type="date" name="birth" value="${member.birth}" readonly></td>
									<td>성별</td>
									<td><input type="text" name="sex" value="${member.sex}" readonly></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type="password" name="pwd"
										placeholder="새로운 비밀번호를 입력해주세요."></td>
									<td>비밀번호 확인</td>
									<td><input type="password" name="pwd_re"
										placeholder="비밀번호 확인"></td>
								</tr>
								<tr>
									<td>이메일</td>
									<td><input type="text" name="emailAddr"
										value="${member.emailAddr}"></td>
									<td>핸드폰</td>
									<td><input type="text" name="mblNo"
										value="${member.mblNo}"></td>
								</tr>
								<tr>
									<td colspan="2">재직 상태</span></td>
									<td><select name="inoffiSts">
											<option value=""></option>
											<option value="01"
											${member.inoffiSts == '01' ? 'selected' : ''}>재직</option>
											<option value="02" 
											${member.inoffiSts == '02' ? 'selected' : ''}>휴직</option>
											<option value="03"
											${member.inoffiSts == '03' ? 'selected' : ''}>퇴직</option>
									</select></td>
									<td colspan="2">직 급</td>
									<td><select name="jobRank">
											<option value=""></option>
											<option value="01"
												${member.jobRank == '01' ? 'selected' : ''}>사장</option>
											<option value="02"
												${member.jobRank == '02' ? 'selected' : ''}>상무</option>
											<option value="03"
												${member.jobRank == '03' ? 'selected' : ''}>이사</option>
											<option value="04"
												${member.jobRank == '04' ? 'selected' : ''}>부장</option>
											<option value="05"
												${member.jobRank == '05' ? 'selected' : ''}>차장</option>
											<option value="06"
												${member.jobRank == '06' ? 'selected' : ''}>과장</option>
											<option value="07"
												${member.jobRank == '07' ? 'selected' : ''}>대리</option>
											<option value="08"
												${member.jobRank == '08' ? 'selected' : ''}>사원</option>
									</select></td>
								</tr>
								<tr>
									<td colspan="2">기술 등급</span></td>
									<td><select name="jobSkill">
											<option value=""></option>
											<option value="01"
											${member.jobSkill == '01' ? 'selected' : ''}>특급</option>
											<option value="02"
											${member.jobSkill == '02' ? 'selected' : ''}>고급</option>
											<option value="03"
											${member.jobSkill == '03' ? 'selected' : ''}>중급</option>
											<option value="04"
											${member.jobSkill == '04' ? 'selected' : ''}>초급</option>
									</select></td>
									<td>개발 분야</td>
									<td><select name="devPt">
											<option value=""></option>
											<option value="01"
											${member.devPt == '01' ? 'selected' : ''}>풀스텍</option>
											<option value="02"
											${member.devPt == '02' ? 'selected' : ''}>백엔드</option>
											<option value="03"
											${member.devPt == '03' ? 'selected' : ''}>프론트엔드</option>
									</select></td>
								</tr>
								<tr>
									<td colspan="2">입 사 일</td>
									<td><input type="date" name="entrDate" min="1960-01-01"
										id="dateInput" value="${member.entrDate}"></td>
									<td colspan="2">보관여부</td>
									<td><select name="deleteCol">
											<option value=""></option>
											<option value="01"
											${member.deleteCol == '01' ? 'selected' : ''}>삭제</option>
											<option value="02"
											${member.deleteCol == '02' ? 'selected' : ''}>보관</option>
								</tr>
								<tr>
									<td colspan="6">
										<div style="text-align: right;">
											<input type="submit" value="수정">
											&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="취소"
												onclick="goBack()">
										</div>
									</td>
								</tr>
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
</html>