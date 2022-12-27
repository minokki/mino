package com.lec.basic.scan;

import org.springframework.stereotype.Component;

@Component("tv")	
public class LGTV implements TV{
	
	public LGTV() {
		System.out.println("==> @Component - LGTV 객체 생성!!!");
	}
	@Override
	public void powerOn() {	}
	@Override
	public void powerOff() {	}
	@Override
	public void volumnUp() {	}
	@Override
	public void volumnDown() {	}

}
