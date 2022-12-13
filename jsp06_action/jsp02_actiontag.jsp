<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  
	JSP Action Tag
	
	1. Action Tag
	
	   a. 서버나 클라이언트에게 특정 행동을 하도록 명령하는 태그
	   b. JSP페이지에서 페이지와 페이지 사이를 제어
	   c. 다른 페이지의 실행결과를 현재 페이지에 포함
	   d. Java Beans(예를 들어 BoardDTO, VO)등의 다양한 기능을 제공
	
	2. Action Tag의 종류
	
	   a. jsp:forward : 다른 페이지로 이동
	   b. jsp:include
	   c. jsp:useBaen : JSP페이지에서 Java Bean객체를 사용할 수 있도록 정의
	   d. jsp:setProperty : Java Bean의 setter
	   e. jsp:getProperty : Java Bean의 getter
	   f. jsp:param : forward, include등의 파라미터 지정
-->
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
	<div class="container">
		<table class="table table-dark table-hover">
			<tr>
				<td>제품번호</td>
				<td>xxx-yyy-zzz</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>150,000 원</td>
			</tr>
			<!-- jsp02_param.jsp?status=B -->
			<!-- <a href="jsp02_param.jsp?status=B"></a> -->
			<jsp:include page="jsp02_param.jsp" flush="false">
				<jsp:param name="status" value="A"/>
			</jsp:include>
		</table>
	</div>
</body>
</html>
















