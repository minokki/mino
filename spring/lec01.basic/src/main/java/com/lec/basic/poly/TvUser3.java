package com.lec.basic.poly;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TvUser3 {

	public static void main(String[] args) {
		AbstractApplicationContext factory = new  GenericXmlApplicationContext("applicationContext.xml");
		Tv tv1 = (Tv) factory.getBean("tv");
		Tv tv2 = (Tv) factory.getBean("tv");
		Tv tv3 = (Tv) factory.getBean("tv");
	}

}
