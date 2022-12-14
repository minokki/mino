<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  
	JSP의 영역(scope)
	
	웹애플리케이션은 4가지영역으로 구분된다.
	
	1. page
	   
	   하나의 jsp페이지마다 사용되는 영역이다. page영역은 한 번의 클라이언트
	   요청에 대해서 jsp페이지를 메모리영역으로 한다. 웹브라우저의 요청이 들
	   어오면 jsp페이지를 실행하는 데 이 때 jsp페이지를 실행하는 범위가 page
	   영역이다. 이 영역은 pageContext객체의 영역이다.
	   
	2. request
	
	   하나의 http요청을 처리할 때 사용되는 영역이다. request영역은 웹브라우
	   저의 요청과 관련이 있다. 웹브라우저의 주소창에 url을 입력하거나 링크를
	   클릭해서 페이지를 이동할 때 웹브라우저가 웹서버에 전송하는 요청이 하나
	   의 request영역이다.	   
	   
	3. session
	
	   하나의 웹브라우저와 관련된 영역으로서 session영역은 웹브라우저와 관련
	   된 영역이다. 세션이 생성되면 하나의 웹브라우저와 관련된 요청은 하나의
	   session영역에 포함되며 이 영역은 session객체의 영역이다.
	
	4. application
	
	   하나의 웹애플리케이션과 관련된 영역으로 application영역은 웹애플리케이
	   션과 관련된 전체 영역을 의미하고 application객체가 사용하는 영역이다.
	
	JSP기본객체의 메서드
	
	네 개의 기본객체는 각각의 속성을 갖는데 기본 객체가 존재하는 동안 기본객
	체의 속성을 사용할 수가 있다. jsp기본객체 속성은 jsp사이에서 정보를 교환
	하거나 공유하기 위한 목적으로 사용한다. 속성은 key와 값형태로 갖는데 기
	본객체는 서러 다른 이름을 갖는 속성을 여러개 포함할 수가 있다.
	
	1. setAttribute(String name, Object value)
	2. getAttribute(String name)
	3. removeAttribute(String name)
	4. getAttributeNames()

-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	out.print("<h3>사용자 아이디 = " + id + "</>");
	out.print("<h3>비밀번호      = " + pw + "</>");
	out.print("<hr>");
	
	out.print("<h3>application 영역의 id = " + application.getAttribute("id") + "</h3>" );
	out.print("<h3>application 영역의 pw = " + application.getAttribute("pw") + "</h3>" );

	application.setAttribute("id", "sonny");
	application.setAttribute("pw", "abcef");
	
	out.print("<h3>application 영역의 id = " + application.getAttribute("id") + "</h3>" );
	out.print("<h3>application 영역의 pw = " + application.getAttribute("pw") + "</h3>" );
	out.print("<hr>");
	
	application.removeAttribute("id");
	application.removeAttribute("pw");
	out.print("<h3>application 영역의 id = " + application.getAttribute("id") + "</h3>" );
	out.print("<h3>application 영역의 pw = " + application.getAttribute("pw") + "</h3>" );
	
%>
</body>
</html>



















