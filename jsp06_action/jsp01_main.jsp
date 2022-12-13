<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<%@include file="jsp01_menu.jsp" %>
	
	<div class="container">
		<h1>jsp01_main.jsp</h1>
		<%-- <%@include file="jsp01_sub.jsp"%> --%>
		<jsp:include page="jsp01_sub.jsp" flush="true"/>
		<h1>include이후의 내용들...</h1>
	</div>
	
	<%@include file="jsp01_footer.jsp" %>
</body>
</html>