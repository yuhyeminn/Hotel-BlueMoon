package reservation.model.service;

import java.sql.Connection;
import java.util.List;

import reservation.model.dao.BookedRoomDAO;
import reservation.model.vo.BookedRoom;

import static common.JDBCTemplate.*;

public class BookedRoomService {

//	public List<BookedRoom> selectBookedRoom(int bookedNo){
//		Connection conn = getConnection();
//		List<BookedRoom> brList = new BookedRoomDAO().selectBookedRoom(conn, bookedNo);
//		close(conn);
//		return brList;
//		
//	}
	public List<BookedRoom> selectBookedRoom(String memberId) {
		Connection conn = getConnection();
		List<BookedRoom> brList = new BookedRoomDAO().selectBookedRoom(conn,memberId);
		System.out.println("brList@BookedRoomserivce="+brList);
		close(conn);
		return brList;
	}
	
	

	public List<BookedRoom> selectBookedRoomByMemberId(String memberId) {
		List<BookedRoom> list = null;
		Connection conn = getConnection();
		list = new BookedRoomDAO().selectBookedRoomByMemberId(conn,memberId);
		close(conn);
		return list;
	}

	public int cancelBookedRoom(int bookedNo) {
		Connection conn = getConnection();
		int result = new BookedRoomDAO().cancelBookedRoom(conn,bookedNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

}
