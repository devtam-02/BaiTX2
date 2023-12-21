package com.devtam.DevShop.Entity;

public class ProductImage {
	private int id; 
	private String url_image;
	private int product_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUrl_image() {
		return url_image;
	}
	public void setUrl_image(String url_image) {
		this.url_image = url_image;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	@Override
	public String toString() {
		return "ProductImage [id=" + id + ", url_image=" + url_image + ", product_id=" + product_id + "]";
	}
	
	
}
