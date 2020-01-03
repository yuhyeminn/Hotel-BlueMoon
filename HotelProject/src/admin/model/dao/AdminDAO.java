package admin.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.util.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import member.model.vo.Member;
import oracle.sql.DATE;
import question.model.vo.Comment;
import question.model.vo.Question;
import reservation.model.vo.ReservationCount;
import room.model.vo.Room;

public class AdminDAO {

	private Properties prop = new Properties();

	public AdminDAO() {
		try {
			// 클래스객체 위치찾기 : 절대경로를 반환한다.
			String fileName = AdminDAO.class.getResource("/sql/admin/admin-query.properties").getPath();
			prop.load(new FileReader(fileName));

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Question> selectQuestionList(Connection conn, int cPage, int numPerPage) {
		List<Question> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectQuestionListByPaging");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Question q = new Question();
				q.setQuestionNo(rset.getInt("question_no"));
				q.setQuestionWriter(rset.getString("question_writer"));
				q.setQuestionCode(rset.getString("question_name"));
				q.setQuestionTitle(rset.getString("question_title"));
				q.setQuestionContent(rset.getString("question_content"));
				q.setQuestionDate(rset.getDate("question_date"));
				q.setQuestionOriginalFileName(rset.getString("question_originalFileName"));
				q.setQuestionRenamedFileName(rset.getString("question_renamedFileName"));
				q.setQuestionAnswer(rset.getString("question_answer"));

				list.add(q);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public List<Question> selectQuestionByMemberId(Connection conn, String searchKeyword, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Question> list = null;
		String query = prop.getProperty("selectQuestionByMemberIdByPaging");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + searchKeyword + "%");

			// (공식1)
			pstmt.setInt(2, (cPage - 1) * numPerPage + 1);// start rownum
			pstmt.setInt(3, cPage * numPerPage);// end rownum

			rset = pstmt.executeQuery();

			list = new ArrayList<>();
			while (rset.next()) {
				Question q = new Question();
				q.setQuestionNo(rset.getInt("question_no"));
				q.setQuestionWriter(rset.getString("question_writer"));
				q.setQuestionCode(rset.getString("question_name"));
				q.setQuestionTitle(rset.getString("question_title"));
				q.setQuestionContent(rset.getString("question_content"));
				q.setQuestionDate(rset.getDate("question_date"));
				q.setQuestionOriginalFileName(rset.getString("question_originalFileName"));
				q.setQuestionRenamedFileName(rset.getString("question_renamedFileName"));
				q.setQuestionAnswer(rset.getString("question_answer"));

				list.add(q);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public List<Question> selectQuestionByQuestionName(Connection conn, String searchKeyword, int cPage,
			int numPerPage) {
		List<Question> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQuestionByQuestionNameByPaging");

		try {
			// statement객체 생성. 미완성 쿼리 전달
			pstmt = conn.prepareStatement(sql);
			// 미완성쿼리에 데이터 전달
			pstmt.setString(1, searchKeyword);
			pstmt.setInt(2, (cPage - 1) * numPerPage + 1);// start rownum
			pstmt.setInt(3, cPage * numPerPage);// end rownum

			// 쿼리실행
			rset = pstmt.executeQuery();
			// rset의 결과 list에 옮기기
			list = new ArrayList<>();
			while (rset.next()) {
				Question q = new Question();
				q.setQuestionNo(rset.getInt("question_no"));
				q.setQuestionWriter(rset.getString("question_writer"));
				q.setQuestionCode(rset.getString("question_name"));
				q.setQuestionTitle(rset.getString("question_title"));
				q.setQuestionContent(rset.getString("question_content"));
				q.setQuestionDate(rset.getDate("question_date"));
				q.setQuestionOriginalFileName(rset.getString("question_originalFileName"));
				q.setQuestionRenamedFileName(rset.getString("question_renamedFileName"));
				q.setQuestionAnswer(rset.getString("question_answer"));

				list.add(q);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public List<Question> selectQuestionByAnswer(Connection conn, String searchKeyword, int cPage, int numPerPage) {
		List<Question> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQuestionByAnswerByPaging");

		try {
			// statement객체 생성. 미완성 쿼리 전달
			pstmt = conn.prepareStatement(sql);
			// 미완성쿼리에 데이터 전달
			pstmt.setString(1, searchKeyword);
			pstmt.setInt(2, (cPage - 1) * numPerPage + 1);// start rownum
			pstmt.setInt(3, cPage * numPerPage);// end rownum

			// 쿼리실행
			rset = pstmt.executeQuery();
			// rset의 결과 list에 옮기기
			list = new ArrayList<>();
			while (rset.next()) {
				Question q = new Question();
				q.setQuestionNo(rset.getInt("question_no"));
				q.setQuestionWriter(rset.getString("question_writer"));
				q.setQuestionCode(rset.getString("question_name"));
				q.setQuestionTitle(rset.getString("question_title"));
				q.setQuestionContent(rset.getString("question_content"));
				q.setQuestionDate(rset.getDate("question_date"));
				q.setQuestionOriginalFileName(rset.getString("question_originalFileName"));
				q.setQuestionRenamedFileName(rset.getString("question_renamedFileName"));
				q.setQuestionAnswer(rset.getString("question_answer"));

				list.add(q);
			}

			System.out.println("list@dao=" + list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int selectTotalContent(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectTotalContent");
		int totalContent = 0;

		try {
			pstmt = conn.prepareStatement(query);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				totalContent = rset.getInt("cnt");
			}

			System.out.println("totalContent@dao=" + totalContent);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return totalContent;
	}

	public int selectTotalContentByMemberId(Connection conn, String searchKeyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectTotalContentByMemberId");
		int totalContent = 0;

		System.out.println(query);

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + searchKeyword + "%");

			rset = pstmt.executeQuery();

			if (rset.next())
				totalContent = rset.getInt("cnt");

			System.out.println("totalContent@dao=" + totalContent);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return totalContent;
	}

	public int selectTotalContentByQuestionName(Connection conn, String searchKeyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectTotalContentByQuestionName");
		int totalContent = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, searchKeyword);

			rset = pstmt.executeQuery();

			if (rset.next())
				totalContent = rset.getInt("cnt");

			System.out.println("totalContent@dao=" + totalContent);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return totalContent;
	}

	public int selectTotalContentByAnswer(Connection conn, String searchKeyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectTotalContentByAnswer");
		int totalContent = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, searchKeyword);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				totalContent = rset.getInt("cnt");
			}

			System.out.println("totalContent@dao=" + totalContent);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return totalContent;
	}

	public int deleteQuestion(Connection conn, int qnaNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteQuestion");

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, qnaNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertRoom(Connection conn, Room r) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertRoom");
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getRoomName());
			pstmt.setString(2, r.getRoomDescribe());
			pstmt.setString(3, r.getRoomDescribe2());
			pstmt.setInt(4, r.getRoomPeople());
			pstmt.setString(5, r.getRoomBed());
			pstmt.setString(6, r.getRoomView());
			pstmt.setInt(7, r.getRoomPrice());
			pstmt.setInt(8, r.getRoomBfPrice());
			pstmt.setInt(9, r.getRoomAmount());
			pstmt.setInt(10, r.getRoomSize());
			pstmt.setString(11, r.getOriginalFileName());
			pstmt.setString(12, r.getRenamedFileName());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public int insertComment(Connection conn, Comment c) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertComment");

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, c.getQuestionRef());
			pstmt.setString(2, "admin");
			pstmt.setString(3, c.getCommentContent());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<Room> selectRoomList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectRoomList");
		List<Room> list = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);// start rownum
			pstmt.setInt(2, cPage * numPerPage);// end rownum

			rset = pstmt.executeQuery();

			while (rset.next()) {
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
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	public int updateCommnet(Connection conn, Comment c) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateCommnet");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "T");
			pstmt.setInt(2, c.getQuestionRef());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int selectRoomCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectRoomCount");
		int totalContent = 0;

		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();

			if (rset.next())
				totalContent = rset.getInt("cnt");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContent;
	}

	public int deleteRoom(Connection conn, String roomName) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteRoom");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, roomName);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<Room> selectAllRoomList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectAllRoomList");
		List<Room> list = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();

			while (rset.next()) {
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
			System.out.println("AllRoomList@dao=" + list);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public Room selectOne(Connection conn, int roomNo) {
		Room r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectOneByRoomNo");
		try {
			// 미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			// 쿼리문미완성
			pstmt.setInt(1, roomNo);
			// 쿼리문실행
			// 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			rset = pstmt.executeQuery();

			if (rset.next()) {
				r = new Room();
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
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return r;

	}

	/*public List<ReservationCount> selectResvCountMonth(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<ReservationCount> rcMonthList = null;
		ReservationCount rc = null;
		String query = prop.getProperty("selectResvCountMonth");
		System.out.println("DAO@query="+query);
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			rcMonthList = new ArrayList<>();
			
			while(rset.next()) {
				rc = new ReservationCount();
				rc.setDay(rset.getInt("day"));
				rc.setResvCount(rset.getInt("resvcount"));
				rc.setResvPrice(rset.getInt("price"));
				rcMonthList.add(rc);
			}
			System.out.println("rcList@DAO="+rcMonthList);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return rcMonthList;
	}*/
	
	
	
	public List<ReservationCount> selectResvCountYear(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<ReservationCount> rcYearList = null;
		ReservationCount rc = null;
		String query = prop.getProperty("selectResvCountYear");
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			rcYearList = new ArrayList<>();
			
			while(rset.next()) {
				rc = new ReservationCount();
				rc.setDay(rset.getInt("day"));
				rc.setResvCount(rset.getInt("resvcount"));
				rc.setResvPrice(rset.getInt("price"));
				rcYearList.add(rc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return rcYearList;
	}

	public List<ReservationCount> select2019Month(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<ReservationCount> month2019List = null;
		ReservationCount rc = null;
		String query = prop.getProperty("selectMonthByYear");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, "20190101");
			pstmt.setString(2, "20191231");
			rset = pstmt.executeQuery();
			month2019List = new ArrayList<>();
			
			while(rset.next()) {
				rc = new ReservationCount();
				rc.setDay(rset.getInt("day"));
				rc.setResvCount(rset.getInt("resvcount"));
				rc.setResvPrice(rset.getInt("price"));
				month2019List.add(rc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return month2019List;
	}

	public List<ReservationCount> select2020Month(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<ReservationCount> month2020List = null;
		ReservationCount rc = null;
		String query = prop.getProperty("selectNextYear");
		System.out.println("DAOSelect@="+query);
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, "20200101");
			pstmt.setString(2, "20201231");
			rset = pstmt.executeQuery();
			month2020List = new ArrayList<>();
			
			while(rset.next()) {
				rc = new ReservationCount();
				rc.setDay(rset.getInt("day"));
				rc.setResvCount(rset.getInt("resvcount"));
				rc.setResvPrice(rset.getInt("price"));
				month2020List.add(rc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("DAO@2020List="+month2020List);
		return month2020List;
	}

}
