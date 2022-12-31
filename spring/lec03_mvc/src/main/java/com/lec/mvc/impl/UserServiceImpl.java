package com.lec.mvc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.mvc.dao.UserDAO;
import com.lec.mvc.service.UserService;
import com.lec.mvc.vo.PageInfo;
import com.lec.mvc.vo.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public int insertUser(UserVO user) {
		return userDAO.insertUser(user);
	}

	@Override
	public int deleteUser(String id) {
		return userDAO.deleteUser(id);
	}

	@Override
	public int updateUser(UserVO user) {
		return userDAO.updateUser(user);
	}

	@Override
	public UserVO selectUser(String id) {
		return userDAO.getUser(id);
	}

	@Override
	public List<UserVO> getUserList(int currentPage, int perPage) {
		return userDAO.getUserList(currentPage, perPage);
	}

	@Override
	public PageInfo getPageInfo(int currentPage, int perPage) {
		return userDAO.getPageInfo("user",currentPage, perPage);
	}

}
