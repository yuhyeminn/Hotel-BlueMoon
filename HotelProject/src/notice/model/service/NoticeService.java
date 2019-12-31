package notice.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import notice.model.dao.NoticeDAO;
import notice.model.vo.Notice;

public class NoticeService {

	public List<Notice> selectNoticeAll(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Notice> list = new NoticeDAO().selectNoticeAll(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int selectNoticeCount() {
		Connection conn = getConnection();
		int totalContent = new NoticeDAO().selectNoticeCount(conn);
		close(conn);
		return totalContent;
	}
	

	public Notice selectNoticeOne(int noticeNo, boolean hasRead) {
		Connection conn = getConnection();
		int result = 0;
		
		if(!hasRead) {
			result = new NoticeDAO().increaseReadCount(conn, noticeNo);
		}
		
		Notice n = new NoticeDAO().selectNoticeOne(conn, noticeNo);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);		
		return n;
	}

	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		int result = new NoticeDAO().insertNotice(conn, n);
		//트랜잭션 처리
		if(result>0) {
			
			n.setNoticeNo(new NoticeDAO().selectLastSeq(conn));
			commit(conn);
		}
		else 
			rollback(conn);
		close(conn);
		return result;
	}

	public Notice selectNoticeOne(int noticeNo) {
		Connection conn = getConnection();
		int result = 0;
		
		Notice notice = new NoticeDAO().selectNoticeOne(conn, noticeNo);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return notice;
	}

	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		int result = new NoticeDAO().updateNotice(conn, n);
		
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		
		return result;
	}

	public int deleteNotice(Notice n) {
		Connection conn = getConnection();
		int result = new NoticeDAO().deleteNotice(conn, n);
		
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		
		return result;
	}

	public List<Notice> selectNoticeAll() {
		Connection conn = getConnection();
		List<Notice> list = new NoticeDAO().selectNoticeAll(conn);
		close(conn);
		return list;
	}

	public List<Notice> selectNoticeSearch(String noticeSearch, String searchType) {
		Connection conn = getConnection();
		List<Notice> list = new NoticeDAO().selectNoticeSearch(conn,noticeSearch,searchType);
		close(conn);
		return list;
	}

}
