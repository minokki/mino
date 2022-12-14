package com.lec.el;

import java.text.DecimalFormat;

public class StaticMethod {

	public static String staticMethod(long num, String pattern) {
		DecimalFormat ptrn = new DecimalFormat(pattern);
		return ptrn.format(num);
	}
}
