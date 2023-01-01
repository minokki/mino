<%@page import="java.util.Map"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!--  
	톰캣에서 get/post방식으로 전달되는 파마미터의 값을 읽어 올 때 사용하는
	문자셋은 기본적으로 utf-8로 전달된다. 그렇기 때문에 tomcat에서는 별도로
	문자셋을 설정하지 않아도 utf-8문자셋을 사용한다. 하지만 utf-8이 아닌
	문자셋을 파라미터로 전달하는 경우에는 server.xml의 <connector>태그의
	useBodyEncodingForURI="true"를 추가하면 된다.
	
	true로 설정할 경우에는 get방식으로 전달되는 파라미터값을 읽을 때 request
	객체의 setCharacterEncoding("utf-8")메서드를 호출해서 지정된 문자셋을 
	사용할 수 있게 한다.
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>요청된 파라미터의 정보 조회</h1>
	<h3>getParameter(String name)</h3>
	name 파라미터 : <%= request.getParameter("name") %> <br>
	pw 파라미터   : <%= request.getParameter("pw") %> <br>
	addr 파라미터 : <%= request.getParameter("addr") %> <br>
	hobby 파라미터: <%= request.getParameter("hobby") %> <br>
	<hr />
	<%
		String[] hobbies = request.getParameterValues("hobby");
		if(hobbies != null) {
			for(String hobby:hobbies) {
	%>
				취미 = <%= hobby %><br>
	<%
			}
		}
	%>
	<hr />
	
	<h3>getParameterMap()</h3>
	<%
		Map<String, String[]> map = request.getParameterMap();
		String[] values = map.get("name");
		if(values != null) {
			for(int i=0;i<values.length;i++) {
	%>
				요청파라미터(name)의 값 = <%= values[i] %><br>
	<%
			}
		}
	%>
	<hr />
	
	<%
		map = request.getParameterMap();
		values = map.get("hobby");
		if(values != null) {
			for(int i=0;i<values.length;i++) {
	%>
				요청파라미터(hobby)의 값 = <%= values[i] %><br>
	<%
			}
		}
	%>	
</body>
</html>



<!--  자바소스 안에 jsp소스가 있다면 자바소스와 jsp소스 따로 지정해 줘야한다. -->












