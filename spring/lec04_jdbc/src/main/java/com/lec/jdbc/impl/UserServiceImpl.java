package com.lec.jdbc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.jdbc.dao.UserDAO;
import com.lec.jdbc.service.UserService;
import com.lec.jdbc.vo.PageInfo;
import com.lec.jdbc.vo.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public void insertUser(UserVO user) {
		userDAO.insertUser(user);
	}

	@Override
	public void deleteUser(String id) {
		userDAO.deleteUser(id);
	}

	@Override
	public void updateUser(UserVO user) {
		userDAO.updateUser(user);
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
		return userDAO.getPageInfo("user", currentPage, perPage);
	}

}
