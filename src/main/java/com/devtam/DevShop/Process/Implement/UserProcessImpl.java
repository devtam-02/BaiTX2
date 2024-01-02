package com.devtam.DevShop.Process.Implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devtam.DevShop.Connection.ConnectionPool;
import com.devtam.DevShop.Connection.ConnectionPoolImpl;
import com.devtam.DevShop.DTO.UserDTO;
import com.devtam.DevShop.Process.ProductProcess;
import com.devtam.DevShop.Process.UserProcess;

@Repository
public class UserProcessImpl implements UserProcess {

	//kết nối để làm việc với csdl
		private Connection con;
		
		//bộ quản lý kết nối riêng section
		private ConnectionPool cp;

		public UserProcessImpl() {
			//Xác định bộ quản lý kết nối
			this.cp = new ConnectionPoolImpl();
			
			//Xin kết nối để làm việc
			try {
				this.con = this.cp.getConnection("User");
				
				//Kiểm tra chế độ thực thi của kết nối
				if(this.con.getAutoCommit()) {
					//Hủy chế độ thực thi tự động
					this.con.setAutoCommit(false);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	@Override
	public int countTotalUser() {
		int sum = 0;
		
		String sql = "SELECT count(*) as total FROM `user`";
		//Biên dịch		
				try {
					PreparedStatement pre = this.con.prepareStatement(sql);
					//Truyền giá trị cho tham số				
					ResultSet rs = pre.executeQuery(); //Lấy về tập kết quả
					if(rs != null) {
						while(rs.next()) {
							int x = 0;
							x = rs.getInt("total");
							sum = x;
						}
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					
					//trở về trạng thái an toàn của kết nối
					try {
						this.con.rollback();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
		return sum;
	}
	public ArrayList<UserDTO> getListUserForDashboard() {
		ArrayList<UserDTO> items = new ArrayList<UserDTO>();
		String sql = "SELECT * FROM `user` WHERE role='user' ORDER BY id DESC LIMIT 5 ";
		//Biên dịch		
				try {
					PreparedStatement pre = this.con.prepareStatement(sql);
					//Truyền giá trị cho tham số				
					ResultSet rs = pre.executeQuery(); //Lấy về tập kết quả
					if(rs != null) {
						while(rs.next()) {
							UserDTO item = new UserDTO();
							item.setName(rs.getString("user_name"));
							item.setEmail(rs.getString("email"));
							item.setAvatar(rs.getString("avatar"));
							items.add(item);
						}
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					
					//trở về trạng thái an toàn của kết nối
					try {
						this.con.rollback();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
		return items;
	}

}
