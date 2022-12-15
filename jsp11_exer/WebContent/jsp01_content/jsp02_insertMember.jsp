<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String bno = request.getParameter("bno");
	String subject = request.getParameter("subject");
	String writer = request.getParameter("writer");
	String crtdate = request.getParameter("crtdate");
	String readcnt = request.getParameter("readcnt");
	String content = request.getParameter("content");
	
	Class.forName("org.mariadb.jdbc.Driver");
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    int count = 0;
    boolean isConn = true;
    
	String url = "jdbc:mariadb://localhost:3306/myboard";
	String usr = "root";
	String pwd = "12345";
	String sql = "insert into board values(?,?,?,?,?,?)";

	try {
		conn = DriverManager.getConnection(url, usr, pwd);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bno);
		pstmt.setString(2, subject);
		pstmt.setString(3, writer);
		pstmt.setString(4, crtdate);
		pstmt.setString(5, readcnt);
		pstmt.setString(6, content);
		count = pstmt.executeUpdate();
	} catch(Exception e) {
		isConn = false;
		out.write("<h3 class='bg-danger text-white'>DB접속실패!!!</h3><br>" + e.getMessage());			
	} finally {
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e) {
			// dummy
		}
	}	
%>
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
	
		<h1>책 등록하기</h1>
		
		<c:choose>
		
			<c:when test="<%= isConn %>">
				<h3>성공적으로 등록되었습니다.</h3>
				번호   : <%= bno %> <br>
				제목   : <%= subject %> <br>
				작성자 : <%= writer %> <br>
				날짜   : <%= crtdate %> <br>
				조회수 : <%= readcnt %> <br>
				내용   : <%= content %> <br>
			</c:when>
			<c:otherwise>
				<h3 class="bg-danger text-white">책 등록이 실패했습니다!!</h3>
			</c:otherwise>
		</c:choose>
		
		<form action="jsp02_insertForm.jsp">
			<input type="submit" class="btn btn-info" value="돌아가기">
			<a href="jsp01_listMember.jsp" class="btn btn-info">책 목록</a>
		</form>
		
	</div>
</body>
</html>















