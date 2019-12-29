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

import member.model.vo.Member;
import question.model.vo.Comment;
import question.model.vo.Question;

public class AdminDAO {
	
	private Properties prop = new Properties();
	
    public AdminDAO(){
        try {
            //클래스객체 위치찾기 : 절대경로를 반환한다. 
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
        
        try{
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, (cPage-1)*numPerPage+1);
            pstmt.setInt(2, cPage*numPerPage);

            rset = pstmt.executeQuery();
            
            while(rset.next()){
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
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            close(rset);
            close(pstmt);
        }
        return list;
    }

    
	public List<Question> selectQuestionByMemberId(Connection conn, 
											   String searchKeyword, 
											   int cPage, 
											   int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Question> list = null;
		String query = prop.getProperty("selectQuestionByMemberIdByPaging");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+searchKeyword+"%");
			
			//(공식1)
			pstmt.setInt(2,(cPage-1)*numPerPage+1);//start rownum
			pstmt.setInt(3, cPage*numPerPage);//end rownum
			
			
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
	
	
	public List<Question> selectQuestionByQuestionName(Connection conn, String searchKeyword, int cPage, int numPerPage) {
		List<Question> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQuestionByQuestionNameByPaging");
		
		try {
			//statement객체 생성. 미완성 쿼리 전달
			pstmt = conn.prepareStatement(sql);
			//미완성쿼리에 데이터 전달
			pstmt.setString(1, searchKeyword);
			pstmt.setInt(2,(cPage-1)*numPerPage+1);//start rownum
			pstmt.setInt(3, cPage*numPerPage);//end rownum
			
			//쿼리실행
			rset = pstmt.executeQuery();
			//rset의 결과 list에 옮기기
			list = new ArrayList<>();
			while(rset.next()) {
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
			//statement객체 생성. 미완성 쿼리 전달
			pstmt = conn.prepareStatement(sql);
			//미완성쿼리에 데이터 전달
			pstmt.setString(1, searchKeyword);
			pstmt.setInt(2,(cPage-1)*numPerPage+1);//start rownum
			pstmt.setInt(3, cPage*numPerPage);//end rownum
			
			//쿼리실행
			rset = pstmt.executeQuery();
			//rset의 결과 list에 옮기기
			list = new ArrayList<>();
			while(rset.next()) {
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
			
			System.out.println("list@dao="+list);
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

	public int selectTotalContentByMemberId(Connection conn, String searchKeyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectTotalContentByMemberId");
		int totalContent = 0;

		System.out.println(query);
	
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+searchKeyword+"%");
			
			rset = pstmt.executeQuery();
			
			if(rset.next())
				totalContent = rset.getInt("cnt");
			
			System.out.println("totalContent@dao="+totalContent);
			
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
			
			if(rset.next())
				totalContent = rset.getInt("cnt");
			
			System.out.println("totalContent@dao="+totalContent);
			
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


}







