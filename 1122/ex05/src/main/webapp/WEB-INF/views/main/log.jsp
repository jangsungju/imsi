<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사원관리 페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
 
        section {
            padding: 20px;
        }

        #login-form {
            max-width: 300px;
            margin: 0 auto;
        }

        #login-form label, #login-form input {
            display: block;
            margin: 10px 0;
        }

        #login-form input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>

<header>
    <h1>사원관리 페이지</h1>
</header>

<nav>
    <a href="#">홈</a>
    <a href="#">사원관리</a>
    <a href="#">프로젝트관리</a>
</nav>

<section style="text-align: center;">
    <h2 style="text-align: center;">로그인</h2>
    <form id="login-form">
        <label for="username">사용자명:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" required>

        <input type="submit" value="로그인">
    </form>
</section>

</body>
</html>
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
</html>