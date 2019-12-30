package member.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import member.model.vo.Member;
import review.model.vo.ReviewN;
import review.model.vo.ReviewNN;
import room.model.vo.Room;

public class MemberDAO {
	
	private Properties prop = new Properties();
	
	public MemberDAO() {
		String fileName = MemberDAO.class.getResource("/sql/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	

	public Member selectOne(Connection conn, String memberId) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOne");
		
		try {
			//1.Statement객체생성
			pstmt = conn.prepareStatement(query);//미완성 쿼리 전달
			
			//2.미완성 쿼리 값대입
			pstmt.setString(1, memberId);
			
			//3.쿼리실행 => ResultSet
			rset = pstmt.executeQuery();
			
			//4.ResultSet => Member
			if(rset.next()) {
				m = new Member();
				
				m.setMemberId(rset.getString("member_id"));
				m.setPassword(rset.getString("member_password"));
				m.setMemberName(rset.getString("member_name"));
				m.setBirth(rset.getString("member_birth"));
				m.setEmail(rset.getString("member_email"));
				m.setPhone(rset.getString("member_phone"));
				m.setPoint(rset.getInt("member_points"));
				m.setEnrollDate(rset.getDate("member_enrolldate"));//날짜형
			}
			
			System.out.println("member@dao.selectOne="+m);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//5.자원반납
			close(rset);
			close(pstmt);
		}
		
		return m;
	}



	public int insertMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertMember"); 
		
		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getMemberName());
			pstmt.setString(4, member.getBirth());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getPhone());
			pstmt.setInt(7, member.getPoint());
			
			//쿼리문실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			//DML은 executeUpdate()
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}



	public int updateMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateMember"); 

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getPhone());
			pstmt.setString(2, member.getEmail());
			pstmt.setString(3, member.getMemberId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}



	public int deleteMember(Connection conn, String memberId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteMember"); 

		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setString(1, memberId);
			
			//쿼리문실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			//DML은 executeUpdate()
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}



	public int updatePassword(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updatePassword"); 

		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getMemberId());
			
			//쿼리문실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			//DML은 executeUpdate()
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}



	public List<ReviewN> selectReviewN(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectReviewN");
		List<ReviewN> list = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				ReviewN r = new ReviewN();
				r.setMemberId(rset.getString("member_id"));
				r.setRoomName(rset.getString("room_name"));
				r.setResvIn(rset.getDate("resv_in"));
				r.setResvOut(rset.getDate("resv_out"));
				r.setResvPeople(rset.getInt("resv_people"));
				r.setRoomNo(rset.getInt("room_no"));
				r.setResvNo(rset.getDouble("resv_no"));
				r.setRoomRenamedFileName(rset.getString("room_renamed_filename"));
				
				list.add(r);
			}
//			System.out.println("selectReviewN@dao=" + list);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}



	public List<ReviewNN> selectReviewNN(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectReviewNN");
		List<ReviewNN> list = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				ReviewNN r = new ReviewNN();
				r.setMemberId(rset.getString("member_id"));
				r.setRoomName(rset.getString("room_name"));
				r.setResvIn(rset.getDate("resv_in"));
				r.setResvOut(rset.getDate("resv_out"));
				r.setResvPeople(rset.getInt("resv_people"));
				r.setRoomNo(rset.getInt("room_no"));
				r.setRoomRenamedFileName(rset.getString("room_renamed_filename"));
				r.setReviewNo(rset.getInt("review_no"));
				r.setReviewContent(rset.getString("review_content"));
				r.setReviewStarClean(rset.getInt("review_starclean"));
				r.setReviewStarComm(rset.getInt("review_starcomm"));
				r.setReviewStarCheckIn(rset.getInt("review_starcheckin"));
				r.setReviewStarLocation(rset.getInt("review_starlocation"));
				r.setReviewStarValue(rset.getInt("review_starvalue"));
				
				list.add(r);
			}
			System.out.println("selectReviewNN@dao=" + list);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}



}
