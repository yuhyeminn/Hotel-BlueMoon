package reservation.model.service;

import java.sql.Connection;
import java.util.List;

import reservation.model.dao.BookedRoomDAO;
import reservation.model.vo.BookedRoom;
import reservation.model.vo.MyReservation;

import static common.JDBCTemplate.*;

public class BookedRoomService {

//	public List<BookedRoom> selectBookedRoom(int bookedNo){
//		Connection conn = getConnection();
//		List<BookedRoom> brList = new BookedRoomDAO().selectBookedRoom(conn, bookedNo);
//		close(conn);
//		return brList;
//		
//	}
	public List<BookedRoom> selectBookedRoom() {
		Connection conn = getConnection();
		List<BookedRoom> brList = new BookedRoomDAO().selectBookedRoom(conn);
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

	public int cancelBookedRoom(long resvNo) {
		Connection conn = getConnection();
		int result = new BookedRoomDAO().cancelBookedRoom(conn,resvNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public List<MyReservation> selectMyResvByMemberId(String memberId) {
		List<MyReservation> list = null;
		Connection conn = getConnection();
		list = new BookedRoomDAO().selectMyResvByMemberId(conn,memberId);
		close(conn);
		return list;
	}
	

}
