package review.model.vo;

import java.io.Serializable;
import java.sql.Date;

/**
 * 
 * @author Administrator
 * VO for review Not Null(written)
 */
public class ReviewNN implements Serializable {

	private static final long serialVersionUID = 1L;

	private String memberId;
	private String roomName;
	private Date resvIn;
	private Date resvOut;
	private int resvPeople;
	private int roomNo;
	private String roomRenamedFileName;
	private int reviewNo;
	private String reviewContent;
	private int reviewStarClean;
	private int reviewStarComm;
	private int reviewStarCheckIn;
	private int reviewStarLocation;
	private int reviewStarValue;
	
	
	public ReviewNN() {
		super();
	}


	public ReviewNN(String memberId, String roomName, Date resvIn, Date resvOut, int resvPeople, int roomNo,
			String roomRenamedFileName, int reviewNo, String reviewContent, int reviewStarClean, int reviewStarComm,
			int reviewStarCheckIn, int reviewStarLocation, int reviewStarValue) {
		super();
		this.memberId = memberId;
		this.roomName = roomName;
		this.resvIn = resvIn;
		this.resvOut = resvOut;
		this.resvPeople = resvPeople;
		this.roomNo = roomNo;
		this.roomRenamedFileName = roomRenamedFileName;
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.reviewStarClean = reviewStarClean;
		this.reviewStarComm = reviewStarComm;
		this.reviewStarCheckIn = reviewStarCheckIn;
		this.reviewStarLocation = reviewStarLocation;
		this.reviewStarValue = reviewStarValue;
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


	public String getRoomRenamedFileName() {
		return roomRenamedFileName;
	}


	public void setRoomRenamedFileName(String roomRenamedFileName) {
		this.roomRenamedFileName = roomRenamedFileName;
	}


	public int getReviewNo() {
		return reviewNo;
	}


	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}


	public String getReviewContent() {
		return reviewContent;
	}


	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}


	public int getReviewStarClean() {
		return reviewStarClean;
	}


	public void setReviewStarClean(int reviewStarClean) {
		this.reviewStarClean = reviewStarClean;
	}


	public int getReviewStarComm() {
		return reviewStarComm;
	}


	public void setReviewStarComm(int reviewStarComm) {
		this.reviewStarComm = reviewStarComm;
	}


	public int getReviewStarCheckIn() {
		return reviewStarCheckIn;
	}


	public void setReviewStarCheckIn(int reviewStarCheckIn) {
		this.reviewStarCheckIn = reviewStarCheckIn;
	}


	public int getReviewStarLocation() {
		return reviewStarLocation;
	}


	public void setReviewStarLocation(int reviewStarLocation) {
		this.reviewStarLocation = reviewStarLocation;
	}


	public int getReviewStarValue() {
		return reviewStarValue;
	}


	public void setReviewStarValue(int reviewStarValue) {
		this.reviewStarValue = reviewStarValue;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "ReviewNN [memberId=" + memberId + ", roomName=" + roomName + ", resvIn=" + resvIn + ", resvOut="
				+ resvOut + ", resvPeople=" + resvPeople + ", roomNo=" + roomNo + ", roomRenamedFileName="
				+ roomRenamedFileName + ", reviewNo=" + reviewNo + ", reviewContent=" + reviewContent
				+ ", reviewStarClean=" + reviewStarClean + ", reviewStarComm=" + reviewStarComm + ", reviewStarCheckIn="
				+ reviewStarCheckIn + ", reviewStarLocation=" + reviewStarLocation + ", reviewStarValue="
				+ reviewStarValue + "]";
	}
}
