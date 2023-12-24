package com.devtam.DevShop.Process.Implement;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Locale;

import org.springframework.stereotype.Repository;

import com.devtam.DevShop.Connection.ConnectionPool;
import com.devtam.DevShop.Connection.ConnectionPoolImpl;
import com.devtam.DevShop.Entity.Product;
import com.devtam.DevShop.Process.InteractProcesss;
@Repository
public class InteractProcesssImpl implements InteractProcesss {

	//kết nối để làm việc với csdl
			private Connection con;
			
			//bộ quản lý kết nối riêng section
			private ConnectionPool cp;
			
			public InteractProcesssImpl() {
				//Xác định bộ quản lý kết nối
				this.cp = new ConnectionPoolImpl();
				
				//Xin kết nối để làm việc
				try {
					this.con = this.cp.getConnection("Interact");
					
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
	public ArrayList<Integer> getViewedById(int id) {
		LocalDate loc = LocalDate.now();		
		ArrayList<Integer> sum = new ArrayList<Integer>();
		
		String sql = "SELECT sum(count) as 'sum' FROM tbl_viewed ";
		sql += "WHERE product_id = ? and viewed_date = ? ";
		for(int i = 0; i < 7; i++) {
			loc = loc.minusDays(1);
		//Biên dịch		
				try {
					PreparedStatement pre = this.con.prepareStatement(sql);
					//Truyền giá trị cho tham số
					pre.setByte(1, (byte) id);
					pre.setDate(2, Date.valueOf(loc));
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
	public ArrayList<Integer> getBoughtById(int id) {
		LocalDate loc = LocalDate.now();		
		ArrayList<Integer> sum = new ArrayList<Integer>();
		
		String sql = "SELECT sum(count) as 'sum' FROM tbl_bought ";
		sql += "WHERE product_id = ? and bought_date = ? ";
		for(int i = 0; i < 7; i++) {
			loc = loc.minusDays(1);
		//Biên dịch		
				try {
					PreparedStatement pre = this.con.prepareStatement(sql);
					//Truyền giá trị cho tham số
					pre.setByte(1, (byte) id);
					pre.setDate(2, Date.valueOf(loc));
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

}
