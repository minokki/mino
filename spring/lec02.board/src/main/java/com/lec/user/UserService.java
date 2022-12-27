package com.lec.user;

import java.util.List;

import org.springframework.stereotype.Service;

public interface UserService {
	
	void insertUser(UserVO vo);
	void deleteUser(UserVO vo);
	void updateUser(UserVO vo);
	UserVO getUser(UserVO vo);
	List<UserVO> getUserList(UserVO vo);
	
}
