package com.lec.basic.poly;

import com.lec.basic.poly2.SamsungTv;

public class TvUser {
public static void main(String[] args) {
	
	SamsungTv tv = new SamsungTv();
	//LgTv tv= new LgTv();
	
	tv.powerOn();
	tv.powerOff();
	tv.volumnUp();
	tv.volumnDown();
}
}
