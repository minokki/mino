<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		
			<h1>답변형게시판</h1>
			<p>게시판관리페이지 입니다. 글쓰기를 하려면 <strong class="text-danger">게시판글쓰기버튼</strong>을
			클릭하세요!</p>
		</div>
		<a href="boardWriteForm.bo" class="btn btn-success mr-sm-2">게시판글쓰기</a>
		<a href="boardList.bo?p=1&f=board_name&q=" class="btn btn-success">게시판글 목록보기</a>
	</div>
</body>
</html>