<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String id = request.getParameter("id");
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
<%
			Class.forName("org.mariadb.jdbc.Driver");
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			String url = "jdbc:mariadb://localhost:3306/jspstudy";
			String usr = "root";
			String pwd = "12345";
			String sql = "select * from member where id = '" + id + "'";
			
			try {
				conn = DriverManager.getConnection(url, usr, pwd);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				if(rs.next()) {
%>
					<table class="table tabl-hover" border="1">
						<tr>
							<td>아이디</td>
							<td><%= id %></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><%= rs.getString("password") %></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><%= rs.getString("name") %></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><%= rs.getString("email") %></td>
						</tr>		
					</table>
<%
				} else {
%>
					<h3 class="bg-danger text-white"><%= id %>는 찾지 못했습니다!!</h3>
<%
				}
			} catch(Exception e) {
%>
				에러 : <%= e.getMessage() %>
<%				
			} finally {
				try {
					if(rs != null) rs.close();
					if(stmt != null) stmt.close();
					if(conn != null) conn.close();
				} catch (Exception e) {
					// dummy
				}
			}
%>
	</div>
</body>
</html>















