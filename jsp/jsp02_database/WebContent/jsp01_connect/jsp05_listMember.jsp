<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		
		<h1>회원목록</h1>
	
		<div class="row">
		
			<table class="table table-boarded table-hover">
				
				<tr>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>이메일</th>
					<th>삭제</th>
				</tr>
				<%
					Class.forName("org.mariadb.jdbc.Driver");
				    Connection conn = null;
				    Statement stmt = null;
				    ResultSet rs = null;
				    
					String url = "jdbc:mariadb://localhost:3306/jspstudy";
					String usr = "root";
					String pwd = "12345";
					String sql = "select * from member order by id";
					
					try {
						conn = DriverManager.getConnection(url, usr, pwd);
						stmt = conn.createStatement();
						rs = stmt.executeQuery(sql);
						
						while(rs.next()) {
							
							String id = rs.getString(1);
							String pw = rs.getString("password");
							String name = rs.getString(3);
							String email = rs.getString(4);
					%>
						<tr>
							<td><a href="jsp02_updateForm.jsp?id=<%=id%>"><%= id %></a></td>
							<td><%= pw %></td>
							<td><%= name %></td>
							<td><%= email %></td>
							<td><a href="jsp04_deleteForm.jsp?id=<%=id%>" class="btn btn-danger">삭제</a></td>
						</tr>
					<%						
						}

					} catch(Exception e) {
						out.write("<h3 class='bg-danger text-white'>DB접속실패!!!</h3><br>" + e.getMessage());			
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
			</table>
			<a href="jsp03_insertForm.jsp" class="btn btn-primary mt-sm-2">회원등록</a>
		</div>
	
	</div>
</body>
</html>

















