<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>절대경로를 이용해서 파일읽기</h1>
	<%
		String path = "D:/Back/04.jsp/jsp01_basic/WebContent/jsp04_object/sample.txt";
	
		//java.io, java.nio
		char[] cbuf = new char[128];
		int len = -1;
		
		try(InputStreamReader isr = new InputStreamReader(new FileInputStream(path), "utf-8")){
			while((len=isr.read(cbuf)) != -1){
				out.println(new String(cbuf, 0, len));
			}
		}catch(Exception e){
			out.println("에러 : " + e.getLocalizedMessage());
		}
	%>
</body>
</html>