<%@page import="com.lec.board.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.board.BoardList"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
BoardList bl = new BoardList();
ArrayList<Board> board_list = bl.getBoardList();
String bd_tbl = "<table border='1'>";
 for(Board board:board_list){
	 bd_tbl+="<tr><td>" + board.getBno() + "</td>"
			 +"<td>" + board.getSubject() +  "</td>"
			 +"<td>" + board.getWriter() +  "</td>"
			 +"<td>" + board.getContent() +  "</td></tr>";
	 
 }

 bd_tbl +="</table>";
 
 
 //실습. board list 를 c:forEach를 이용해서 출력해보세요
 // th태그 글번호, 제목, 작성자, 글내용
%>
 
<table border="1">
   <tr>
   <th>글번호</th>
   <th>제목</th>
   <th>내용</th>
   <th>작성자</th>
   </tr>
   <c:forEach var="i" items="<%=board_list %>" >
   <tr>
      <td>   ${i.getBno()}</td>
      <td>   ${i.getSubject()}</td>
      <td>   ${i.getContent()}</td>
      <td>   ${i.getWriter()}</td>
   </tr>      
   </c:forEach>
   
   </table>
<html>
<head>
<!-- bootstrap -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= bd_tbl %>

</body>
</html>