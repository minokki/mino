<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	
	Class.forName("org.mariadb.jdbc.Driver");
    Connection conn = null;
    PreparedStatement pstmt = null;	
	
    int count = 0;
    boolean isConn = true;
	
	String url = "jdbc:mariadb://localhost:3306/jspstudy";
	String usr = "root";
	String pwd = "12345";
	String sql = "delete from member where id = ?";

	try {
		conn = DriverManager.getConnection(url, usr, pwd);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		count = pstmt.executeUpdate();	
	} catch(Exception e) {
		isConn = false;
		out.write("<h3 class='bg-danger text-white'>DB접속실패!!!</h3><br>" + e.getMessage());			
	} finally {
		// 5. close() DB 연결 해제
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
	
		<h1>회원삭제</h1>
		<%
			if(count > 0) {
		%>
				<h3 class="bg-info text-white"><%= id %>회원의 정보가 성공적으로 삭제되었습니다!!</h3>
		<%
			} else {
		%>
				<h3 class="bg-danger text-white">회원삭제실패!!! <%=id %>를 찾지 못했습니다!!</h3>
		<%
			}
		%>
		<a href="jsp05_listMember.jsp" class="btn btn-primary">회원목록</a>
	</div>
</body>
</html>
















