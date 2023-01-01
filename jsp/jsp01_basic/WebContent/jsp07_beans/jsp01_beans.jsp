<%@page import="com.lec.member.Member"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="com.lec.member.Member" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	// DB연결해서 정보를 가져온다면
	// Member member = new Member();
	member.setId("scott");
	member.setPassword("tiger");
	member.setName("스캇.존");
%>
<jsp:forward page="jsp01_member.jsp"/>
</body>
</html>