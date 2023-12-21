package com.devtam.DevShop.Process.Implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.devtam.DevShop.Connection.ConnectionPool;
import com.devtam.DevShop.Connection.ConnectionPoolImpl;
import com.devtam.DevShop.Entity.Product;
import com.devtam.DevShop.Process.ProductProcess;
@Repository
public class ProductProcessImpl implements ProductProcess{
	//kết nối để làm việc với csdl
		private Connection con;
		
		//bộ quản lý kết nối riêng section
		private ConnectionPool cp;
		
		public ProductProcessImpl() {
			//Xác định bộ quản lý kết nối
			this.cp = new ConnectionPoolImpl();
			
			//Xin kết nối để làm việc
			try {
				this.con = this.cp.getConnection("Product");
				
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
	public ArrayList<Product> getListProducts(String similar, byte total) {
		ArrayList<Product> items = new ArrayList<>();
		Product item;
		String sql = "SELECT * FROM product ";
		sql += "WHERE product.is_active = 1 and product.is_selling = 1 ";
		sql += "ORDER BY created_at DESC ";
		sql += "LIMIT ?";
		
		//Biên dịch		
		try {
			PreparedStatement pre = this.con.prepareStatement(sql);
			//Truyền giá trị cho tham số
			pre.setByte(1, total);
			ResultSet rs = pre.executeQuery(); //Lấy về tập kết quả
			if(rs != null) {
				while(rs.next()) {
					item = new Product();
					item.setId(rs.getInt("id"));
					item.setCreate_at(rs.getString("created_at"));
					item.setDescription(rs.getString("description"));
					item.setIs_active(rs.getInt("is_active"));
					item.setIs_selling(rs.getInt("is_selling"));
					item.setPrice(rs.getInt("price"));
					item.setProduct_name(rs.getString("product_name"));
					item.setQuantity(rs.getInt("quantity"));
					item.setSold(rs.getInt("sold"));
					item.setCategory_id(rs.getInt("category_id"));
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

	@Override
	public boolean addProduct(Product item) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Product getProduct(int id) {
		Product item = new Product();
		String sql = "SELECT * FROM product ";
		sql += "WHERE product.id = ?";
		try {
			PreparedStatement pre = this.con.prepareStatement(sql);
			pre.setInt(1, id);
			ResultSet rs = pre.executeQuery();
			if(rs != null) {
				while(rs.next()) {
					item = new Product();
					item.setId(rs.getInt("id"));
					item.setCreate_at(rs.getString("created_at"));
					item.setDescription(rs.getString("description"));
					item.setIs_active(rs.getInt("is_active"));
					item.setIs_selling(rs.getInt("is_selling"));
					item.setPrice(rs.getInt("price"));
					item.setProduct_name(rs.getString("product_name"));
					item.setQuantity(rs.getInt("quantity"));
					item.setSold(rs.getInt("sold"));
					item.setCategory_id(rs.getInt("category_id"));
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return item;
	}

}
