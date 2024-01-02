package com.devtam.DevShop.DTO;

public class UserDTO {
	private String name;
	private String email;
	private String avatar;
	
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "UserDTO [name=" + name + ", email=" + email + ", avatar=" + avatar + "]";
	}
	
	
}
