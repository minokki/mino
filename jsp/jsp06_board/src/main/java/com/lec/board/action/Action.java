package com.lec.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.vo.ActionFoward;

public interface Action {

	public ActionFoward execute(HttpServletRequest req, HttpServletResponse res) throws Exception;
}
