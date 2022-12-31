package com.lec.jdbc.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.lec.jdbc.impl.UserRowMapper;
import com.lec.jdbc.vo.PageInfo;
import com.lec.jdbc.vo.UserVO;

@Repository("userDAO")
public class UserDAO {
	// https://docs.spring.io/spring-framework/docs/current/reference/html/index.html
	private JdbcTemplate jdbcTemplate;
	
	public UserDAO() {
		AbstractApplicationContext container = new  GenericXmlApplicationContext("applicationContext.xml");
		this.jdbcTemplate = (JdbcTemplate) container.getBean("jdbcTemplate");
	}
	
	public PageInfo getPageInfo(String tableName, int currentPage, int perPage) {
		
		PageInfo pageInfo = new PageInfo();
		String sql = "select count(*) from " + tableName;
		
		int totalCount = 0;
		int totalPages = 0;
		int startPage = 0;
		int endPage = 0;

		totalCount = jdbcTemplate.queryForInt(sql);

		if(totalCount>0) {
			totalPages = (int)(totalCount / perPage) + ((totalCount % perPage == 0) ? 0 : 1);
			startPage = (int)(currentPage / perPage) * perPage + 1 + ((currentPage % perPage == 0) ? -perPage : 0);
			endPage = (startPage >= totalPages) ? totalPages : startPage + perPage - 1;
		}
				
		pageInfo.setTotalCount(totalCount);
		pageInfo.setTotalPages(totalPages);
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
			
		return pageInfo;
	}
		
	public UserVO getUser(String id) {
		String sql = "select * from user where id = ?";
		Object[] args = { id };
		return (UserVO) jdbcTemplate.queryForObject(sql, args, new UserRowMapper());
	}

	public List<UserVO> getUserList(int currentPage, int perPage) {	
		String sql = "select * from user limit ?, ?";
		Object[] args = { (currentPage-1)*perPage,  perPage};
		return jdbcTemplate.query(sql, args, new UserRowMapper());
	}

	public void insertUser(UserVO user) {
		String role = (user.getRole() != null) ? "ADMIN" : "USER";	
		String sql = "insert into user(id, password, name, role) values(?,?,?,?)";
		jdbcTemplate.update(sql, user.getId(), user.getPassword(), user.getName(), role);
	}

	public void deleteUser(String id) {
		String sql = "delete from user where id = ?";
		jdbcTemplate.update(sql, id);
	}

	public void updateUser(UserVO user) {	
		String role = (user.getRole() != null) ? "ADMIN" : "USER";	
		String sql = "update user set name=?, password=?, role=? where id = ?";
		jdbcTemplate.update(sql, user.getName(), user.getPassword(), role, user.getId());
	}
}