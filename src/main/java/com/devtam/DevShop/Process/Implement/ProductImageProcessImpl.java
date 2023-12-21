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
import com.devtam.DevShop.Entity.Product;
import com.devtam.DevShop.Entity.ProductImage;
import com.devtam.DevShop.Process.ProductImageProcess;
@Repository
public class ProductImageProcessImpl implements ProductImageProcess {
	//kết nối để làm việc với csdl
			private Connection con;
			
			//bộ quản lý kết nối riêng section
			private ConnectionPool cp;
			
			public ProductImageProcessImpl() {
				//Xác định bộ quản lý kết nối
				this.cp = new ConnectionPoolImpl();
				
				//Xin kết nối để làm việc
				try {
					this.con = this.cp.getConnection("Product images");
					
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
	public Map<Integer, List<ProductImage>> getListImages() {
		Map<Integer, List<ProductImage>> items = new HashMap();
		ProductImage item;
		String sql = "SELECT * FROM product_image ";
		
		//Biên dịch		
		try {
			PreparedStatement pre = this.con.prepareStatement(sql);
			//Truyền giá trị cho tham số
			ResultSet rs = pre.executeQuery(); //Lấy về tập kết quả
			if(rs != null) {
				while(rs.next()) {
					item = new ProductImage();
					item.setId(rs.getInt("id"));
					item.setProduct_id(rs.getInt("product_id"));
					item.setUrl_image(rs.getString("url_image"));
					List<ProductImage> imgs = items.get(Integer.valueOf(item.getProduct_id()));
					if(imgs == null) {
						imgs = new ArrayList<ProductImage>();
//						System.out.println("---added new to " + item.getProduct_id());
						imgs.add(item);
						items.put(item.getProduct_id(), imgs);
					}
					else
					{
//						System.out.println("---added exist to " + item.getProduct_id() + "hehehe");
						imgs.add(item);
						items.replace(item.getProduct_id(), imgs);
					}
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
	public List<ProductImage> getListImagesById(int id) {
		List<ProductImage> items = new ArrayList<ProductImage>();
		ProductImage item;
		String sql = "SELECT * FROM product_image where product_id=?";
		//Biên dịch		
		try {
			PreparedStatement pre = this.con.prepareStatement(sql);
			//Truyền giá trị cho tham số
			pre.setInt(1, id);
			ResultSet rs = pre.executeQuery(); //Lấy về tập kết quả
			if(rs != null) {
				while(rs.next()) {
					item = new ProductImage();
					item.setId(rs.getInt("id"));
					item.setProduct_id(rs.getInt("product_id"));
					item.setUrl_image(rs.getString("url_image"));
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
