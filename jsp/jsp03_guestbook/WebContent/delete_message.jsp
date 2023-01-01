<%@page import="com.lec.web.service.DeleteMessageService"%>
<%@page import="com.lec.web.exception.InvalidPasswordException"%>
<%@page import="com.lec.web.exception.MessageNotFoundException"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	int id = Integer.parseInt(request.getParameter("id"));
	int cp = Integer.parseInt(request.getParameter("cp"));
	String pw = request.getParameter("pw");
	String msg = request.getParameter("msg");
	boolean invalidPass = false;
	
	try {
		DeleteMessageService deleteService = DeleteMessageService.getInstance();
		deleteService.deleteMessage(id, pw);	
	} catch(MessageNotFoundException e) {
		e.getMessage();
	} catch(InvalidPasswordException e) {
		invalidPass = true;
	}
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
		
		<h3>방명록 삭제하기</h3>
		
		<% if(!invalidPass) { %>
			<h4 class="bg-success text-white">메시지가 성공적으로 삭제되었습니다!</h4>
		<% } else { %>
			<h4 class="bg-danger text-white">비밀번호가 일치하지 않습니다! 다시 입력하세요!</h4>
		<% } %>
		<br />
		
		<a href="list.jsp?page=<%= cp %>" class="btn btn-primary">목록보기</a>
	</div>
</body>
</html>