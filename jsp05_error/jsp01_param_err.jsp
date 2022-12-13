<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>예외처리</h1>
	<% try { %>
		<%= request.getParameter("xxx").toUpperCase() %>
	<% } catch(Exception e) { %>
		<h4>파라미터를 찾지 못했습니다!!!</h4>
	<% } %>
</body>
</html>