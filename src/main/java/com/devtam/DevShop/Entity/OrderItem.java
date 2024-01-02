package com.devtam.DevShop.Entity;

public class OrderItem {
	private int id;
	private int count;
	private int orderId;
	private String userId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "OrderItem [id=" + id + ", count=" + count + ", orderId=" + orderId + ", userId=" + userId + "]";
	}
	
	
}
