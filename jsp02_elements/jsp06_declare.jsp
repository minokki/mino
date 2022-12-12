<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	//메서드선언
	int val1 =0;
	int val2 = 0;
	int result1;
	
	public static int add(int a, int b){
	return a+b;
	}
	public static int sub(int a, int b){
	return a-b;
	}
	public static int mul(int a, int b){
	return a*b;
	}
	public static double div(int a, int b){
	return (double)a/b;
	}
	public static int add2(){
	return 10+20;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%= add(10, 20) %></h1>
	<h1><%= add2() %></h1>
	<h1><%= sub(10,20) %></h1>
	<h1><%= mul(10,20) %></h1>
	<h1><%= div(10,20) %></h1>
	
	<!-- 실습1. add(), sub(), mul(), div() 메서들 생서후 각 결과를 출력하기 
	 val1 = 10
	 val2 = 10
	 val1 + val2 = result
	 메서드호출
	-->
	
	<%
		val1 = 10;
		val2 = 20;
		
		result1 = add(val1, val2);
		int result2 = sub(val1, val2);
		int result3 = mul(val1, val2);
		double result4 = div(val1, val2);
	%>
	
	<%= val1 %> + <%= val2 %> = <%= result1 %><br>
	<%= val1 %> - <%= val2 %> = <%= result2 %><br>
	<%= val1 %> * <%= val2 %> = <%= result3 %><br>
	<%= val1 %> / <%= val2 %> = <%= result4 %><br>
</body>
</html>