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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        header {
            color: white;
            padding: 10px;
            text-align: center;
        }

        nav {
            display: flex;
            justify-content: center;
            padding: 10px;
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 10px;
            margin: 0 10px;
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
        #login-form input[type="submit"],
        #login-form input[type="button"] {
            display: inline-block; /* 수정된 부분: 블록 요소를 인라인으로 변경 */
            margin: 10px 0;

    </style>
</head>
<body>

<header>
    <h1></h1>
</header>

<nav>
    <a href="/board/main">홈</a>
    <a href="#">사원관리</a>
    <a href="#">프로젝트관리</a>
</nav>

<section>
    <div style="text-align: center;"><h2>로그인</h2></div>
    <form id="login-form">
        <label for="uId">사용자명:</label>
        <input type="text" id="uId" name="uId" required>

        <label for="pwd">비밀번호:</label>
        <input type="password" id="pwd" name="pwd" required>

        <input type="button" value="로그인" style="display: inline;" onclick="login();">
        <input type="button" value="사원등록" onclick="location.href='/board/register'">
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
<script>

let formData=null;

function login(){
	
	formData = {
			
			uId : $('[name="uId"]').val()
			,pwd : $('[name="pwd"]').val()
			
	};
	
	console.log("formData 확인:",JSON.stringify(formData));
	
	
	$.ajax({
	    type: "post",
	    url: "/main/login",
	    contentType: "application/json",
	    dataType: "json",
	    data: JSON.stringify(formData),
	    success: function(result){
	    	
	    	if(result.loginResult){
	    		
	    		window.location.href = "/board/main";
	    		
	    	}else{
	    
	    	console.log("====검색 결과====:",result.loginResult); // 검색 결과 출력
	    	alert(result.errorMessage);
	    }
	        
	    },
	    error: function(xhr, status, error) {
	        console.error("에러 발생:", xhr.responseText);
	    }
	});
	
	
	}

</script>
</html>