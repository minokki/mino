<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int sno = 1000;
	String name = "홍길동";
	String gender = "남자";
	int age = 9000;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 실습1. 변수선후: 학생1명의 정보를 출력하기(h1태그등 사용)
	     번호 : 1000
	     이름 : 홍길동
	     성별 : 남자
	     나이 : 43
	   
	     실습2. ArrayList<String>를 이용해서 학생1명만 출력
	     번호 : 2000 -> 0
	     이름 : 소향 -> 1
	     성별 : 여자 -> 2
	     나이 : 44   -> 3
	 -->
	
	<h1>번호 : <%= sno %></h1>
	<h1>이름 : <%= name %></h1>
	<h1>성별 : <%= gender %></h1>
	<h1>나이 : <%= age %></h1>
	<hr>
	
	<%
		ArrayList<String> student = new ArrayList<>();
		student.add("2000");
		student.add("소향");
		student.add("여자");
		student.add("43");
	%>
	
	<h1>번호 : <%= student.get(0) %></h1>
	<h1>이름 : <%= student.get(1) %></h1>
	<h1>성별 : <%= student.get(2) %></h1>
	<h1>나이 : <%= student.get(3) %></h1>	
	<hr>
	
	
	<h3><%= 100*100 %></h3>
	
</body>
</html>













