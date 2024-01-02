package com.devtam.DevShop.DTO;

public class OrderDTO {
	private int id;
	private String paymentMethod;
	private String Date;
	private int price;
	private String customerName;
	
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "OrderDTO [id=" + id + ", paymentMethod=" + paymentMethod + ", Date=" + Date + ", price=" + price
				+ ", customerName=" + customerName + "]";
	}
	
	
}
