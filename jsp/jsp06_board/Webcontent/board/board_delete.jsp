<%@page import="java.net.URLEncoder"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int board_num = Integer.parseInt(request.getParameter("board_num"));
	String p = (String) request.getParameter("p");
	String f = (String) request.getParameter("f");
	String q = "";
	
	try {
		q = URLEncoder.encode(request.getParameter("q"));
	} catch(Exception e) {
		q = "";
	}
%>
<c:set var="p" value="<%= p %>"/>
<c:set var="f" value="<%= f %>"/>
<c:set var="q" value="<%= q %>"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
		crossorigin="anonymous">  
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container" align="center">
		<div class="jumbotron">
			<h3>게시글 삭제 하기</h3>
		</div>
		
		<form action="boardDelete.bo?board_num=<%=board_num%>" method="post">
		
			<input type="hidden" name="board_num" value="<%= board_num %>"/>
			<input type="hidden" name="p" value="<%= p %>"/>
			<input type="hidden" name="f" value="<%= f %>"/>
			<input type="hidden" name="q" value="<%= q %>"/>
		
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-key"></i></span></div>
				<input type="password" class="form-control" name="board_pass" id="board_pass" required 
					placeholder="비밀번호를 입력하세요..."/>
			</div>
			
			<div class="form-group input-group">
				<input type="submit" class="btn btn-danger mr-sm-3" value="삭제"/>
				<input type="button" class="btn btn-success" value="이전" onclick="javascript:history.go(-1)"/>
			</div>
		</form>
	</div>
</body>
</html>




















