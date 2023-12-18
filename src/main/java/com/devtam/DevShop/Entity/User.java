package com.devtam.DevShop.Entity;

public class User {
    private int id;
    private String create_at;
    private String description;
    private int is_active;
    private int is_selling;
    private int price;
    private  String product_name;
    private int quantity;
    private int sold;
    private int category_id;

    public User(String create_at, String description, int is_active, int is_selling, int price, String product_name, int quantity, int sold, int category_id) {
        this.create_at = create_at;
        this.description = description;
        this.is_active = is_active;
        this.is_selling = is_selling;
        this.price = price;
        this.product_name = product_name;
        this.quantity = quantity;
        this.sold = sold;
        this.category_id = category_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCreate_at() {
        return create_at;
    }

    public void setCreate_at(String create_at) {
        this.create_at = create_at;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getIs_active() {
        return is_active;
    }

    public void setIs_active(int is_active) {
        this.is_active = is_active;
    }

    public int getIs_selling() {
        return is_selling;
    }

    public void setIs_selling(int is_selling) {
        this.is_selling = is_selling;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }
}
