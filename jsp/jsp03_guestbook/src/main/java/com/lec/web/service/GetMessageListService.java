package com.lec.web.service;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import com.lec.web.dao.MessageDAO;
import com.lec.web.exception.ServiceException;
import com.lec.web.jdbc.ConnectionProvider;
import com.lec.web.jdbc.JDBCUtil;
import com.lec.web.model.Message;

public class GetMessageListService {

	// sigleton (메세지 값을 1개만 받게 제한하는 선언문)
	private GetMessageListService() {}
	private static GetMessageListService instance = new GetMessageListService();
	public static GetMessageListService getInstance() { return instance; }
	
	// 한페이지당 10건 제한
	private static final int MESSAGE_COUNT_PER_PAGE = 10;
	
	// 페이징 (논리주소의 메모리를 고정된 크기의 페이지(Page)로 나누어 관리하는 기법)
	public MessageListView getMessageList(int pageNumber) throws ServiceException {
		
		Connection conn = null;
		int currentPage = pageNumber;
		
		// 커넥션풀에서 사용가능한 Connection을 커넥션제공자(공장)에서 가져오기
		
		try {
			conn = ConnectionProvider.getConnection();
			MessageDAO messageDAO =  MessageDAO.getInstance();
			
			// 페이징처리
			int totalCount = messageDAO.selectCount(conn);
			
			List<Message> messageList = null;
			
			int start = 0;
			int end = 0;
			
			if(totalCount>0) {
				start = (pageNumber - 1) * MESSAGE_COUNT_PER_PAGE;
				end = MESSAGE_COUNT_PER_PAGE;
				messageList = messageDAO.selectList(conn, start, end);
				
			} else {
				currentPage = 0;
				messageList = Collections.emptyList();
			}
			return new MessageListView(messageList, totalCount, currentPage, MESSAGE_COUNT_PER_PAGE, start, end);
			
		} catch (SQLException e) {
			throw new ServiceException("메시지목록 가져오기 실패!! : " + e.getMessage());
		} finally {
			JDBCUtil.close(conn, null, null);
		}
	}
}
