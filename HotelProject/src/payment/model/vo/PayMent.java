package payment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class PayMent implements Serializable{

	private static final long serialVersionUID = 1L;

	private int resvNo;
	private String payMemberId;
	private Date payDate;
	private String payMethod;
	
	public PayMent() {
		super();
	}

	public PayMent(int resvNo, String payMemberId, Date payDate, String payMethod) {
		super();
		this.resvNo = resvNo;
		this.payMemberId = payMemberId;
		this.payDate = payDate;
		this.payMethod = payMethod;
	}

	public int getResvNo() {
		return resvNo;
	}

	public void setResvNo(int resvNo) {
		this.resvNo = resvNo;
	}

	public String getPayMemberId() {
		return payMemberId;
	}

	public void setPayMemberId(String payMemberId) {
		this.payMemberId = payMemberId;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	@Override
	public String toString() {
		return "PayMent [resvNo=" + resvNo + ", payMemberId=" + payMemberId + ", payDate=" + payDate + ", payMethod="
				+ payMethod + "]";
	}
	
	
}
