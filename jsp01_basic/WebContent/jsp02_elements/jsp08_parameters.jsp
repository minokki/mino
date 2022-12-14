<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
	<form action="jsp09_parameters_view.jsp" method="post">
	<!--get 방식은 주소창에 비밀번호 표시, post방식은 주소 숨김  -->
		이름 : <input type="text" name="name"  size="10" value="홍길동"><br>
		암호 : <input type="password" name="pw"  size="10" value="12345"><br>
		주소 : <input type="text" name="addr"  size="50" value="서울 서초구 이젠....."><br>
		취미 : <input type="checkbox" name="hobby"  size="10" value="독서"> 독서
		       <input type="checkbox" name="hobby"  size="10" value="운동"> 운동
		       <input type="checkbox" name="hobby"  size="10" value="음악"> 음악<br>
		<input type="submit" value="전송">
	</form>
</body>
</html>