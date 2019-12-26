package coupon.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Coupon implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String couponNo;
	private String couponCode;
	private String couponMemberId;
	private Date couponStartDate;
	private Date couponEndDate;
	private boolean couponUsed;
	
	public Coupon() {
		super();
	}

	public Coupon(String couponNo, String couponCode, String couponMemberId, Date couponStartDate, Date couponEndDate,
			boolean couponUsed) {
		super();
		this.couponNo = couponNo;
		this.couponCode = couponCode;
		this.couponMemberId = couponMemberId;
		this.couponStartDate = couponStartDate;
		this.couponEndDate = couponEndDate;
		this.couponUsed = couponUsed;
	}

	public String getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(String couponNo) {
		this.couponNo = couponNo;
	}

	public String getCouponCode() {
		return couponCode;
	}

	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}

	public String getCouponMemberId() {
		return couponMemberId;
	}

	public void setCouponMemberId(String couponMemberId) {
		this.couponMemberId = couponMemberId;
	}

	public Date getCouponStartDate() {
		return couponStartDate;
	}

	public void setCouponStartDate(Date couponStartDate) {
		this.couponStartDate = couponStartDate;
	}

	public Date getCouponEndDate() {
		return couponEndDate;
	}

	public void setCouponEndDate(Date couponEndDate) {
		this.couponEndDate = couponEndDate;
	}

	public boolean isCouponUsed() {
		return couponUsed;
	}

	public void setCouponUsed(boolean couponUsed) {
		this.couponUsed = couponUsed;
	}

	@Override
	public String toString() {
		return "Coupon [couponNo=" + couponNo + ", couponCode=" + couponCode + ", couponMemberId=" + couponMemberId
				+ ", couponStartDate=" + couponStartDate + ", couponEndDate=" + couponEndDate + ", couponUsed="
				+ couponUsed + "]";
	}
	
	
}
