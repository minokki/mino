<%@page import="java.util.Enumeration"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- getAttributeNames() -->
	<h1>1. application객체의 속성들</h1>
	<%
		application.setAttribute("id", "sonny");
		application.setAttribute("pw", "abcdef");
		Enumeration<String> app = application.getAttributeNames();
		while(app.hasMoreElements()) {
			String name = app.nextElement();
			Object value = application.getAttribute(name);
	%>
			<h4>application객체의 속성 : <%= name %> : <%= value %></h4>
	<%
		}
	%>
	<hr />
	
	<h1>2. session객체의 속성들</h1>
	<%
		session.setAttribute("xxx", "111111111111");
		session.setAttribute("id", "hong");
		session.setAttribute("pw", "12345");
		
		Enumeration<String> sess = session.getAttributeNames();
		while(sess.hasMoreElements()) {
			String name = sess.nextElement();
			Object value = session.getAttribute(name);
	%>
			<h4>session 객체의 속성 : <%= name %> : <%= value %></h4>
	<%
		}
	%>
	
	<hr />
	
	<h1>3. request객체의 속성들</h1>
	<%
		request.setAttribute("id", "kim");
		request.setAttribute("pw", "minjae");		
		Enumeration<String> req = request.getAttributeNames();
		while(req.hasMoreElements()) {
			String name = req.nextElement();
			Object value = request.getAttribute(name);
	%>	
			<h4>request객체의 속성 : <%= name %> : <%= value %></h4>
	<%
		}
	%>	
</body>
</html>






























