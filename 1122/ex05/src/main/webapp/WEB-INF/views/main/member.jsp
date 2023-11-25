<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

div{display:inline;}
</style>
<title>사원 관리</title>
</head>
<body>
	<header style="text-align: center;">
		<h1>사원 관리</h1>
	</header>
	<nav>
		<form id="memberSearchForm">
			<div style="">
				이름 <input type="text" name="uNm">
			</div>
			<div>
				기술등급 <select>
					<option>특급</option>
					<option>고급</option>
					<option>중급</option>
					<option>초급</option>				
				</select>

			</div>
			<div>
				재직상태 <select>
					<option>재직</option>
					<option>휴직</option>
					<option>퇴직</option>
				</select>
			</div>
			<div>
				입사일 <input type="date">
			</div>
			<input type="button" value="조회"></button>
		</form>
	</nav>

</body>
</html>