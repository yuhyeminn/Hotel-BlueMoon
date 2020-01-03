package admin.model.vo;

import java.util.Date;

public class AdminReservation {

	private long no;
	private String rsvMember;
	private int usedPnt;
	private int addPnt;
	private int people;
	private Date chkIn;
	private Date chkOut;
	private int price;
	private Date enrollDate;
	private char cancel;
	private int breakfast;
	
	public AdminReservation() {
		
	}

	public AdminReservation(long no, String rsvMember, int usedPnt, int addPnt, int people, Date chkIn, Date chkOut,
			int price, Date enrollDate, char cancel, int breakfast) {
		super();
		this.no = no;
		this.rsvMember = rsvMember;
		this.usedPnt = usedPnt;
		this.addPnt = addPnt;
		this.people = people;
		this.chkIn = chkIn;
		this.chkOut = chkOut;
		this.price = price;
		this.enrollDate = enrollDate;
		this.cancel = cancel;
		this.breakfast = breakfast;
	}

	public long getNo() {
		return no;
	}

	public void setNo(long no) {
		this.no = no;
	}

	public String getRsvMember() {
		return rsvMember;
	}

	public void setRsvMember(String rsvMember) {
		this.rsvMember = rsvMember;
	}

	public int getUsedPnt() {
		return usedPnt;
	}

	public void setUsedPnt(int usedPnt) {
		this.usedPnt = usedPnt;
	}

	public int getAddPnt() {
		return addPnt;
	}

	public void setAddPnt(int addPnt) {
		this.addPnt = addPnt;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public char getCancel() {
		return cancel;
	}

	public void setCancel(char cancel) {
		this.cancel = cancel;
	}

	public int getBreakfast() {
		return breakfast;
	}

	public void setBreakfast(int breakfast) {
		this.breakfast = breakfast;
	}

	@Override
	public String toString() {
		return "AdminReservation [no=" + no + ", rsvMember=" + rsvMember + ", usedPnt=" + usedPnt + ", addPnt=" + addPnt
				+ ", people=" + people + ", chkIn=" + chkIn + ", chkOut=" + chkOut + ", price=" + price
				+ ", enrollDate=" + enrollDate + ", cancel=" + cancel + ", breakfast=" + breakfast + "]";
	}

	

	
}
