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

}
