package admin.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import admin.model.vo.AdminReservation;
import coupon.model.vo.Coupon;
import coupon.model.vo.CouponKind;
import member.model.vo.Member;
import question.model.vo.Comment;
import question.model.vo.Question;
import review.model.vo.Review;
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

	public int updateRoomByRoomNo(Connection conn, Room r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateRoomByRoomNo"); 
		System.out.println("updateRoom@DAO"+r);
		//UPDATE ROOM SET ROOM_NAME = ?, ROOM_DESCRIBE = ?, ROOM_DESCRIBE2 = ?, ROOM_PEOPLE = ?, ROOM_BED = ?,
		//ROOM_VIEW = ?, ROOM_PRICE = ?, ROOM_AMOUNT = ?, ROOM_SIZE = ? WHERE ROOM_NO = ?
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getRoomName());
			pstmt.setString(2, r.getRoomDescribe());
			pstmt.setString(3, r.getRoomDescribe2());
			pstmt.setInt(4, r.getRoomPeople());
			pstmt.setString(5, r.getRoomBed());
			pstmt.setString(6, r.getRoomView());
			pstmt.setInt(7, r.getRoomPrice());
			pstmt.setInt(8, r.getRoomAmount());
			pstmt.setInt(9, r.getRoomSize());
			pstmt.setInt(10, r.getRoomNo());
			
			result = pstmt.executeUpdate();
			
			System.out.println("updateRoom@DAO"+(result==1?"탈퇴성공":"탈퇴실패"));
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	//min
	public List<Member> selectMemberList(Connection conn, int cPage, int numPerPage) {
        List<Member> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String query = prop.getProperty("selectMemberListByPaging");
        
        try{
            //미완성쿼리문을 가지고 객체생성. 
            pstmt = conn.prepareStatement(query);
            //cPage, numPerPage
            //1, 10 => 1, 10 => 0+1
            //2, 10 => 11, 20 => 10+1
            //3, 10 => 21, 30 => 20+1
            //(공식1)시작rownum, 끝rownum
            pstmt.setInt(1, (cPage-1)*numPerPage+1);
            pstmt.setInt(2, cPage*numPerPage);
            
            
            //쿼리문실행
            //완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
            rset = pstmt.executeQuery();
            
            while(rset.next()){
                Member m = new Member();
                //컬럼명은 대소문자 구분이 없다.
                m.setMemberId(rset.getString("member_id"));
                m.setPassword(rset.getString("member_password"));
                m.setMemberName(rset.getString("member_name"));
                m.setBirth(rset.getString("member_birth"));
                m.setEmail(rset.getString("member_email"));
                m.setPhone(rset.getString("member_phone"));
                m.setPoint(rset.getInt("member_points"));
                m.setEnrollDate(rset.getDate("member_enrolldate"));
                
                list.add(m);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            close(rset);
            close(pstmt);
        }
        return list;
    }
    public List<AdminReservation> selectReservationList(Connection conn, int cPage, int numPerPage) {
        List<AdminReservation> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String query = prop.getProperty("selectReservationListByPaging");
        
        try{
            //미완성쿼리문을 가지고 객체생성. 
            pstmt = conn.prepareStatement(query);
            //cPage, numPerPage
            //1, 10 => 1, 10 => 0+1
            //2, 10 => 11, 20 => 10+1
            //3, 10 => 21, 30 => 20+1
            //(공식1)시작rownum, 끝rownum
            pstmt.setInt(1, (cPage-1)*numPerPage+1);
            pstmt.setInt(2, cPage*numPerPage);
            
            
            //쿼리문실행
            //완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
            rset = pstmt.executeQuery();
            
            while(rset.next()){
                AdminReservation ar = new AdminReservation();
                //컬럼명은 대소문자 구분이 없다.
                ar.setNo(rset.getLong("resv_no"));
                ar.setRsvMember(rset.getString("resv_member"));
                ar.setPeople(rset.getInt("resv_people"));
                ar.setUsedPnt(rset.getInt("resv_usedpoint"));
                ar.setAddPnt(rset.getInt("resv_addpoint"));
                ar.setEnrollDate(rset.getDate("resv_date"));
                ar.setPrice(rset.getInt("resv_price"));
                ar.setCancel(rset.getString("resv_iscancel").charAt(0));
                ar.setChkIn(rset.getDate("resv_in"));
                ar.setChkOut(rset.getDate("resv_out"));
                ar.setBreakfast(rset.getInt("resv_breakfast"));
                
                
                list.add(ar);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            close(rset);
            close(pstmt);
        }
        return list;
    }
    
    public List<Review> selectReviewList(Connection conn, int cPage, int numPerPage) {
        List<Review> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String query = prop.getProperty("selectReviewListByPaging");
        
        try{
            //미완성쿼리문을 가지고 객체생성. 
            pstmt = conn.prepareStatement(query);
            //cPage, numPerPage
            //1, 10 => 1, 10 => 0+1
            //2, 10 => 11, 20 => 10+1
            //3, 10 => 21, 30 => 20+1
            //(공식1)시작rownum, 끝rownum
            pstmt.setInt(1, (cPage-1)*numPerPage+1);
            pstmt.setInt(2, cPage*numPerPage);
            
            
            //쿼리문실행
            //완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
            rset = pstmt.executeQuery();
            
            while(rset.next()){
                Review r = new Review();
                //컬럼명은 대소문자 구분이 없다.
                r.setReviewNo(rset.getInt("review_no"));
                r.setReviewWriter(rset.getString("review_writer"));
                r.setReviewContent(rset.getString("review_content"));
                r.setReviewDate(rset.getDate("review_date"));
                
                list.add(r);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            close(rset);
            close(pstmt);
        }
        return list;
    }
    
    public List<Coupon> selectCouponList(Connection conn, int cPage, int numPerPage) {
    	 List<Coupon> list = new ArrayList<>();
         PreparedStatement pstmt = null;
         ResultSet rset = null;
         
         String query = prop.getProperty("selectCouponListByPaging");
         
         try{
             //미완성쿼리문을 가지고 객체생성. 
             pstmt = conn.prepareStatement(query);
             //cPage, numPerPage
             //1, 10 => 1, 10 => 0+1
             //2, 10 => 11, 20 => 10+1
             //3, 10 => 21, 30 => 20+1
             //(공식1)시작rownum, 끝rownum
             pstmt.setInt(1, (cPage-1)*numPerPage+1);
             pstmt.setInt(2, cPage*numPerPage);
             
             
             //쿼리문실행
             //완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
             rset = pstmt.executeQuery();
             
             while(rset.next()){
                 Coupon c = new Coupon();
                 //컬럼명은 대소문자 구분이 없다.
                 c.setCouponNo(rset.getString("coupon_no"));
                 c.setCouponCode(rset.getString("coupon_code"));
                 c.setCouponMemberId(rset.getString("member_id"));
                 c.setCouponStartDate(rset.getDate("coupon_startDate"));
                 c.setCouponEndDate(rset.getDate("coupon_endDate"));
                 c.setCouponUsed(rset.getString("coupon_used").charAt(0));
                 
                 list.add(c);
             }
         }catch(Exception e){
             e.printStackTrace();
         }finally{
             close(rset);
             close(pstmt);
         }
         return list;
	}
    
    public List<CouponKind> selectCouponKindList(Connection conn, int cPage, int numPerPage) {
    	List<CouponKind> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String query = prop.getProperty("selectCouponKindListByPaging");
        
        try{
            //미완성쿼리문을 가지고 객체생성. 
            pstmt = conn.prepareStatement(query);
            //cPage, numPerPage
            //1, 10 => 1, 10 => 0+1
            //2, 10 => 11, 20 => 10+1
            //3, 10 => 21, 30 => 20+1
            //(공식1)시작rownum, 끝rownum
            pstmt.setInt(1, (cPage-1)*numPerPage+1);
            pstmt.setInt(2, cPage*numPerPage);
            
            
            //쿼리문실행
            //완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
            rset = pstmt.executeQuery();
            
            while(rset.next()){
                CouponKind ck = new CouponKind();
                //컬럼명은 대소문자 구분이 없다.
                ck.setCouponCode(rset.getInt("coupon_code"));
                ck.setCouponContent(rset.getString("coupon_content"));
                ck.setCouponSalePercent(rset.getInt("coupon_salePercent"));
                ck.setCouponMinimum(rset.getInt("coupon_min"));
                
                list.add(ck);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            close(rset);
            close(pstmt);
        }
        return list;
	}
    
	public int selectTotalMemberContent(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectTotalMemberContent");
		int totalContent = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				totalContent = rset.getInt("cnt");
			}
			
			System.out.println("totalContent@dao="+totalContent);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContent;
	}
	public int selectTotalReviewContent(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectTotalReviewContent");
		int totalContent = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				totalContent = rset.getInt("cnt");
			}
			
			System.out.println("totalContent@dao="+totalContent);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContent;
	}
	public int selectTotalResvContent(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectTotalResvContent");
		int totalContent = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				totalContent = rset.getInt("cnt");
			}
			
			System.out.println("totalContent@dao="+totalContent);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContent;
	}
	public int selectTotalCpnContent(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectTotalCpnContent");
		int totalContent = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				totalContent = rset.getInt("cnt");
			}
			
			System.out.println("totalContent@dao="+totalContent);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContent;
	}
	public int selectTotalCpnKindContent(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectTotalCpnKindContent");
		int totalContent = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				totalContent = rset.getInt("cnt");
			}
			
			System.out.println("totalContent@dao="+totalContent);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContent;
	}

	public int createCoupon(Connection conn, CouponKind ck) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("createCouponKind"); 
		
		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setString(1, ck.getCouponContent());
			pstmt.setInt(2, ck.getCouponSalePercent());
			pstmt.setInt(3, ck.getCouponMinimum());
			
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

	public int deleteMember(Connection conn, String memberId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteMember");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public long deleteReservation(Connection conn, long resvNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteReservation");

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

	public int deleteCouponKind(Connection conn, int couponCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteCouponKind");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setLong(1, couponCode);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteReview(Connection conn, String rvWriter) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteReview");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, rvWriter);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
