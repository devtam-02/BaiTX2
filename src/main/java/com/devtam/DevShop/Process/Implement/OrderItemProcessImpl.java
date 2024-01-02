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
import com.devtam.DevShop.Entity.Product;
import com.devtam.DevShop.Process.OrderItemProcess;
import com.devtam.DevShop.Process.ProductProcess;
@Repository
public class OrderItemProcessImpl implements OrderItemProcess {
	@Autowired
	ProductProcess productProcess;
	
	//kết nối để làm việc với csdl
			private Connection con;
			
			//bộ quản lý kết nối riêng section
			private ConnectionPool cp;

			public OrderItemProcessImpl() {
				//Xác định bộ quản lý kết nối
				this.cp = new ConnectionPoolImpl();
				
				//Xin kết nối để làm việc
				try {
					this.con = this.cp.getConnection("Order item");
					
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
	public ArrayList<Product> getListProductByOrderId(int order) {
		ArrayList<Product> items = new ArrayList<Product>();
		String sql = "SELECT * FROM `order_item` WHERE order_id = ? ";
		//Biên dịch		
				try {
					PreparedStatement pre = this.con.prepareStatement(sql);
					//Truyền giá trị cho tham số				
					pre.setInt(1, order);
					ResultSet rs = pre.executeQuery(); //Lấy về tập kết quả
					if(rs != null) {
						while(rs.next()) {
							int productId = rs.getInt("product_id");
							Product item = productProcess.getProduct(productId);						
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
