<%@page import="java.net.URLEncoder"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<style>
		.login-btn {
			clear: black;
			background-color: #FFC312
			width:100px;
		}
		.login-btn:hover {
			clear: white;
			background-color: black;
		}
		.input-group-prepend span {
			color: black;
			border-left-color: : #FF312;
			width: 40px;
			border: 0 !important;
		}
	</style>
</head>
<%
	String p = request.getParameter("p");
	String f = request.getParameter("f");
	
	String q = "";
	try {
		q = URLEncoder.encode((String) request.getParameter("q"));		
	} catch(Exception e) {
		q = "";
	}
%>
<c:set var="p" value="<%=p%>"/>
<c:set var="f" value="<%=f%>"/>
<c:set var="q" value="<%=q%>"/>
<body>
	
	<div class="container" align="center">
	
		<div class="jumbotron">
			<h3>게시판글쓰기</h3>
			<p>게시판글쓰기 페이지 입니다. 클을 작성해 주세요!!</p>
		</div>
	
		<form action="boardWrite.bo?p=${p}&f=${f}&q=${q}" method="post" class="form-group" 
			name="boardform" enctype="multipart/form-data">
			
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-user"></i></span></div>
				<input type="text" class="form-control" name="board_name" id="board_name" value="홍길동" required
				placeholder="작성자이름을 입력하세요...."/>
			</div>
			
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-key"></i></span></div>
				<input type="password" class="form-control" name="board_pass" id="board_pass" value="12345" required
				placeholder="비밀번호를 입력하세요...."/>
			</div>
			
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-clipboard"></i></span></div>
				<input type="text" class="form-control" name="board_subject" id="board_subject" value="<%= new java.util.Date() %>" required
				placeholder="제목을 입력하세요...."/>
			</div>
			
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-comment-dots"></i></span></div>
				<textarea class="form-control" name="board_content" id="board_content" cols="40" rows="15" required
				placeholder="글내용을 입력하세요....">글 내용...</textarea>
			</div>
			
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-file-alt"></i></span></div>
				<div class="custom-file">
					<input type="file" class="custom-file-input" name="board_file" id="board_file"/>
					<label for="board_file" class="custom-file-label" style="text-align: left">업로드할 파일을 선택하세요!!</label>
				</div>
			</div>
			
			<div class="form-group mt-md-5">
				<input type="reset" class="btn btn-success float-right login-btn ml-sm-2" value="새로고침"/>
				<input type="submit" class="btn btn-success float-right login-btn" value="글등록"/>
			</div>
		</form>
	</div>
	
	<script>
		 $(".custom-file-input").on("change", function() {
			 // var fileName = $(this).vale();               // 전체파일명
			 var fileName = $(this).val().split("\\").pop(); // 파일명만
			 $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
		 })
	</script>
</body>
</html>





















