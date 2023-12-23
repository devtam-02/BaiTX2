package com.devtam.DevShop.Process;

import java.util.Map;

import com.devtam.DevShop.Entity.Category;

public interface CategoryProcess {
	public Map<Integer, String> getListCategory();
	public Category getCategoryById(int id);
}
