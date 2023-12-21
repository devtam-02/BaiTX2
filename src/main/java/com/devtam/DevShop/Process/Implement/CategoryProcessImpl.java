package com.devtam.DevShop.Process.Implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.devtam.DevShop.Connection.ConnectionPool;
import com.devtam.DevShop.Connection.ConnectionPoolImpl;
import com.devtam.DevShop.Entity.ProductImage;
import com.devtam.DevShop.Process.CategoryProcess;
@Repository
public class CategoryProcessImpl implements CategoryProcess {
	//kết nối để làm việc với csdl
	private Connection con;
	
	//bộ quản lý kết nối riêng section
	private ConnectionPool cp;
	
	public CategoryProcessImpl() {
		//Xác định bộ quản lý kết nối
		this.cp = new ConnectionPoolImpl();
		
		//Xin kết nối để làm việc
		try {
			this.con = this.cp.getConnection("Category");
			
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
	public Map<Integer, String> getListCategory() {
		Map<Integer, String> items = new HashMap();
//		ProductImage item;
		String sql = "SELECT * FROM category ";
		
		//Biên dịch		
		try {
			PreparedStatement pre = this.con.prepareStatement(sql);
			//Truyền giá trị cho tham số
			ResultSet rs = pre.executeQuery(); //Lấy về tập kết quả
			if(rs != null) {
				while(rs.next()) {
					items.put(rs.getInt("id"), rs.getString("category_name"));	
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
