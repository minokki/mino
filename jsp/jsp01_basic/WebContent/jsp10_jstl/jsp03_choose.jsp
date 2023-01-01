<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ?name=hong&age=20 -->
	<ul>
		<c:choose>
			<c:when test="${ param.name == 'hong' }">
				<li>사용자의 이름은 <b>${ param.name }</b>입니다!</li>
			</c:when>
			<c:when test="${ param.age > 18 }">
				<li>당신의 나이는 <b>${ param.age }</b>살 입니다!. 당신은 <b>성인</b>입니다!</li>			
			</c:when>
			<c:otherwise>
				<li>당신의 이름 또는 나이에 대한 정보가 없습니다!!!</li>
			</c:otherwise>
		</c:choose>
	</ul>
</body>
</html>