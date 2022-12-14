<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="com.lec.member.Member" scope="request"/>
<div class="container">
	<h1>로그인(Java Beans 사용하기)</h1>
	<h3>id    : <%= member.getId() %></h3>
	<h3>pw    : <%= member.getPassword() %></h3>
	<h3>name  : <%= member.getName() %></h3>
	<h3>email : <%= member.getEmail() %></h3>
</div>