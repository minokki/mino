package com.lec.user;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.lec.web.BoardService;

public class UserMain {

	public static void main(String[] args) {
		AbstractApplicationContext factory = new  GenericXmlApplicationContext("UserContext.xml");
		UserService userService =  (UserService) factory.getBean("userService");
		
		UserVO user = new UserVO();
		
		
		
		user.setId("고민호");
		
		userService.getUser(user);
		
		
		factory.close();
	}
}
