package reservation.model.dao;
import static common.JDBCTemplate.close;

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

import coupon.model.vo.Coupon;
import notice.model.dao.NoticeDAO;
import reservation.model.vo.Reservation;
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
		}finally {
			close(rset);
			close(pstmt);
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
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return map;
	}
	public Map<String, Object> selectCouponListByMemberId(Connection conn, String memberId, int totalRoomPrice) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Object> list = new ArrayList<>();
		String query = prop.getProperty("selectCouponListByMemberId");
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, totalRoomPrice);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.clear();
				list.add(rset.getString("coupon_content"));
				list.add(rset.getString("coupon_salePercent"));
				System.out.println("couponlist@dao="+list);
				map.put(rset.getString("coupon_no"), list);
			}
			System.out.println("couponmap@dao="+map);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return map;
	}
	public int insertReservation(Connection conn, Reservation resv) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertReservation");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, resv.getResvMemberId());
			pstmt.setInt(2, resv.getResvPeople());
			pstmt.setInt(3, resv.getResvUsedPoint());
			pstmt.setInt(4, resv.getResvAddPoint());
			pstmt.setInt(5, resv.getResvPrice());
			pstmt.setDate(6, resv.getResvIn());
			pstmt.setDate(7, resv.getResvOut());
			pstmt.setInt(8, resv.getResvBfPeople());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	
}
