<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	커넥션풀(Connection Pool)
	
	커넥션풀기법이란? 데이터베이스와 커넥션 사전에 만들어서 pool에 저장해 두고 필요할 때 마다
	풀에서 꺼내서 사용한 후에 다시 pool에 반환하는 기법을 말한다.
	
	커넥션풀의 특징은
	
	1. 사전에 풀에 Connection이 생성되어 있기 때문에 커넥션을 생성하는데 필요한 시간들을 감소시킨다.
	2. Connection을 재사용하기 때문에 생성되는 Connection의 갯수를 일정하게 관리할 수 있다.
	3. Connection Pool을 사용하게 되면 웹애플리케이션의 성능과 처리성능이 향상되기 때문에 웨애플리
	   케이션 대부분이 커넥션풀을 기본적으로 사용하고 있다.
	
	커넥션풀을 사용방법
	
	1. DBCP관련 jar파일과 JDBC관련 jar파일을 설치
	
	   a. Commons DPCP API(commons-dbcp2-???.jar, commons-pool2-???.jar, commons-logging-??.jar)
	   b. WEB-INF/lib에 복사후 add to build path
	   
	2. Connection Pool을 초기화 하기
	
	   a. DB initial 클래스작성(DBCPInit.java)
	   b. web.xml에 Connection Pool관련 태그 설정하기
	   
	3. Connection Pool에서 Connection을 사용하기
	
	   a. jdbc:apache:commons:dbcp:커넥션이름
	
-->
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
	
		<h3>회원등록</h3>
		
		<div class="row">
			
			<table class="table table-boarded table-dark table-hover">
				<tr>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>이메일</th>
					<th>삭제</th>
				</tr>
				
				<%
					Connection conn = null;
					Statement stmt = null;
					ResultSet rs = null;
					String drv = "jdbc:apache:commons:dbcp:myPoolName";
					String sql = "select * from member";
				
					try {
						conn = DriverManager.getConnection(drv);
						stmt = conn.createStatement();
						rs = stmt.executeQuery(sql);
						
						while(rs.next()) {
							String id = rs.getString(1);
							String pw = rs.getString(2);
							String name = rs.getString(3);
							String email = rs.getString(4);
				%>
				
				<tr>
					<td><a href="/jsp02_database/jsp01_connect/jsp02_updateForm.jsp?id=<%=id%>"><%= id %></a></td>
					<td><%= pw %></td>
					<td><%= name %></td>
					<td><%= email %></td>
					<td><a href="/jsp02_database/jsp01_connect/jsp04_deleteForm.jsp?id=<%=id%>" class="btn btn-danger">삭제</a></td>
				</tr>				
				<%
						}
					} catch(Exception e) {
						out.println("<h3 class='bg-danger text-white'>DB접속실패!!!</h3>" + e.getMessage());
					} finally {
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
			<a href="/jsp02_database/jsp01_connect/jsp03_insertForm.jsp?" class="btn btn-primary mt-sm-2">회원등록</a>
		</div>
	
	</div>
</body>
</html>


















