package com.lec.basic.poly;

public class LgTv implements Tv{

	//초기화 메서드
	public void initMethod() {System.out.println("==> 초기화메서드 호출(초기화작업)");}
	
	public LgTv() {System.out.println("==>Lg() 생성자 호출");};
	public void powerOn() {	System.out.println("Lg Tv - powerOn!!");	}
	public void powerOff() {	System.out.println("Lg Tv - powerOff!!");	}
	public void volumnUp() {	System.out.println("Lg Tv - volumUp!!");	}
	public void volumnDown() {	System.out.println("Lg Tv - volumOff!!");	}
	
}