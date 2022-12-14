<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String admin_id = (String) session.getAttribute("admin");
	boolean login_success = admin_id == null ? false : true;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3><%= admin_id %></h3>
<h3><%= login_success %></h3>
<%
	if(login_success) {
%>
	<h4 class="bg-primary text-red">아이디 <%= admin_id %>로 로그인중입니다!!!</h4>
<%		
	} else {
%>
	<h4 class="bg-danger text-red">로그인을 하지 않았습니다!!!</h4>
<%
	}
%>

</body>
</html>