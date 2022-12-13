<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- status가 A이면 A등급, 아니면 등급외 출력 -->
<%
	String sts = request.getParameter("status");

	if(sts.equals("A")) {
		out.println("<h3 class='text-primary'>" + sts + "등급 제품입니다!!</h3>");
	} else {
		out.println("<h3 class='text-primary'> 등급외 제품입니다!!</h3>");		
	}
%>