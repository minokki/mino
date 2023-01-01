<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 

	jsp 페이지의 구성요소
	
	1. 디렉티브(지시어,directive)   @<- 지시어
	
		디렉티브는 jsp페이지에 대한 설정정보를 저장(지시)할 때 사용한다. 
		선언방법 '< %@ 디렉티브이름 속성= "값",...%>'
		
		jsp가 사용하는 디렉티브
		
		a. page  : jsp페이지에 대한 정보를 제공, jsp가 생성하는 문서타입, 버퍼크기, 에러페이지등...
		b. taglib : jsp페이지에서 사용할 taglib를 제공
		c. include : jsp페이지에 다른 jsp페이지를 로딩
					예를 들어서 header,footer 처럼 고정적인 페이지를 공통으로 사용되는 페이지를 loading
					
	2. 스크립트(script)
	
		jsp에서 jsp파일을 동적으로 생성하기 위해 사용하는 것으로 스크립트요소를 사용하면 
		사용자가 jsp페이지에 입력한 정보를 DB에 저장,검색, 출력등을 할 수가 있다.
		스크립트를 사용하면 자바가 제공하는 다양한  기능들을 사용할 수가 있다. jsp를 스크립트언어
		라고 하는데 그 이유가 이러한 스크립트 코드를 제공하기 때문이다.
		
		JSP의 스크립트 요소는
		
		a. 표현식 : < %= %>, 지정된 변수나 메서드의 결과를 출력한다.
		b. 스크립트릿 : < % %>, 자바코드를 실행한다.
		c. 선언식  : < %! %>, 자바의 변수나 메서드를 선언한다.
		
	3. 기본객체(내장객체, implict object)
	
		 JSP는 웹애플리케이션 프로그래밍을 하는데 필요한 기능을 제공해 주는 기본객체를 제공한다.
		 이 기본객체는 application, session, page, requst(요청한 정보), response(응답된 정보) 등을
		 기본으로 제공되는 객체를 말한다.
		 이러한 객체들은 각각의 객체마다 고유한 속성 또는 기능을 제공하는데 요청된 파라미터의 값을
		 읽거나 응답결과를 설정, 세션정보의 처리등 웹 애플리케이션에서 필요한 기능을 제공한다.
		 
		 a. application : 웹애플리케이션의 전반적인 정보를 저장
		 b. sesstion :  http세션 정보를 저장하는 객체
		 c. page : jsp페이지의 정보를 저장
		 d. request : 웹브라우저가 웹서버에 요청하는 정보를 전달하는 객체
		 e. response : 웹서버에 요청된 결과를 응답해주는 역할을 하는 객체
		 f. out : DOM을 출력하는 스트림 객체
		
	4. 표현언어(EL, Expression Language)
	5. 정적인 데이터
	6. 표준액션태그(Action Tag)
	7. 커스텀 태그(Custom tag)
	8. 표준라이브러리(JSTL)
 -->

</body>
</html>