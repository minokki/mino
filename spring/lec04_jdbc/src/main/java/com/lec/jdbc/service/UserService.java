package com.lec.jdbc.service;

import java.util.List;

import com.lec.jdbc.vo.PageInfo;
import com.lec.jdbc.vo.UserVO;

public interface UserService {

	void insertUser(UserVO user);
	void deleteUser(String id);
	void updateUser(UserVO user);
	UserVO selectUser(String id);
	List<UserVO> getUserList(int currentPage, int perPage);
	PageInfo getPageInfo(int currentPage, int perPage);
}
