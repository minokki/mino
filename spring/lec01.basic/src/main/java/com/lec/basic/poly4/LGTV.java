package com.lec.basic.poly4;

public class LGTV implements TV {

	private Speaker speaker;
	private int price;
	
	public LGTV() {
		System.out.println("==> LGTV 객체생성!!");
	}

	public void setSpeaker(Speaker speaker) {
		this.speaker = speaker;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public void powerOn() {
		System.out.println("==> LGTV 파워 온 (price = " + this.price + "원)");
	}

	@Override
	public void powerOff() {
		System.out.println("==> LGTV 파워 오프");		
	}

	@Override
	public void volumnUp() {
		this.speaker.volumnUp();
	}

	@Override
	public void volumnDown() {
		this.speaker.volumnDown();
	}
	
	
}
