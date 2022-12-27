package com.lec.basic.poly3;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.lec.basic.poly.Tv;

public class TvUser {

	public static void main(String[] args) {

		// 1. Spring 컨테이너 구동
		AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext3.xml");
		Tv tv=new SamsungTv();
		
		tv.volumnUp();
		tv.volumnDown();
		
}
}