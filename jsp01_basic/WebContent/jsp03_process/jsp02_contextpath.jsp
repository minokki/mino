<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  
	JSP/Servlet은 웹애플리케이션이 사전에 정해진 규칙에 따라 특정폴더의 구조를 준수하도록
	강제화하고 있다. 이 구조를 모르면 제대로 동작하는 프로그램을 개발할 수 없데 된다.
	
	JSP/Servlet의 기본폴더 구조는
	
	웹애플리케이션이름 / root(jsp01_basic/WebContent) -> http://localhost:8080/jsp01_basic
	
	1. WEB_INF            : 웹애플케이션의 설정정보가 위치한다. 대표적인 설정정보는 web.xml파일이다.
	2. WEB_INF/classes    : 웹애플케이션에서 사용하는 java의 class파일이 위치한다.
	3. WEB_INF/lib        : 웹애플케이션에서 사용하는 라이브러리파일이 위치한다.(예를 들어 ojbc8.jar)
	4. WEB_INF/사용자폴더 : css, js, jsp, html드등 사용자가 작성하는 파일이 위치하는 폴더
	
	A. 컨텍스트경로
	
	   request객체에서 컨텍스트의 기본경로는 request.getContextPath()메서드로 확인할 수 있다.
	   
    B. 웹애플리케이션의 배포(deploy)
    
       개발된 웹애플리케이션을 WAS(Web Application Server)에 배포하는 방법은 2가지가 있다.
       
       a. 개발된 프로그램의 폴더 그대로 파일을 WAS에 복사하는 방법(톰캣서버폴더\webapps\ROOT)
       b. war파일 형식으로 압축해서 배포하는 방법
          ... jdk의 jar.exe명령어를 사용해서 war파일을 생성
          ... 실행방법 c:\>jar.exe cvf jsp01_basic.war *
          ... 상기 명령대신에 이클리스를 이용 : 프로젝트이름을 우클릭 > export > WAR file
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>웹 Context 경로 = <%= request.getContextPath() %></h3>
</body>
</html>
















