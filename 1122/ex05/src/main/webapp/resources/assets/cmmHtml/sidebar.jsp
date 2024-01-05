<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.example.ex05.menu.vo.MenuDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- sidebar.jsp --%>
<div class="sidebar-menu">
     <ul>
        <% 
        // 세션에서 메뉴 항목 리스트를 가져옴
        List<MenuDTO> menuItems = (List<MenuDTO>)session.getAttribute("menuItems");
        for(MenuDTO item : menuItems) { %>
            <li><a href="<%= item.getMenuUrl() %>"><%= item.getMenuName() %></a></li>
        <% } %>
    </ul>
</div>
</body>
</html>