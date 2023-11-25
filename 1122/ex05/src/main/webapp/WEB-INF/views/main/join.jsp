<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 등록</title>
</head>
<body>

  <form action="join_db.jsp" method="post" name="joinForm" enctype="multipart/form-data">
    <p>
      <label>사번 : <input type="text" name="uNo"></label> &nbsp;&nbsp;&nbsp;&nbsp; <label>이름 : <input type="text" name="uNm"></label>
    </p>
    <p><label>비밀번호 : <input type="password" name="pwd"></label> &nbsp;&nbsp;&nbsp;&nbsp;<label>비밀번호 확인 : <input type="password" name="pwd_re"></label></p>
    <p>생년월일 <input type="date" name="birth" min="1990-01-01" max="2025-12-31">
       &nbsp;&nbsp;&nbsp;&nbsp;
       성 별 &nbsp; 
       남자<input type="radio" name="sex" value="남자" checked>&nbsp;
       여자<input type="radio" name="sex" value="여자">
    </p>
    <p>입사일 <input type="date" name="entrDate" min="1990-01-01" max="2025-12-31">
      &nbsp;&nbsp;&nbsp;
      재직상태 
      <select >
      <option value="01">재직</option>
      <option value="02">휴직</option>
      <option value="03">퇴직</option>
      </select>
    </p>
    <p>사진첨부 <input type="file" name="photo" accept="image/*,.text"  value="파일선택"
       onchange="this.value"></p>
    
    
  </form>
 
</body>
</html>