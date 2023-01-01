<%@page import="java.net.URLEncoder"%>
<%@page import="com.lec.board.vo.BoardBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	BoardBean board = (BoardBean) request.getAttribute("board");
	String p = (String) request.getParameter("p");
	String f = (String) request.getParameter("f");
	
	System.out.println("======> " + p);
	
	String q = "";
	try {
		q = URLEncoder.encode((String) request.getParameter("q"));
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
<body>
	<div class="container" align="center">
		<div class="jumbotron">
			<h3>글 상세내용 조회</h3>
		</div>
	
		<div class="form-group input-group">
			<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-user"></i></span></div>
			<input type="text" class="form-control" name="board_name" id="board_name" value="${ board.getBoard_name() }" readonly>
		</div>
		
		<div class="form-group input-group">
			<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-clipboard"></i></span></div>
			<input type="text" class="form-control" name="board_subject" id="board_subject" value="${ board.getBoard_subject() }" readonly>
		</div>
		
		<div class="form-group input-group">
			<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-comment-dots"></i></span></div>
			<textarea class="form-control" name="board_content" id="board_content" cols="40" rows="15" readonly>${ board.getBoard_content() }</textarea>
		</div>
		
		<c:if test="${ board.getBoard_file() != null}">
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-file-alt"></i></span></div>
				<input type="text" class="form-control" name="board_file" id="board_file" value="${ board.getBoard_file() }" readonly>
			</div>
		</c:if>
		
		<div class="form-group input-group">
			<a href="boardModifyForm.bo?board_num=<%=board.getBoard_num()%>&p=<%=p%>&f=<%=f%>&q=<%=q%>" class="btn btn-success mr-sm-3">수정</a>
			<a href="boardDeleteForm.bo?board_num=<%=board.getBoard_num()%>&p=<%=p%>&f=<%=f%>&q=<%=q%>" class="btn btn-success mr-sm-3">삭제</a>
			<a href="boardReplyForm.bo?board_num=<%=board.getBoard_num()%>&p=<%=p%>&f=<%=f%>&q=<%=q%>" class="btn btn-success mr-sm-3">답변</a>
			<a href="boardList.bo?p=<%=p%>&f=<%=f%>&q=<%=q%>" class="btn btn-success">목록</a>
		</div>
	</div>
</body>
</html>





















