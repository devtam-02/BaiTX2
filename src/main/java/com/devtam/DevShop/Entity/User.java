package com.devtam.DevShop.Entity;

public class User {
	private String id;
	private String login_Type;
	private String role;
	private String password;
	private String user_Name;
	private String avatar;
	private String email;
	private String phone_Number;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLogin_Type() {
		return login_Type;
	}
	public void setLogin_Type(String login_Type) {
		this.login_Type = login_Type;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUser_Name() {
		return user_Name;
	}
	public void setUser_Name(String user_Name) {
		this.user_Name = user_Name;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone_Number() {
		return phone_Number;
	}
	public void setPhone_Number(String phone_Number) {
		this.phone_Number = phone_Number;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", login_Type=" + login_Type + ", role=" + role + ", password=" + password
				+ ", user_Name=" + user_Name + ", avatar=" + avatar + ", email=" + email + ", phone_Number="
				+ phone_Number + "]";
	}
	
}
