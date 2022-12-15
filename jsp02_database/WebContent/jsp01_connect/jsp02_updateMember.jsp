<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   // 받아온 파라미터값을 한국어로 받으려면 입력해야함 (한국어 깨짐)
   request.setCharacterEncoding("utf-8");
   
   // 전달 받아서 수정할 값 선언   
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   String name = request.getParameter("name");
   String email = request.getParameter("email");
   
   Class.forName("org.mariadb.jdbc.Driver"); // db연결작업
   String url = "jdbc:mariadb://localhost:3306/jspstudy"; 
   String usr = "root";
   String pwd = "12345";
   
   ResultSet rs_01 = null; // 없어도 된다 그냥 선언만 해놓음
   String sql="update member set password=?, name=?, email=? where id=?";
   
   // 입력값
   Connection conn= null;
   PreparedStatement pstmt = null;
   int rs=0;
      
   //db연결
   
   //쿼리에 입력한 기본값 입력
   try{
   conn = DriverManager.getConnection(url,usr,pwd); // 커넥션 연결
   pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, pw);
   pstmt.setString(2, name);
   pstmt.setString(3, email);
   pstmt.setString(4, id);
   
   // 업데이트 쿼리문 실행
   rs = pstmt.executeUpdate();
   out.print(rs+"건이 변경됐습니다!");
   }catch(Exception e){
	   out.write("등록 실패");
   }finally {
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

		<h1>회원수정</h1>
		
		<%
			if(rs > 0) {
		%>
				<h3 class="bg-info text-white"><%= id %>회원의 정보가 성공적으로 수정되었습니다!!</h3>
		<%
			} else {
		%>
				<h3 class="bg-danger text-white">회원정보실패!!! <%=id %>를 찾지 못했습니다!!</h3>
		<%
			}
		%>
		
		<a href="jsp05_listMember.jsp" class="btn btn-primary">회원목록</a>
	</div>
</body>
</html>