package reservation.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BookedRoom implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int bookedNo;
	private int bookedRoomNo;
	private long bookedResvNo;
	private int bookedPeople;
	private Date bookedCheckIn;
	private Date bookedCheckOut;
	private int bookedPrice;
	private int bookedBreakfast;
	
	public BookedRoom() {
		super();
	}

	public BookedRoom(int bookedNo, int bookedRoomNo, long bookedResvNo, int bookedPeople, Date bookedCheckIn,
			Date bookedCheckOut, int bookedPrice, int bookedBreakfast) {
		super();
		this.bookedNo = bookedNo;
		this.bookedRoomNo = bookedRoomNo;
		this.bookedResvNo = bookedResvNo;
		this.bookedPeople = bookedPeople;
		this.bookedCheckIn = bookedCheckIn;
		this.bookedCheckOut = bookedCheckOut;
		this.bookedPrice = bookedPrice;
		this.bookedBreakfast = bookedBreakfast;
	}

	public int getBookedBreakfast() {
		return bookedBreakfast;
	}

	public void setBookedBreakfast(int bookedBreakfast) {
		this.bookedBreakfast = bookedBreakfast;
	}

	public int getBookedNo() {
		return bookedNo;
	}

	public void setBookedNo(int bookedNo) {
		this.bookedNo = bookedNo;
	}


	public int getBookedRoomNo() {
		return bookedRoomNo;
	}

	public void setBookedRoomNo(int bookedRoomNo) {
		this.bookedRoomNo = bookedRoomNo;
	}

	public long getBookedResvNo() {
		return bookedResvNo;
	}

	public void setBookedResvNo(long bookedResvNo) {
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
		return "BookedRoom [bookedNo=" + bookedNo + ", bookedRoomNo=" + bookedRoomNo + ", bookedResvNo="
				+ bookedResvNo + ", bookedPeople=" + bookedPeople + ", bookedCheckIn=" + bookedCheckIn
				+ ", bookedCheckOut=" + bookedCheckOut + ", bookedPrice=" + bookedPrice + "]";
	}
	
	
	


}
