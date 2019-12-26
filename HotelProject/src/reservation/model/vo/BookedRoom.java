package reservation.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BookedRoom implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int bookedNo;
	private String bookedRoomName;
	private int bookedResvNo;
	private int bookedPeople;
	private Date bookedCheckIn;
	private Date bookedCheckOut;
	private int bookedPrice;
	
	public BookedRoom() {
		super();
	}

	public BookedRoom(int bookedNo, String bookedRoomName, int bookedResvNo, int bookedPeople, Date bookedCheckIn,
			Date bookedCheckOut, int bookedPrice) {
		super();
		this.bookedNo = bookedNo;
		this.bookedRoomName = bookedRoomName;
		this.bookedResvNo = bookedResvNo;
		this.bookedPeople = bookedPeople;
		this.bookedCheckIn = bookedCheckIn;
		this.bookedCheckOut = bookedCheckOut;
		this.bookedPrice = bookedPrice;
	}

	public int getBookedNo() {
		return bookedNo;
	}

	public void setBookedNo(int bookedNo) {
		this.bookedNo = bookedNo;
	}

	public String getBookedRoomName() {
		return bookedRoomName;
	}

	public void setBookedRoomName(String bookedRoomName) {
		this.bookedRoomName = bookedRoomName;
	}

	public int getBookedResvNo() {
		return bookedResvNo;
	}

	public void setBookedResvNo(int bookedResvNo) {
		this.bookedResvNo = bookedResvNo;
	}

	public int getBookedPeople() {
		return bookedPeople;
	}

	public void setBookedPeople(int bookedPeople) {
		this.bookedPeople = bookedPeople;
	}

	public Date getBookedCheckIn() {
		return bookedCheckIn;
	}

	public void setBookedCheckIn(Date bookedCheckIn) {
		this.bookedCheckIn = bookedCheckIn;
	}

	public Date getBookedCheckOut() {
		return bookedCheckOut;
	}

	public void setBookedCheckOut(Date bookedCheckOut) {
		this.bookedCheckOut = bookedCheckOut;
	}

	public int getBookedPrice() {
		return bookedPrice;
	}

	public void setBookedPrice(int bookedPrice) {
		this.bookedPrice = bookedPrice;
	}

	@Override
	public String toString() {
		return "BookedRoom [bookedNo=" + bookedNo + ", bookedRoomName=" + bookedRoomName + ", bookedResvNo="
				+ bookedResvNo + ", bookedPeople=" + bookedPeople + ", bookedCheckIn=" + bookedCheckIn
				+ ", bookedCheckOut=" + bookedCheckOut + ", bookedPrice=" + bookedPrice + "]";
	}
	
	
	


}
