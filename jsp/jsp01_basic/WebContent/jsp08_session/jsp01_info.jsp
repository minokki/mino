<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Date now = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" align="center">
		<h3>session정보 읽기</h3>
		
		<h4>session id = <%= session.getId() %></h4>
		<h4>session 생성시간 = <%= session.getCreationTime() %></h4>
		<h4>session 최종접속시간 = <%= session.getLastAccessedTime() %></h4>
		
		<% now.setTime(session.getCreationTime()); %>
		<h4>session 생성시간 = <%= sdf.format(now) %></h4>
		
		<% now.setTime(session.getLastAccessedTime()); %>
		<h4>session 최종접속시간 = <%= sdf.format(now) %></h4>
	</div>
</body>
</html>