<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import= "java.util.Date"%>  <!-- jsp에서 import 하는 방법 -->
<!-- < %% > : java source -->
<!-- < %=% > : 
		1. java의 변수값 출력 
		2. 스크림트릿(scriptlet) 블럭안에는 자바명령 또는 자바에서 선언된 변수등을
			문자열로 생성해주는 명령
-->
<%      
	// import java.uti.Date - 에러
	Date now = new Date();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>http://localhost:8080/jsp01_basic.jsp01_hello/now.html</h1>
	<h1>안녕하세요 >  반갑습니다</h1>
	<h1>현재 시간은 <%= new java.util.Date() %> 입니다!</h1>   
	<h1>현재 시간은 <%= now %> 입니다!</h1>   

</body>
</html>

