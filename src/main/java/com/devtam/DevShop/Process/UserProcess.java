package com.devtam.DevShop.Process;

import java.util.ArrayList;

import com.devtam.DevShop.DTO.UserDTO;
import com.devtam.DevShop.Entity.User;

public interface UserProcess {
	public int countTotalUser();
	public ArrayList<UserDTO> getListUserForDashboard();
	public User getUserById(String userId);
}
