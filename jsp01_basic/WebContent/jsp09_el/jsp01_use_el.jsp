<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  
	기본객체 : page, request, response, out, session, application
	EL객체   : pageContext, 
	
	영역     : page, request, session, application
	EL영역   : pageScope, requestScope, sessionScope, applicationScope
-->
<%
	request.setAttribute("name", "홍길동");	
%>
<h1>표현식</h1>
<h3>request의 name속성의 값 = <%= request.getAttribute("name") %></h3>
<h3>이름 : ${ request.getAttribute("name") } - 값을 가져오지 못함 </h3>
<p>EL안({})에는 request객체 대신에 requestScope를 사용한다.</p>
<h3>request의 addr 속성의 값 = <%= request.getParameter("addr") %></h3>



<h1>표현언어(EL)</h1>
<h3>표현언어로 name속성의 값 = ${ requestScope.name }</h3>
<h3>request의 addr 속성의 값 = ${ param.addr }</h3>
<h3>${ pageContext.request.requestURI }</h3>