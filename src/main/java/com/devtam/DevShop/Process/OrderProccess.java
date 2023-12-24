package com.devtam.DevShop.Process;

import java.util.ArrayList;

public interface OrderProccess {
	public ArrayList<Integer> sumSoldLastWeek(int productId);
	public ArrayList<Integer> countSoldLastWeek(int productId);
}
