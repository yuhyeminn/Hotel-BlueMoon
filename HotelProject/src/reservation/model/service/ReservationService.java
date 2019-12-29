package reservation.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import reservation.model.dao.ReservationDAO;
import room.model.vo.Room;
public class ReservationService {

	public List<Room> selectAvailableRoomList(Map<String, String> informMap) {
		Connection conn = getConnection();
		List<Room> list = new ReservationDAO().selectAvailableRoomList(conn,informMap);
		close(conn);
		return list;
	}


}
