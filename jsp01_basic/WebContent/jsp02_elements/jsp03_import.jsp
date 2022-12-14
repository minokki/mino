<%@page import="java.util.Calendar"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% // 자바코드 선언부분 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% Calendar cal = Calendar.getInstance(); %>
	오늘은
	<%= cal.get(Calendar.YEAR) %> 년
	<%= cal.get(Calendar.MONTH) + 1 %> 월
	<%= cal.get(Calendar.DATE) %> 일
	<br>
	
	<!-- import속성을 사용하지 않을 경우에는 클래스이름을 풀로 지정해야 한다. -->
	<% java.util.Date now = new java.util.Date(); %>
	오늘은 <%= now %> 입니다!
</body>
</html>