<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id.equals(pw)) {
		session.setAttribute("admin", id);  // admin=hong
%>
		<html>
		<head>
			<meta charset="UTF-8">
			<title>로그인(session.invalidate())</title>
		</head>
		<body>
			<h1>로그인성공!!</h1>
		</body>
		</html>
<%
	} else {
%>
		<script>
			alert("로그인실패!!!")
			history.go(-1);
		</script>
<%
	}
%>