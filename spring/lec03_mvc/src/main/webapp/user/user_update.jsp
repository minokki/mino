<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Spring Framework</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" 
		integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" 
		crossorigin="anonymous">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>	
</head>
<body>
	<div class="container" align="center">
		<div class="mt-4 p-5 bg-primary text-white rounded">
			<h3>User Update</h3>
			<p>상세설명......................</p>
			
		</div>
		<br>
		
		<form action="updateUser.do" method="post">
		
			<div class="input-group-text mb-3">
				<div class="input-group-text"><i class="fas fa-user"></i></div>
				<input type="text" class="form-control" value="${ user.getId() }" disabled>
			</div>
	
			<div class="input-group-text mb-3">
				<div class="input-group-text"><i class="fas fa-lock"></i></div>
				<input type="password" name="password" id="password" class="form-control" required>
			</div>	
			
			<div class="input-group-text mb-3">
				<div class="input-group-text"><i class="fas fa-user"></i></div>
				<input type="text" name="name" id="name" class="form-control" value="${ user.getName() }" required>
			</div>
	
			<div class="input-group">
				<input type="checkbox" class="input-group-text" name="role" id="role" ${ user.getRole() == "ADMIN" ? "checked" : ""}>
				<label class="form-check-lable ms-sm-2" for="role">관리자</label>
			</div>
			
			<input type="hidden" name="id" id="id" class="form-control" value="${ user.getId() }">
			<button type="submit" class="btn btn-primary text-white"><b>"${ user.getId() }"</b>를 수정하겠습니까?</button>
		</form>
	</div>		
</body>
</html>			