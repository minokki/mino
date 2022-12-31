package com.lec.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.lec.mvc.db.JDBCUtility;
import com.lec.mvc.vo.PageInfo;
import com.lec.mvc.vo.UserVO;

@Repository("userDAO")
public class UserDAO {

	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	UserVO user = null;
	
	
	public PageInfo getPageInfo(String tableName, int currentPage, int perPage) {
		
		PageInfo pageInfo = new PageInfo();
		String sql = "select count(*) from " + tableName;
		
		int totalCount = 0;
		int totalPages = 0;
		int startPage = 0;
		int endPage = 0;
		
		try {
			conn = JDBCUtility.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()) totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("DB." + tableName + " 접속 실패 !! : " + e.getMessage());
		} finally {
			JDBCUtility.close(conn, stmt, rs);
		}

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
		
		try {
			conn = JDBCUtility.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			while(rs.next()) {
				user = new UserVO();
				user.setId(rs.getString("id"));
				user.setPassword(rs.getString("password"));
				user.setName(rs.getString("name"));
				user.setRole(rs.getString("role"));
			}
		} catch (Exception e) {
			System.out.println("DB.USER 접속 실패!! : " + e.getMessage());
		} finally {
			JDBCUtility.close(conn, stmt, rs);
		}
		return user;
	}

	public List<UserVO> getUserList(int currentPage, int perPage) {
	
		UserVO userVO = null;
		List<UserVO> userList = new ArrayList<>();
		String sql = "select * from user limit ?, ?";
		
		try {
			conn = JDBCUtility.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, (currentPage-1) * perPage);
			stmt.setInt(2, perPage);
			rs = stmt.executeQuery();
			while(rs.next()) {
				userVO = new UserVO();
				userVO.setId(rs.getString("id"));
				userVO.setPassword(rs.getString("password"));
				userVO.setName(rs.getString("name"));
				userVO.setRole(rs.getString("role"));
				userList.add(userVO);
			}		
		} catch (Exception e) {
			System.out.println("DB.USER 접속 실패!!! : " + e.getMessage());
		} finally {
			JDBCUtility.close(conn, stmt, rs);
		}
		return userList;
	}

	public int insertUser(UserVO userVO) {
		
		String sql = "insert into user(id, password, name, role) values(?,?,?,?)";
		int insertCount = 0;
		
		String role = (userVO.getRole() !=null) ? "ADMIN" : "USER";
			
		try {
			conn = JDBCUtility.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, userVO.getId());
			stmt.setString(2, userVO.getPassword());
			stmt.setString(3, userVO.getName());
			stmt.setString(4, role);
			insertCount = stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("DB.USER 접속 실패!!! : " + e.getMessage());
		} finally {
			JDBCUtility.close(conn, stmt, rs);
		}
		return insertCount;
	}

	public int deleteUser(String id) {
		
		String sql = "delete from user where id = ?";
		int deleteCount = 0;
		
		try {
			conn = JDBCUtility.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			deleteCount = stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("DB.USER 접속 실패!!! : " + e.getMessage());
		} finally {
			JDBCUtility.close(conn, stmt, rs);
		}		
		return deleteCount;
	}

	public int updateUser(UserVO user) {
		
		
		String sql= "update user set name=?, password=?, role=? where id= ?";
		int updateCount = 0;
		try {
			conn = JDBCUtility.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, user.getName());
			stmt.setString(2, user.getPassword());
			stmt.setString(3, user.getRole() !=null?"ADMIN":"USER");
			stmt.setString(4, user.getId());
			
			updateCount = stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("DB연결 실패!"+ e.getMessage());
		}finally {
			JDBCUtility.close(conn, stmt, rs);
		}
		
		return updateCount;
		
	}

}




















