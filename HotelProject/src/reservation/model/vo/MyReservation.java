package reservation.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MyReservation implements Serializable{

	private static final long serialVersionUID = 1L;

	private int bookedNo;
	private long resvNo;
	private String roomName;
	private Date chkIn;
	private Date chkOut;
	private int resvPeople;
	private int resvBfPeople;
	private char resvCancel;
	
	public MyReservation() {

	}

	public MyReservation(int bookedNo, long resvNo, String roomName, Date chkIn, Date chkOut, int resvPeople, int resvBfPeople,
			char resvCancel) {
		super();
		
		this.bookedNo = bookedNo;
		this.resvNo = resvNo;
		this.roomName = roomName;
		this.chkIn = chkIn;
		this.chkOut = chkOut;
		this.resvPeople = resvPeople;
		this.resvBfPeople = resvBfPeople;
		this.resvCancel = resvCancel;
	}

	
	public int getBookedNo() {
		return bookedNo;
	}

	public void setBookedNo(int bookedNo) {
		this.bookedNo = bookedNo;
	}

	public long getResvNo() {
		return resvNo;
	}

	public void setResvNo(long resvNo) {
		this.resvNo = resvNo;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public Date getChkIn() {
		return chkIn;
	}

	public void setChkIn(Date chkIn) {
		this.chkIn = chkIn;
	}

	public Date getChkOut() {
		return chkOut;
	}

	public void setChkOut(Date chkOut) {
		this.chkOut = chkOut;
	}

	public int getResvPeople() {
		return resvPeople;
	}

	public void setResvPeople(int resvPeople) {
		this.resvPeople = resvPeople;
	}

	public int getResvBfPeople() {
		return resvBfPeople;
	}

	public void setResvBfPeople(int resvBfPeople) {
		this.resvBfPeople = resvBfPeople;
	}

	public char getResvCancel() {
		return resvCancel;
	}

	public void setResvCancel(char resvCancel) {
		this.resvCancel = resvCancel;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "MyReservation [bookedNo=" + bookedNo + ", resvNo=" + resvNo + ", roomName=" + roomName + ", chkIn="
				+ chkIn + ", chkOut=" + chkOut + ", resvPeople=" + resvPeople + ", resvBfPeople=" + resvBfPeople
				+ ", resvCancel=" + resvCancel + "]";
	}

	
}
