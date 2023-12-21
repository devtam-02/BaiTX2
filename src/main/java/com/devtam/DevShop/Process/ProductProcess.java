package com.devtam.DevShop.Process;
import java.util.ArrayList;

import com.devtam.DevShop.Entity.Product;


public interface ProductProcess {
	public ArrayList<Product> getListProducts(String similar, byte total);
	public Product getProduct(int id);
	public boolean addProduct(Product item);
}
