package com.lec.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lec.mvc.service.UserService;
import com.lec.mvc.vo.PageInfo;
import com.lec.mvc.vo.UserVO;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("getUserList.do") 
	public String getUserList(UserVO userVO, Model model,
			@RequestParam(defaultValue="1") int p,
			@RequestParam(defaultValue="10") int perPage) {
	
		PageInfo pageInfo = userService.getPageInfo(p, perPage);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("userList", userService.getUserList(p, perPage));
		return "user/user_list.jsp";
	}
	
	@RequestMapping("insertUser.do")
	public String insertUser(UserVO user) {
		int insertCount = userService.insertUser(user);
		return "getUserList.do";
	}
	
	@RequestMapping(value="/deleteUser.do", method=RequestMethod.GET)
	public String deleteUserView(@RequestParam String id) {
		return "user/user_delete.jsp?id=" + id;
	}
	
	@RequestMapping(value="/deleteUser.do", method=RequestMethod.POST)
	public String deleteUser(@RequestParam String id) {
		int deleteCount = userService.deleteUser(id);
		return "getUserList.do";
	}
	
	@RequestMapping(value="/updateUser.do", method=RequestMethod.GET)
	public String updateUser(Model model, @RequestParam String id ) {
		model.addAttribute("user", userService.selectUser(id));
		return "user/user_update.jsp";
	}
	@RequestMapping(value="/updateUser.do", method=RequestMethod.POST)
	public String updateUser(UserVO user) {
		int updateCount = userService.updateUser(user);
		return "getUserList.do";
	}
}
