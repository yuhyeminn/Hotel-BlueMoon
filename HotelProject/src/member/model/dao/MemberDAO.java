package member.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import member.model.vo.Member;

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



	public Member selectMemberId(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;
		String query = prop.getProperty("selectMemberId");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getMemberName());
			pstmt.setString(2, m.getEmail());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				member = new Member();
				
				member.setMemberId(rset.getString("member_id"));
				member.setPassword(rset.getString("member_password"));
				member.setMemberName(rset.getString("member_name"));
				member.setBirth(rset.getString("member_birth"));
				member.setEmail(rset.getString("member_email"));
				member.setPhone(rset.getString("member_phone"));
				member.setPoint(rset.getInt("member_points"));
				member.setEnrollDate(rset.getDate("member_enrolldate"));
			}
			System.out.println("memberFinder@DAO="+member);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}



	public Member selectMemberPW(Connection conn, Member m) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;
		String query = prop.getProperty("selectMemberPW");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberName());
			pstmt.setString(3, m.getEmail());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				member = new Member();
				
				member.setMemberId(rset.getString("member_id"));
				member.setPassword(rset.getString("member_password"));
				member.setMemberName(rset.getString("member_name"));
				member.setBirth(rset.getString("member_birth"));
				member.setEmail(rset.getString("member_email"));
				member.setPhone(rset.getString("member_phone"));
				member.setPoint(rset.getInt("member_points"));
				member.setEnrollDate(rset.getDate("member_enrolldate"));
			}
			System.out.println("memberFinder@DAO="+member);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
		
	}



	public Member selectMemberByEmail(Connection conn, String email) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectMemberByEmail");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member();
				m.setMemberId(rset.getString("member_id"));
				m.setPassword(rset.getString("member_password"));
				m.setMemberName(rset.getString("member_name"));
				m.setBirth(rset.getString("member_birth"));
				m.setEmail(rset.getString("member_email"));
				m.setPhone(rset.getString("member_phone"));
				m.setPoint(rset.getInt("member_points"));
				m.setEnrollDate(rset.getDate("member_enrolldate"));
			}
			System.out.println("memberByEmail@dao.selectOne="+m);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
		
	}



}
