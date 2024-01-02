package com.devtam.DevShop.Entity;

import java.sql.Date;

public class Order {
	private int id;
	private int total;
	private String booking_Date;
	private String payment_Method;
	private String status;
	private String fullname;
	private String country;
	private String address;
	private String phone;
	private String email;
	private String note;
	private String userId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getBooking_Date() {
		return booking_Date;
	}
	public void setBooking_Date(String booking_Date) {
		this.booking_Date = booking_Date;
	}
	public String getPayment_Method() {
		return payment_Method;
	}
	public void setPayment_Method(String payment_Method) {
		this.payment_Method = payment_Method;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", total=" + total + ", booking_Date=" + booking_Date + ", payment_Method="
				+ payment_Method + ", status=" + status + ", fullname=" + fullname + ", country=" + country
				+ ", address=" + address + ", phone=" + phone + ", email=" + email + ", note=" + note + ", userId="
				+ userId + "]";
	}
	
	

}
