package com.lec.basic.poly3;


import com.lec.basic.poly.Tv;
import com.lec.basic.poly3.SonnySpeaker;


public class SamsungTv implements Tv{

	//생성자인젝션 이용하기
	//xml설정파일에 등록된 클레스로 객체를 생성할 때는 기본 생성자를 호출한다.
	//하지만 컨테이너가 매개변수를 가지는 생성자를 호출할 수 있도록 설정할 수 있다.
	// 생성자 인젝션을 이용하면 생성자의 매개변수로 의존관계에 있는
	//객체를 주입할 수 있다.
	private Speaker speaker;
	private int price;
	
	public SamsungTv() {System.out.println("==>1.Samsung() 생성자 호출");};
	public SamsungTv(Speaker speaker) {
		System.out.println("==>2.Samsung(speaker) 생성자 호출");
		this.speaker = speaker;
		}
	public SamsungTv(Speaker speaker,int price) {
		System.out.println("==>3.Samsung(speaker, price) 생성자 호출");
		this.speaker = speaker;
	}
	
	
	public void powerOn() {	System.out.println("Samsung TV - powerOn!!");	}
	public void powerOff() {	System.out.println("Samsung TV - powerOff!!");	}
	public void volumnUp() { speaker.volumnUp();}
	public void volumnDown() {speaker.volumnDown();}
	
	
}