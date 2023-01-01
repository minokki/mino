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
		
		<form action="jsp05_upload.jsp" method="post" enctype="multipart/form-data" class="form-group">
		
			<table class="table table-hover">
			
				<tr>
					<td width="20%">업로드한 사람</td>
					<td><input type="text" name="name" class="form-control" value="홍길동"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" class="form-control" value="파일업로드 및 다운로드하기"></td>
				</tr>
				<tr>
					<td>파일1</td>
					<td><input type="file" name="filename1" class="form-control"></td>
				</tr>
				<tr>
					<td>파일2</td>
					<td><input type="file" name="filename2" class="form-control"></td>
				</tr>
			</table>
			<input type="submit" class="btn btn-primary" value="파일업로드"/>
		</form>
	</div>
</body>
</html>