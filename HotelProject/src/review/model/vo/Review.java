package review.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Review implements Serializable{

	private static final long serialVersionUID = 1L;
	 
	private int reviewNo;
	private String reviewWriter;
	private long resvNo;
	private int roomNo;
	private String reviewContent;
	private Date reviewDate;
	private int reviewStarClean;
	private int reviewStarComm;
	private int reviewStarCheckIn;
	private int reviewStarLocation;
	private int reviewStarValue;
	
	
	public Review() {
		super();
	}


	public Review(int reviewNo, String reviewWriter, long resvNo, int roomNo, String reviewContent, Date reviewDate,
			int reviewStarClean, int reviewStarComm, int reviewStarCheckIn, int reviewStarLocation,
			int reviewStarValue) {
		super();
		this.reviewNo = reviewNo;
		this.reviewWriter = reviewWriter;
		this.resvNo = resvNo;
		this.roomNo = roomNo;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.reviewStarClean = reviewStarClean;
		this.reviewStarComm = reviewStarComm;
		this.reviewStarCheckIn = reviewStarCheckIn;
		this.reviewStarLocation = reviewStarLocation;
		this.reviewStarValue = reviewStarValue;
	}


	public int getReviewNo() {
		return reviewNo;
	}


	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}


	public String getReviewWriter() {
		return reviewWriter;
	}


	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}


	public long getResvNo() {
		return resvNo;
	}


	public void setResvNo(long resvNo) {
		this.resvNo = resvNo;
	}


	public int getRoomNo() {
		return roomNo;
	}


	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}


	public String getReviewContent() {
		return reviewContent;
	}


	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}


	public Date getReviewDate() {
		return reviewDate;
	}


	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
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
		return "Review [reviewNo=" + reviewNo + ", reviewWriter=" + reviewWriter + ", resvNo=" + resvNo + ", roomNo="
				+ roomNo + ", reviewContent=" + reviewContent + ", reviewDate=" + reviewDate + ", reviewStarClean="
				+ reviewStarClean + ", reviewStarComm=" + reviewStarComm + ", reviewStarCheckIn=" + reviewStarCheckIn
				+ ", reviewStarLocation=" + reviewStarLocation + ", reviewStarValue=" + reviewStarValue + "]";
	}
}
