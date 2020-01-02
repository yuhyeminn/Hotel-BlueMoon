package review.model.vo;

import java.io.Serializable;
import java.sql.Date;

/**
 * 
 * @author Administrator
 * VO for review is null (not written)
 *
 */
public class ReviewN implements Serializable{

	private static final long serialVersionUID = 1L;

	private String memberId;
	private String roomName;
	private Date resvIn;
	private Date resvOut;
	private int resvPeople;
	private int roomNo;
	private long resvNo;
	private String roomRenamedFileName;
	
	
	public ReviewN() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ReviewN(String memberId, String roomName, Date resvIn, Date resvOut, int resvPeople, int roomNo, long resvNo,
			String roomRenamedFileName) {
		super();
		this.memberId = memberId;
		this.roomName = roomName;
		this.resvIn = resvIn;
		this.resvOut = resvOut;
		this.resvPeople = resvPeople;
		this.roomNo = roomNo;
		this.resvNo = resvNo;
		this.roomRenamedFileName = roomRenamedFileName;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getRoomName() {
		return roomName;
	}


	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}


	public Date getResvIn() {
		return resvIn;
	}


	public void setResvIn(Date resvIn) {
		this.resvIn = resvIn;
	}


	public Date getResvOut() {
		return resvOut;
	}


	public void setResvOut(Date resvOut) {
		this.resvOut = resvOut;
	}


	public int getResvPeople() {
		return resvPeople;
	}


	public void setResvPeople(int resvPeople) {
		this.resvPeople = resvPeople;
	}


	public int getRoomNo() {
		return roomNo;
	}


	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}


	public long getResvNo() {
		return resvNo;
	}


	public void setResvNo(long resvNo) {
		this.resvNo = resvNo;
	}


	public String getRoomRenamedFileName() {
		return roomRenamedFileName;
	}


	public void setRoomRenamedFileName(String roomRenamedFileName) {
		this.roomRenamedFileName = roomRenamedFileName;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "ReviewN [memberId=" + memberId + ", roomName=" + roomName + ", resvIn=" + resvIn + ", resvOut="
				+ resvOut + ", resvPeople=" + resvPeople + ", roomNo=" + roomNo + ", resvNo=" + resvNo
				+ ", roomRenamedFileName=" + roomRenamedFileName + "]";
	}
	
	
	
}
