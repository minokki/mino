package com.lec.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.vo.ActionFoward;

public class BoardModifyAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		
		System.out.println("===> 글 수정하기");
		
		
		return null;
	}

}
