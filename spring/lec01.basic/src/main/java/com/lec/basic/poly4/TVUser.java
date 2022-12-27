package com.lec.basic.poly4;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TVUser {

	public static void main(String[] args) {
		
		AbstractApplicationContext factory = new  GenericXmlApplicationContext("applicationContext4.xml");
		TV tv = (TV) factory.getBean("tv");
	
		tv.powerOn();
		tv.powerOff();
		tv.volumnUp();
		tv.volumnDown();
	}
}
