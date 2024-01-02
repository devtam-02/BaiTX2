package com.devtam.DevShop.Process;
import java.util.ArrayList;

import com.devtam.DevShop.Entity.Product;


public interface ProductProcess {
	public ArrayList<Product> getListProducts(String similar, byte start, byte total);
	public ArrayList<Product> getListProductsBestSeller(String similar, byte start, byte total);
	public ArrayList<Product> getListProductsByCategory(int category, String similar, byte start, byte total);
	public Product getProduct(int id);
	public int addProduct(Product item);
	public int countProduct(int catId);
}
