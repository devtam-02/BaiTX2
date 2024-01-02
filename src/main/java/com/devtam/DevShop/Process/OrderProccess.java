package com.devtam.DevShop.Process;

import java.util.ArrayList;

import com.devtam.DevShop.DTO.OrderDTO;

public interface OrderProccess {
	public ArrayList<Integer> sumSoldLastWeek(int productId);
	public ArrayList<Integer> countSoldLastWeek(int productId);
	public ArrayList<OrderDTO> getListOrderDto();
	public int countTotal();
}
