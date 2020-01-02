package reservation.model.service;

import static common.JDBCTemplate.*;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import reservation.model.dao.ReservationDAO;
import reservation.model.vo.Reservation;
import room.model.vo.Room;
public class ReservationService {

	public List<Room> selectAvailableRoomList(String checkindate, String checkoutdate, int roomcnt) {
		Connection conn = getConnection();
		List<Room> list= new ArrayList<>();
		Map<Integer,Integer> map = new ReservationDAO().selectReservedRoomCntList(conn,checkindate,checkoutdate);
		List<Room> roomlist = new ReservationDAO().selectAllRoomList(conn);
		for(Room r : roomlist) {
			int available = r.getRoomPeople() - map.get(r.getRoomNo());
			if(available>=roomcnt) {
				list.add(r);
			}
		}
		close(conn);
		return list;
	}

	public Map<String, Object> selectCouponListByMemberId(String memberId, int totalRoomPrice) {
		Connection conn = getConnection();
		Map<String, Object> map = new ReservationDAO().selectCouponListByMemberId(conn,memberId,totalRoomPrice);
		close(conn);
		return map;
	}

	public int insertReservation(Reservation resv) {
		Connection conn = getConnection();
		int result = new ReservationDAO().insertReservation(conn,resv);
		if(result>0) commit(conn);
		else commit(conn);
		return result;
	}



}
