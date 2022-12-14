<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>session 정보저장/읽기</h1>
	<%
		session.setAttribute("id", "hong");
		session.setAttribute("pw", "12345");
		session.setAttribute("name", "홍길동");
	%>
	
	<h4>session id = <%= session.getId() %></h4>
	<h4>아이디 = <%= session.getAttribute("id") %></h4>
	<h4>비밀번호 = <%= session.getAttribute("pw") %></h4>
	<h4>이름 = <%= session.getAttribute("name") %></h4>
	
</body>
</html>