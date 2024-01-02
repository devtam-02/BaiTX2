package com.devtam.DevShop.Process;

import java.util.ArrayList;

import com.devtam.DevShop.DTO.UserDTO;

public interface UserProcess {
	public int countTotalUser();
	public ArrayList<UserDTO> getListUserForDashboard();
}
