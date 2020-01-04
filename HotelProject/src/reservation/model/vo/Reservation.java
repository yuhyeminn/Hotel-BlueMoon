package reservation.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Reservation implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private long resvNo;
	private String resvMemberId;
	private int resvPeople;
	private int resvUsedPoint;
	private int resvAddPoint;
	private Date resvDate;
	private int resvPrice;
	private String resvCancel;
	private Date resvIn;
	private Date resvOut;
	private int resvBfPeople;
	
	public Reservation() {
		super();
	}

	public Reservation(long resvNo, String resvMemberId, int resvPeople, int resvUsedPoint, int resvAddPoint,
			Date resvDate, int resvPrice, String resvCancel, Date resvIn, Date resvOut, int resvBfPeople) {
		super();
		this.resvNo = resvNo;
		this.resvMemberId = resvMemberId;
		this.resvPeople = resvPeople;
		this.resvUsedPoint = resvUsedPoint;
		this.resvAddPoint = resvAddPoint;
		this.resvDate = resvDate;
		this.resvPrice = resvPrice;
		this.resvCancel = resvCancel;
		this.resvIn = resvIn;
		this.resvOut = resvOut;
		this.resvBfPeople = resvBfPeople;
	}

	public long getResvNo() {
		return resvNo;
	}

	public void setResvNo(long resvNo) {
		this.resvNo = resvNo;
	}

	public String getResvMemberId() {
		return resvMemberId;
	}

	public void setResvMemberId(String resvMemberId) {
		this.resvMemberId = resvMemberId;
	}

	public int getResvPeople() {
		return resvPeople;
	}

	public void setResvPeople(int resvPeople) {
		this.resvPeople = resvPeople;
	}

	public int getResvUsedPoint() {
		return resvUsedPoint;
	}

	public void setResvUsedPoint(int resvUsedPoint) {
		this.resvUsedPoint = resvUsedPoint;
	}

	public int getResvAddPoint() {
		return resvAddPoint;
	}

	public void setResvAddPoint(int resvAddPoint) {
		this.resvAddPoint = resvAddPoint;
	}

	public Date getResvDate() {
		return resvDate;
	}

	public void setResvDate(Date resvDate) {
		this.resvDate = resvDate;
	}

	public int getResvPrice() {
		return resvPrice;
	}

	public void setResvPrice(int resvPrice) {
		this.resvPrice = resvPrice;
	}

	public String isResvCancel() {
		return resvCancel;
	}

	public void setResvCancel(String resvCancel) {
		this.resvCancel = resvCancel;
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

	public int getResvBfPeople() {
		return resvBfPeople;
	}

	public void setResvBfPeople(int resvBfPeople) {
		this.resvBfPeople = resvBfPeople;
	}

	@Override
	public String toString() {
		return "RoomReservation [resvNo=" + resvNo + ", resvMemberId=" + resvMemberId + ", resvPeople=" + resvPeople
				+ ", resvUsedPoint=" + resvUsedPoint + ", resvAddPoint=" + resvAddPoint + ", resvDate=" + resvDate
				+ ", resvPrice=" + resvPrice + ", resvCancel=" + resvCancel + ", resvIn=" + resvIn + ", resvOut="
				+ resvOut + ", resvBfPeople=" + resvBfPeople + "]";
	}
	
	

}
