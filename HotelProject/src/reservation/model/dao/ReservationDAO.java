package reservation.model.dao;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import notice.model.dao.NoticeDAO;
import room.model.vo.Room;

public class ReservationDAO {
	private Properties prop = new Properties();

	public ReservationDAO() {
		String fileName = NoticeDAO.class.getResource("/sql/reservation/resv-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public List<Room> selectAllRoomList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Room> list = new ArrayList<>();
		String query = prop.getProperty("selectAllRoomList");
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Room r = new Room();
				r.setRoomNo(rset.getInt("room_no"));
				r.setRoomName(rset.getString("room_name"));
				r.setRoomDescribe(rset.getString("room_describe"));
				r.setRoomDescribe2(rset.getString("room_describe2"));
				r.setRoomPeople(rset.getInt("room_people"));
				r.setRoomBed(rset.getString("room_bed"));
				r.setRoomView(rset.getString("room_view"));
				r.setRoomPrice(rset.getInt("room_price"));
				r.setRoomBfPrice(rset.getInt("room_bfPrice"));
				r.setRoomAmount(rset.getInt("room_amount"));
				r.setRoomSize(rset.getInt("room_size"));
				r.setOriginalFileName(rset.getString("room_original_filename"));
				r.setRenamedFileName(rset.getString("room_renamed_filename"));
				
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	//해당 체크인 체크아웃날짜에 예약된 객실(room_no)의 개수
	public Map<Integer, Integer> selectReservedRoomCntList(Connection conn, String checkindate, String checkoutdate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Map<Integer, Integer> map = new HashMap<>();
		String query = prop.getProperty("selectReservedRoomCntList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, checkindate);
			pstmt.setString(2, checkoutdate);
			pstmt.setString(3, checkindate);
			pstmt.setString(4, checkoutdate);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				map.put(rset.getInt("room_no"), rset.getInt("cnt"));
				System.out.println("room_no@dao="+rset.getInt("room_no")+" cnt@dao="+rset.getInt("cnt"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return map;
	}

	
}
