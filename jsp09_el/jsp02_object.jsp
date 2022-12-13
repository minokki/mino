<%@page import="com.lec.el.Thermometer"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Thermometer thermometer = new Thermometer();
		request.setAttribute("t", thermometer);
	%>
	<h3>온도계 프로그램(V1.0)</h3>
	${ t.getInfo() } <br>
	${ t.getXxx() } <br>
	${ t.setCelsius("Seoul", -7.5) } <br>
	서울의 현재 온도는 섭씨 ${ t.getCelsius("Seoul") } 도 입니다!<br>
	서울의 현재 온도는 화씨 ${ t.getFahreheit("Seoul") } 도 입니다!<br>
</body>
</html>