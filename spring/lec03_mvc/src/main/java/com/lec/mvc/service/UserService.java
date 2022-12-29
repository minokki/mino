package com.lec.mvc.service;

import java.util.List;

import com.lec.mvc.vo.PageInfo;
import com.lec.mvc.vo.UserVO;

public interface UserService {

	int insertUser(UserVO user);
	int deleteUser(String id);
	int updateUser(String id);
	UserVO selectUser(String id);
	List<UserVO> getUserList(int currentPage,int perPage);
	PageInfo getPageInfo(int currentPage,int perPage);
}
