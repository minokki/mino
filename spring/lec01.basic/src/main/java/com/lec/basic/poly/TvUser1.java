package com.lec.basic.poly;

public class TvUser1 {

	public static void main(String[] args) {
		
		// c:/java.exe 클래스이름 매개변수
		BeanFactory factory = new BeanFactory();
		
		// c:/java.exe 클래스 이름 매개변수
		Tv tv = (Tv) factory.getBean(args[0]);
		
		tv.powerOn();
		tv.powerOff();
		tv.volumnUp();
		tv.volumnDown();
	}

}

