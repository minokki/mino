<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" align="center">
		<h1>등록</h1>
		
		<form action="jsp02_insertMember.jsp" method="post">
		
		
			<table class="table table-bordered table-dark table-hover">
			
				<tr>
					<td width="20%">번호</td>
					<td><input type="number" name="bno" class="form-control" placeholder="번호를 입력하세요..."></td>
				</tr>	
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" class="form-control" placeholder="제목을 입력하세요..."></td>
				</tr>	
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" class="form-control" placeholder="작성자를 입력하세요..."></td>
				</tr>	
				<tr>
					<td>내용</td>
					<td><input type="text" name="content" class="form-control" placeholder="내용을 입력하세요..."></td>
				</tr>	
			</table>	
			<input type="submit" class="btn btn-info mt-sm-2" value="등록"/>
			<a href="jsp01_listMember.jsp" class="btn btn-primary mt-sm-2">목록</a>
		</form>
	</div>
</body>
</html>