package com.lec.basic.poly;

import com.lec.basic.poly2.SamsungTv;

public class BeanFactory {

		public Object getBean(String beanName) {
		
			if(beanName.equals("Lg")) {
				return new LgTv();
			}else if(beanName.equals("Samsung")){
				return new SamsungTv();
			}
			return null;
		}

	
}
