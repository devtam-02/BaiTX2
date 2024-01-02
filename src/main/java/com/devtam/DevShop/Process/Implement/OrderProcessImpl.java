package com.devtam.DevShop.Process.Implement;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.devtam.DevShop.Connection.ConnectionPool;
import com.devtam.DevShop.Connection.ConnectionPoolImpl;
import com.devtam.DevShop.DTO.OrderDTO;
import com.devtam.DevShop.DTO.UserDTO;
import com.devtam.DevShop.Process.OrderProccess;
@Repository
public class OrderProcessImpl implements OrderProccess {
	//kết nối để làm việc với csdl
			private Connection con;
			
			//bộ quản lý kết nối riêng section
			private ConnectionPool cp;
			
			public OrderProcessImpl() {
				//Xác định bộ quản lý kết nối
				this.cp = new ConnectionPoolImpl();
				
				//Xin kết nối để làm việc
				try {
					this.con = this.cp.getConnection("Order");
					
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
	public ArrayList<Integer> sumSoldLastWeek(int productId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Integer> countSoldLastWeek(int productId) {
		LocalDate loc = LocalDate.now();		
		ArrayList<Integer> sum = new ArrayList<Integer>();
		
		String sql = "SELECT sum(`order_item`.count) as 'sum' ";
		sql += "FROM `order_item` JOIN `order` ON `order`.id = `order_item`.order_id ";
		sql += "WHERE `order`.booking_date = ? and `order_item`.product_id = ? ";
		for(int i = 0; i < 7; i++) {
			loc = loc.minusDays(1);
		//Biên dịch		
				try {
					PreparedStatement pre = this.con.prepareStatement(sql);
					//Truyền giá trị cho tham số
					pre.setDate(1, Date.valueOf(loc));
					pre.setByte(2, (byte) productId);					
					ResultSet rs = pre.executeQuery(); //Lấy về tập kết quả
					if(rs != null) {
						while(rs.next()) {
							int x = 0;
							x = rs.getInt("sum");
							sum.add(Integer.valueOf(x));
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
				
		}
		return sum;
	}

	@Override
	public int countTotal() {		
		int sum = 0;
		
		String sql = "SELECT count(*) as total FROM `order`";
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

	@Override
	public ArrayList<OrderDTO> getListOrderDto() {
		ArrayList<OrderDTO> items = new ArrayList<OrderDTO>();
		String sql = "SELECT * FROM `order` ORDER BY booking_date DESC LIMIT 5 ";
		//Biên dịch		
				try {
					PreparedStatement pre = this.con.prepareStatement(sql);
					//Truyền giá trị cho tham số				
					ResultSet rs = pre.executeQuery(); //Lấy về tập kết quả
					if(rs != null) {
						while(rs.next()) {
							OrderDTO item = new OrderDTO();
							item.setId(rs.getInt("id"));
							item.setPaymentMethod(rs.getString("payment_method"));
							item.setDate(rs.getString("booking_date"));
							item.setPrice(rs.getInt("total"));
							item.setCustomerName(rs.getString("fullname"));
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
