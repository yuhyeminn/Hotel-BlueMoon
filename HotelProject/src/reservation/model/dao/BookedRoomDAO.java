package reservation.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import member.model.dao.MemberDAO;
import reservation.model.vo.BookedRoom;
import reservation.model.vo.MyReservation;


public class BookedRoomDAO {

	private Properties prop = new Properties();
	
	public BookedRoomDAO() {
		String fileName = MemberDAO.class.getResource("/sql/bookedroom/booked_room-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<BookedRoom> selectBookedRoom(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<BookedRoom> brList = new ArrayList<>();
		String query = prop.getProperty("selectBookedRoom");

		try {
			pstmt = conn.prepareStatement(query);

			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				BookedRoom br = new BookedRoom();
				br.setBookedNo(rset.getInt("booked_no"));
				br.setBookedRoomNo(rset.getInt("room_no"));
				br.setBookedResvNo(rset.getInt("resv_no"));
				br.setBookedPeople(rset.getInt("booked_people"));
				br.setBookedCheckIn(rset.getDate("booken_checkin"));
				br.setBookedCheckOut(rset.getDate("booked_checkout"));
				br.setBookedPrice(rset.getInt("booked_totalprice"));

				brList.add(br);

			}
//				System.out.println("brList@BookedRoomDAO="+brList);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return brList;
	}

	public List<BookedRoom> selectBookedRoomByMemberId(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<BookedRoom> brList = new ArrayList<>();
		String query = prop.getProperty("selectBookedRoomByMemberId");
//		System.out.println("query="+query);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			
			while (rset.next()) {
				BookedRoom br = new BookedRoom();
				br.setBookedNo(rset.getInt("booked_no"));
//				br.setBookedPrice(rset.getInt("booked_totalprice"));
				br.setBookedResvNo(rset.getLong("resv_no"));
				br.setBookedRoomNo(rset.getInt("room_no"));
				br.setBookedCheckIn(rset.getDate("booked_checkin"));
				br.setBookedCheckOut(rset.getDate("booked_checkout"));
				br.setBookedPeople(rset.getInt("booked_people"));

				brList.add(br);

			}
//			System.out.println("brList@DAO="+brList);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return brList;
	}

	public int cancelBookedRoom(Connection conn, long resvNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("cancelBookedRoom");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setLong(1, resvNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public List<MyReservation> selectMyResvByMemberId(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<MyReservation> list = new ArrayList<>();
		String query = prop.getProperty("selectMyResvByMemberId");
//		System.out.println("query="+query);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			
			while (rset.next()) {
				MyReservation mr = new MyReservation();
				mr.setBookedNo(rset.getInt("booked_no"));
				mr.setResvNo(rset.getLong("resv_no"));
				mr.setRoomName(rset.getString("room_name"));
				mr.setChkIn(rset.getDate("booked_checkin"));
				mr.setChkOut(rset.getDate("booked_checkout"));
				mr.setResvPeople(rset.getInt("booked_people"));
				mr.setResvBfPeople(rset.getInt("resv_breakfast"));
				mr.setResvCancel(rset.getString("resv_iscancel").charAt(0));

				list.add(mr);

			}
//			System.out.println("brList@DAO="+brList);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	
	
	
}
