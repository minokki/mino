<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!-- isErrorPage="true"로 지정된 페이지는 exception 내장잭체를 사용할 수 있다. -->
<!-- 
	서버에서 응답되는 상태코드
	
	200 : 요청이 정상적으로 처리
	404 : 요청한 페이지가 없을 경우
	500 : 웹서버 내부에서 에러가 있을 경우
	
	http응답코드는 http://goo.gl/D9thN8 참고

-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">   
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
</head>
<body>
	<div class="bg-danger text-white">요청하신 페이지를 찾지 못했습니다!! 정확한 주소를 입력하세요!!</div>
</body>
</html>