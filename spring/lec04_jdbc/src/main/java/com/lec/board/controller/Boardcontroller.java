package com.lec.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lec.board.service.BoardService;
import com.lec.board.vo.BoardVO;
import com.lec.board.vo.PageInfo;
import com.lec.jdbc.vo.UserVO;

@Controller
public class Boardcontroller {

	@Autowired BoardService boardService;
	
	@RequestMapping("boardList.do") 
	public String getBoardList(BoardVO boardVO, Model model,
			@RequestParam(defaultValue="1") int p,
			@RequestParam(defaultValue="10") int perPage) {
	
		PageInfo pageInfo = boardService.getPageInfo(p, perPage);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("boardList", boardService.getBoardList(p, perPage));
		return "board/board_list.jsp";
	}
	
	@RequestMapping("insertBoard.do")
	public String insertBoard(BoardVO board) {
		boardService.insertBoard(board);
		return "boardList.do";
	}
	
	@RequestMapping(value="deleteBoard.do", method=RequestMethod.GET)
	public String deleteBoardView(@RequestParam int seq) {
		boardService.deleteBoard(seq);
		return "board/board_delete.jsp";
	}
	
	@RequestMapping(value="/updateBoard.do", method=RequestMethod.GET)
	public String updateBaord(Model model, @RequestParam int seq) { 
		model.addAttribute("board", boardService.selectBoard(seq));
		return "board/board_update.jsp";
	}
	
	@RequestMapping(value="/updateBoard.do", method=RequestMethod.POST)
	public String updateBaord(BoardVO board) { 
		boardService.updateBoard(board);
		return "boardList.do";
	}
	
	@RequestMapping(value="/boardView.do", method=RequestMethod.GET)
	public String seleteViewBoard(Model model, @RequestParam int seq ) {
	 model.addAttribute("board", boardService.selectBoard(seq));
	 boardService.cntBoard(seq);
	 return "board/board_view.jsp";
	}
	 
	
	
}
