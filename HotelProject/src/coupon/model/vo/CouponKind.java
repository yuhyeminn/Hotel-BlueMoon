package coupon.model.vo;

import java.io.Serializable;

public class CouponKind implements Serializable{

	private static final long serialVersionUID = 1L;

	private int couponCode;
	private String couponContent;
	private int couponSalePercent;
	private int couponMinimum;
	
	public CouponKind() {
		super();
	}

	public CouponKind(int couponCode, String couponContent, int couponSalePercent, int couponMinimum) {
		this.couponCode = couponCode;
		this.couponContent = couponContent;
		this.couponSalePercent = couponSalePercent;
		this.couponMinimum = couponMinimum;
	}

	public int getCouponCode() {
		return couponCode;
	}

	public void setCouponCode(int couponCode) {
		this.couponCode = couponCode;
	}

	public String getCouponContent() {
		return couponContent;
	}

	public void setCouponContent(String couponContent) {
		this.couponContent = couponContent;
	}

	public int getCouponSalePercent() {
		return couponSalePercent;
	}

	public void setCouponSalePercent(int couponSalePercent) {
		this.couponSalePercent = couponSalePercent;
	}

	public int getCouponMinimum() {
		return couponMinimum;
	}

	public void setCouponMinimum(int couponMinimum) {
		this.couponMinimum = couponMinimum;
	}


	@Override
	public String toString() {
		return "CouponKind [couponCode=" + couponCode + ", couponContent=" + couponContent + ", couponSalePercent="
				+ couponSalePercent + ", couponMinimum=" + couponMinimum + "]";
	}
	
	
}
