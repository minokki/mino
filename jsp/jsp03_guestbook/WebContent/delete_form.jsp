<%@page import="com.lec.web.model.Message"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.lec.web.jdbc.ConnectionProvider"%>
<%@page import="com.lec.web.dao.MessageDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// update_form.jsp?id=1002&cp=1
	int id = Integer.parseInt(request.getParameter("id"));
	int cp = Integer.parseInt(request.getParameter("cp"));
	Connection conn = ConnectionProvider.getConnection();
	MessageDAO messageDAO = MessageDAO.getInstance();
	Message view_data = messageDAO.select(conn, id);	
%>
<c:set var="view_data" value="<%= view_data %>"/>
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
		<h1>방명록 삭제하기(페이지번호 : <%= cp %>)</h1>
		
		<form action="delete_message.jsp" method="post">
		
			<div class="input-group mb-2 mr-sm-2">
				<div class="input-group-prepend">
					<span class="input-group-text"><i class="fas fa-user"></i></span>
				</div>
				<input type="text" class="form-control" name="guestName" value="${ view_data.guestName }" disabled/>
			</div>
			
			<div class="input-group mb-2 mr-sm-2">
				<div class="input-group-prepend">
					<span class="input-group-text"><i class="fas fa-lock"></i></span>
				</div>
				<input type="password" class="form-control" name="pw"/>
			</div>
			<input type="hidden" name="id" value="${ param.id }"/>
			<input type="hidden" name="cp" value="${ param.cp }"/>
			<input type="submit" class="btn btn-primary mb-2" value="메시지삭제하기"/>	
			<!--  update_message.jsp?id=1002&cp=1 -->		
		</form>
	</div>

</body>
</html>