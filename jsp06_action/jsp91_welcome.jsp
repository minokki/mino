<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%@include file="jsp01_menu.jsp" %>
	<%! String greeting = "환영합니다!! 저희 회사를 방문해 주셔서 감사합니다!"; %>
	
	<div class="jumbotron">
		<div class="container">
			<h4 class="display-3"><%= greeting %></h4>
		</div>
	</div>
	
	<div class="container">
		<div class="text-center">
			<h5><%= greeting %></h5>
			<%
				Date day = new Date();
				String am_pm;
				int hour = day.getHours();
				int minute = day.getMinutes();
				int second = day.getSeconds();
				if(hour/12==0) { am_pm = "AM"; } else { am_pm = "PM"; hour = hour -12; }
				String CT = hour + ":" + minute + ":" + second;
				out.println("현재 접속시간 = " + CT + "\n");
			%>
		</div>
	</div>
	
	<%@include file="jsp01_footer.jsp" %>
	
</body>
</html>