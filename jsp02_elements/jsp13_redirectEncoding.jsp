<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String value = "안녕하세요?";
	//sendRedirect할 경우 한글을 인코딩해서 전달해야 안깨진다.
	//String hangul = URLEncoder.encode(value, "utf-8");
	//String hangul = URLDecoder.decode(value, "utf-8");
	response.sendRedirect("jsp13_parameters.jsp?=hello=" + value);
%>