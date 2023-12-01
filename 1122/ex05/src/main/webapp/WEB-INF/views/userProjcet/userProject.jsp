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
</style>
</head>
<body class="is-preload">
	<!-- Main -->
	<div id="main">
		<div class="wrapper">
			<div class="inner">

				<!-- Elements -->
				<header class="major">
					<h1>개인 프로젝트 관리/수정</h1>
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
									<td>사번</td>
									<td>
									<input type="text" name="uno" value="${member.uno}"
										readonly style="background-color: #f2f2f2; border: 1px solid #ccc; color: #666;"></td>
									<td>이 름<span class="redFont">*</span></td>
									<td><input type="text" name="unm" value="${member.unm}"
										readonly></td>
								</tr>
								<tr>
									<td>직급</td>
									<td><input type="text" name="jobRank" value="${member.jobRank}" readonly></td>
								</tr>
								<tr>
									<td colspan="2">시 작 일</td>
									<td><input type="date" name="startDate" min="1960-01-01" class="dateInput"
										id="dateInput1" oninput="limitDateInput('dateInput1'); validateDateRange()"></td>
								</tr>
								<tr>
									<td colspan="2">종 료 일</td>
									<td><input type="date" name="endDate" min="1960-01-01" class="dateInput"
										id="dateInput2" oninput="limitDateInput('dateInput2'); validateDateRange()"></td>
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