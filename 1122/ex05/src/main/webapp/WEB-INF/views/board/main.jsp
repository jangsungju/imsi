<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Board</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<style>
* {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
	color: white;
}

div {
	width: 10%;
	background-color: lightblue;
	margin: 10px;
}

div h3 {
	text-align: center;
}
</style>
</head>
<body>
	<header style="text-align: center;">
		<h1>사원관리 페이지 입니다</h1>
	</header>
	<hr>
	<nav>
		<div>
			<label><a href="/board/list"><h3>사원관리</h3></a></label>
		</div>
		<div>
			<label><a href="/project/list"><h3>프로젝트 관리</h3></a></label>
		</div>
	</nav>
</body>
</html>