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
	public int addProduct(Product item) {
		boolean success = false;
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO product(");
		sql.append("created_at, ");
		sql.append("description, is_active, is_selling, ");
		sql.append("price, product_name, quantity, ");
		sql.append("sold, category_id) ");
		sql.append("VALUES(?,?,?,?,?,?,?,?,?);");

		try {
			PreparedStatement pre = this.con.prepareStatement(sql.toString());
			
			pre.setString(1, item.getCreate_at());
			pre.setString(2, item.getDescription());
			pre.setInt(3, item.getIs_active());
			pre.setInt(4, item.getIs_selling());
			pre.setInt(5, item.getPrice());
			pre.setString(6, item.getProduct_name());
			pre.setInt(7, item.getQuantity());
			pre.setInt(8, item.getSold());
			pre.setInt(9, item.getCategory_id());
			//thực thi
			int result = pre.executeUpdate();
			if (result==0) {
				this.con.rollback();
				return -1;
			}
			
			//Ghi nhận thực thi sau cùng
			this.con.commit();
			return getLastId();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}
	private int getLastId() {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT LAST_INSERT_ID();");
		//Biên dịch		
				try {
					PreparedStatement pre = this.con.prepareStatement(sql.toString());
					//Truyền giá trị cho tham số
					ResultSet rs = pre.executeQuery(); //Lấy về tập kết quả
					if(rs != null) {
						while(rs.next()) {
							return rs.getInt(1);
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
				return -1;
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
