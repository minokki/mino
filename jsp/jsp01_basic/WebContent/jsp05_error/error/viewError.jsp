<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	요청처리과정에서 에러가 발생했습니다!!<br>
	조속한 시간안에 해결하겠습니다!!<br>
	<hr />
	
	에러타입   : <%= exception.getClass().getName() %><br>
	에러메시지 : <%= exception.getMessage() %><br>
	에러메시지 : <%= exception.getLocalizedMessage() %>
</body>
</html>