package com.lec.el;

import java.util.HashMap;
import java.util.Map;

public class Thermometer {

	private Map<String, Double> map = new HashMap<>();
	
	public String getInfo() {
		return "섭씨/화씨로 변환하는 온도계 프로그램(V1.0)";
	}
	
	public String getXxx() {
		return "임의의 문자열을 리턴하는 메서드";
	}
	
	public void setCelsius(String city, Double val) {
		map.put(city, val);
	}
	
	public Double getCelsius(String city) {
		return map.get(city);
	}
	
	public Double getFahreheit(String city) {
		Double celsius = getCelsius(city);
		if(celsius==null) return null;
		return celsius.doubleValue() * 1.8 + 32.0;
	}
}
