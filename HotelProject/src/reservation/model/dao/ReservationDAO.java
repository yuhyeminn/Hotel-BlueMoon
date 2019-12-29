package reservation.model.dao;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	public List<Room> selectAvailableRoomList(Connection conn, Map<String, String> informMap) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Room> list = null;
		String query = prop.getProperty("selectAvailableRoomList");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
}
