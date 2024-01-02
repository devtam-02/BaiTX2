package com.devtam.DevShop.Process;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.devtam.DevShop.Entity.Product;

public interface OrderItemProcess {
	public ArrayList<Product> getListProductByOrderId(int order);
}
