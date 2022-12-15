<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	String bno = request.getParameter("bno");
	String subject = "";
	String writer = "";
	String crtdate = "";
	String readcnt = "";
	String content = "";

	Class.forName("org.mariadb.jdbc.Driver");
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    
	String url = "jdbc:mariadb://localhost:3306/myboard";
	String usr = "root";
	String pwd = "12345";
	String sql = "select * from board where bno = '" + bno + "'";
	
	try {
		conn = DriverManager.getConnection(url, usr, pwd);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		if(rs.next()) {
			bno = rs.getString("bno");
			subject = rs.getString("subject");
			writer = rs.getString("writer");
			crtdate = rs.getString("crtdate");
			readcnt = rs.getString("readcnt");
			content = rs.getString("content");
		} else {
			out.write("<h3 class='bg-danger text-white'>" + bno + "를 찾지 못했습니다!!</h3>");			
		}		
	} catch(Exception e) {
		out.write("<h3 class='bg-danger text-white'>DB접속실패!!!</h3><br>");			
	} finally {
		// 5. close() DB 연결 해제
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
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
		<h1>회원삭제</h1>
		
		<form action="jsp03_deleteMember.jsp" method="post">
			<table class="table table-bordered table-dark table-hover">
				<tr>
					<td width="20%">번호</td>
					<td><input type="number" name="bno" class="form-control" value="<%= bno %>" disabled></td>
				</tr>	
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" class="form-control" value="<%= subject %>" disabled></td>
				</tr>	
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" class="form-control" value="<%= writer %>" disabled></td>
				</tr>	
				<tr>
					<td>날짜</td>
					<td><input type="date" name="crtdate" class="form-control" value="<%= crtdate %>" disabled></td>
				</tr>	
				<tr>
					<td>조회수</td>
					<td><input type="number" name="readcnt" class="form-control" value="<%= readcnt %>" disabled></td>
				</tr>	
				<tr>
					<td>내용</td>
					<td><input type="text" name="content" class="form-control" value="<%= content %>" disabled></td>
				</tr>	
			</table>
			<input type="hidden" name="bno" value="<%= bno %>">	
			<input type="submit" class="btn btn-info mt-sm-2" value="회원삭제"/>
			<a href="jsp01_listMember.jsp" class="btn btn-primary mt-sm-2">책 목록</a>
		</form>
	</div>
</body>
</html>



















