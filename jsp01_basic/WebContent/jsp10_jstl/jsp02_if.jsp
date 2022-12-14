<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>표현식</h1>
	<%
		if(true) {
	%>
			<h2>${ "참입니다" }</h2>
	<%
		}
	%>
	
	<h1>JSTL</h1>
	<c:if test="ture">
		<h2>${ "참입니다" }</h2>
	</c:if>
	
	<c:if test="${ param.name == 'hong' }">
		제 이름은 홍길동 입니다!!
	</c:if>
	<br />
	
	<c:if test="${ param.age > 18 }">
		제 나이는 ${ param.age }살 입니다. 나는 성인입니다!!
	</c:if>
</body>
</html>










