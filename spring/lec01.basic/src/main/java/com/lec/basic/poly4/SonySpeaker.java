package com.lec.basic.poly4;

public class SonySpeaker implements Speaker {

	 public SonySpeaker() {
		System.out.println("==> SonySpeaker 객체 생성");
	}
	 
	@Override
	public void volumnUp() {
		System.out.println("==> SonySpeaker 볼륨 업");
	}

	@Override
	public void volumnDown() {
		System.out.println("==> SonySpeaker 볼륨 다운");
	}
}
