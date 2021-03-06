package member.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class Member implements Serializable, HttpSessionBindingListener{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	private String memberId;
	private String password;
	private String memberName;
	private String birth;
	private String email;
	private String phone;
	private int point;
	private Date enrollDate;

	public Member() {
		super();
	}
	
	

	public Member(String memberId, String password, String memberName, String birth, String email,
			String phone, int point, Date enrollDate) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.memberName = memberName;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.point = point;
		this.enrollDate = enrollDate;
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", password=" + password + ", memberName=" + memberName + ", birth="
				+ birth + ", email=" + email + ", phone=" + phone + ", point=" + point + ", enrollDate=" + enrollDate
				+ "]";
	}

	/**
	 * 세션속성으로 해당객체가 등록될때 호출됨
	 */
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		System.out.println("["+memberId+"]님이 ["+new java.util.Date()+"]에 로그인하셨습니다.");
	}
	
	/**
	 * 세션속성에 등록된 해당객체가 해제될때 호출됨.
	 */
	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		System.out.println("["+memberId+"]님이 ["+new java.util.Date()+"]에 로그아웃하셨습니다.");
		
	}
	
}
