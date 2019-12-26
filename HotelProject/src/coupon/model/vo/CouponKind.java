package coupon.model.vo;

import java.io.Serializable;

public class CouponKind implements Serializable{

	private static final long serialVersionUID = 1L;

	private String couponCode;
	private String couponContent;
	private int couponSalePercent;
	private int couponMinimum;
	private int couponMaxsale;
	
	public CouponKind() {
		super();
	}

	public CouponKind(String couponCode, String couponContent, int couponSalePercent, int couponMinimum,
			int couponMaxsale) {
		super();
		this.couponCode = couponCode;
		this.couponContent = couponContent;
		this.couponSalePercent = couponSalePercent;
		this.couponMinimum = couponMinimum;
		this.couponMaxsale = couponMaxsale;
	}

	public String getCouponCode() {
		return couponCode;
	}

	public void setCouponCode(String couponCode) {
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

	public int getCouponMaxsale() {
		return couponMaxsale;
	}

	public void setCouponMaxsale(int couponMaxsale) {
		this.couponMaxsale = couponMaxsale;
	}

	@Override
	public String toString() {
		return "CouponKind [couponCode=" + couponCode + ", couponContent=" + couponContent + ", couponSalePercent="
				+ couponSalePercent + ", couponMinimum=" + couponMinimum + ", couponMaxsale=" + couponMaxsale + "]";
	}
	
	
}
