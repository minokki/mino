<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		
		<form action="upload" method="post" enctype="multipart/form-data">
			<input type="text" class="mb-sm-2" value="홍길동"/><br>
			<input type="file" class="mb-sm-2" name="file1"><br>
			<input type="file" class="mb-sm-2" name="file2"><br>
			<input type="file" class="mb-sm-2" name="file3"><br>
			<input type="submit" class="btn btn-success" value="파일업로드">
		</form>
	</div>
</body>
</html>