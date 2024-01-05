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
 body {
    margin: 0;
    font-family: 'Arial', sans-serif;
  }

  header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;
    background: #f4f4f4;
  }

  header h1 {
    font-size: 2em;
    margin: 0;
  }

  header nav {
    display: flex;
    align-items: center;
  }

  header nav a {
    font-size: 0.8em;
    padding: 5px 10px;
    margin-left: 10px; /* 로그인/로그아웃 버튼 사이의 간격을 조정합니다 */
    text-decoration: none;
    color: #333;
    border: 1px solid #333;
    border-radius: 5px;
  }

  .side-nav {
    position: absolute;
    top: 100%; /* 헤더 바로 아래에 위치하도록 설정합니다 */
    left: 0;
    width: 200px;
    padding-top: 10px;
  }

  .side-nav a {
    display: block;
    margin-bottom: 5px;
    padding: 10px;
    background-color: #f8f8f8;
    color: #333;
    text-decoration: none;
    border-radius: 5px;
  }

  .side-nav a:hover {
    background-color: #ddd;
  }
    </style>
</head>
<body>
<header style="text-align: center; display: flex; flex-direction: column; align-items: center; margin-bottom: 10px;">
    <h1>사원관리 페이지 입니다</h1>
    
    <!-- 세션에서 uno를 확인하여 로그인 또는 로그아웃 버튼 표시 -->
    <nav style="display: inline; margin-top: 10px;">
<c:choose>
    <c:when test="${empty sessionScope.uno}">
        <!-- 로그인 버튼 (로그인되지 않은 상태) -->
        <div style="margin-right: 10px;"><a href="/main/login">로그인</a></div>
    </c:when>
    <c:otherwise>
        <!-- 로그아웃 버튼 (로그인된 상태) -->
        <div style="margin-right: 10px;"><input type="button" onclick="logout();" value="로그아웃"></div>
    </c:otherwise>
</c:choose>
    </nav>
</header>
	<hr>
	 <!-- 세션에서 권한 번호 가져오기 -->
    <c:set var="authoNo" value="${sessionScope.authoNo}" />

    <nav>
        <!-- 관리자 메뉴 (authoNo == 1) -->
        <c:if test="${authoNo == '1'}">
            <div>
                <label><a href="/board/list"><h3>사원관리</h3></a></label>
            </div>
            <div>
                <label><a href="/project/list"><h3>프로젝트관리</h3></a></label>
            </div>
            <!-- 추가 관리자 전용 메뉴 항목을 여기에 배치 -->
        </c:if>

        <!-- 일반 사용자 메뉴 (authoNo == 2) -->
        <c:if test="${authoNo == '2'}">
            <div>
                <!-- 사용자의 'uno' 세션 변수를 사용하여 개인 정보 페이지로의 링크 생성 -->
                <label><a href="/user/info?uno=${sessionScope.uno}"><h3>내 정보</h3></a></label>
            </div>
            <!-- 사용자 전용 메뉴 항목을 여기에 배치 -->
               <div>
                <!-- 사용자의 'uno' 세션 변수를 사용하여 개인 정보 페이지로의 링크 생성 -->
                <label><a href="/user/info?uno=${sessionScope.uno}"><h3>나의 참여 프로젝트</h3></a></label>
            </div>
        </c:if>
    </nav>
</body>
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/login_out.js"></script>
</html>