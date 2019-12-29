package admin.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import admin.model.dao.AdminDAO;
import member.model.vo.Member;
import room.model.vo.Room;

public class AdminService {
	
    public List<Member> selectMemberList(int cPage, int numPerPage) {
        Connection conn = getConnection();
        List<Member> list= new AdminDAO().selectMemberList(conn, cPage, numPerPage);
        close(conn);
        return list;
    }

	public List<Member> selectMemberByMemberId(String searchKeyword, 
											   int cPage, 
											   int numPerPage) {
		List<Member> list = null;
		Connection conn = getConnection();
		list = new AdminDAO().selectMemberByMemberId(conn, searchKeyword, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public List<Member> selectMemberByMemberName(String searchKeyword, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Member> list = new AdminDAO().selectMemberByMemberName(conn, searchKeyword, cPage, numPerPage);
		close(conn);
		return list;
	}

	public List<Member> selectMemberByGender(String searchKeyword, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Member> list = new AdminDAO().selectMemberByGender(conn, searchKeyword, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int selectTotalContent() {
		Connection conn = getConnection();
		int totalContent = new AdminDAO().selectTotalContent(conn);
		close(conn);
		return totalContent;
	}

	public int selectTotalContentByMemberId(String searchKeyword) {
		Connection conn = getConnection();
		int totalContent = new AdminDAO().selectTotalContentByMemberId(conn, searchKeyword);
		close(conn);
		return totalContent;
	}

	public int selectTotalContentByMemberName(String searchKeyword) {
		Connection conn = getConnection();
		int totalContent = new AdminDAO().selectTotalContentByMemberName(conn, searchKeyword);
		close(conn);
		return totalContent;
	}

	public int selectTotalContentByGender(String searchKeyword) {
		Connection conn = getConnection();
		int totalContent = new AdminDAO().selectTotalContentByGender(conn, searchKeyword);
		close(conn);
		return totalContent;
	}

	public int insertRoom(Room r) {
		Connection conn = getConnection();
		int result = new AdminDAO().insertRoom(conn, r);
		//트랜잭션 처리
		if(result>0) 
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}

	public List<Room> selectRoomList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Room> list 
			= new AdminDAO().selectRoomList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int selectRoomCount() {
		Connection conn = getConnection();
		int totalContent = new AdminDAO().selectRoomCount(conn);
		close(conn);
		return totalContent;
	}

	public int deleteRoom(String roomName) {
		Connection conn = getConnection();
		int result = new AdminDAO().deleteRoom(conn, roomName);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		
		return result;
	}

	public List<Room> selectAllRoomList() {
		Connection conn = getConnection();
		List<Room> list = new AdminDAO().selectAllRoomList(conn);
		close(conn);
		return list;
	}

	public Room selectOne(int roomNo) {
		Connection conn = getConnection();
		Room r = new AdminDAO().selectOne(conn, roomNo);
		close(conn);
		return r;
	
	}

}





