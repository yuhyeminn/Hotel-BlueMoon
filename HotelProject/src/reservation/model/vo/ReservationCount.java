package reservation.model.vo;

import java.io.Serializable;

public class ReservationCount implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private int day;
	private int resvCount;
	private int resvPrice;
	
	
	public ReservationCount() {
		super();
	}
	
	public ReservationCount(int day, int resvCount, int resvPrice) {
		super();
		this.day = day;
		this.resvCount = resvCount;
		this.resvPrice = resvPrice;
	}

	public int getResvPrice() {
		return resvPrice;
	}

	public void setResvPrice(int resvPrice) {
		this.resvPrice = resvPrice;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public int getResvCount() {
		return resvCount;
	}

	public void setResvCount(int resvCount) {
		this.resvCount = resvCount;
	}

	@Override
	public String toString() {
		return "ReservationCount [day=" + day + ", resvCount=" + resvCount + ", resvPrice=" + resvPrice + "]";
	}

}