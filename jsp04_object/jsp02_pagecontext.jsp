<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 
	2. pageContext 기본객체
	
	   1) jsp파일 하나당 한 개씩 존재하는 기본객체
	   
	     a. 기본객체구하기
	     b. 속성처리하기
	     c. 페이지흐름 제어하기
	     d. 에러데이터 구하기
	   
	   2) 관련메서드
	   
	     a. getRequest()        : request객체를 구하기
	     b. getResponse()       : response객체를 구하기
	     c. getSession()        : session객체를 구하기
	     d. getServletContext() : application객체를 구하기
	     e. getServletConfig()  : config객체 구하기
	     f. getOut()            : out객체 구하기
	     g. getPage()           : page객체 구하기
	     h. getException()      : exception객체 구하기
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3><%= request.toString() %> = <%= pageContext.getRequest() %></h3>
	<h3><%= response.toString() %> = <%= pageContext.getResponse() %></h3>
	<h3><%= session %> = <%= pageContext.getSession() %></h3>
	<h3><%= application %> = <%= pageContext.getServletContext() %></h3>
	<hr/>
	
	<%
		HttpServletRequest req = (HttpServletRequest) pageContext.getRequest();
	%>
	pageContext.getRequest()메서드로 가져온 request객체의 정보 = <%= req.getRemoteAddr() %>
	request객체에서 직접 가져온 request객체의 정보             = <%= req.getRemoteAddr() %>
	<hr/>
	<h3><%= req == request %></h3>
	<hr/>
	<% out.print("<h3>out 기본객체에서 직접 출력하기!!!</h3>"); %>
	<% pageContext.getOut().print("<h3>pageContext에서 가져온 out기본객체에서 출력하기</h3>"); %>
	<h3><%= out == pageContext.getOut() %></h3>
</body>
</html>