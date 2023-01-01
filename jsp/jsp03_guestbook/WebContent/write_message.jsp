<%@page import="com.lec.web.service.WriteMessageService"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="message" class="com.lec.web.model.Message">
	<jsp:setProperty name="message" property="*"/>
</jsp:useBean>
<%
	// DB에 insert 서비스
	WriteMessageService writeService = WriteMessageService.getInstance();
	writeService.write(message);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
		crossorigin="anonymous">  
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" align="center">
	
		<h3>메시지등록하기</h3>
		<p class="bg-success text-white">방명록에 메시지가 정상적으로 등록되었습니다!</p>
		<a href="list.jsp" class="btn btn-primary">목록보기</a>
		<a href="list.jsp?page=<%= session.getAttribute("page") %>" class="btn btn-info">목록보기(현재페이지)</a>
	</div>
</body>
</html>