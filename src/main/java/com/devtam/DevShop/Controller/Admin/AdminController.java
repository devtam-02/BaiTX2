package com.devtam.DevShop.Controller.Admin;

import com.devtam.DevShop.Connection.ConnectionPool;
import com.devtam.DevShop.Connection.ConnectionPoolImpl;
import com.devtam.DevShop.Entity.Category;
import com.devtam.DevShop.Entity.Product;
import com.devtam.DevShop.Entity.ProductImage;
import com.devtam.DevShop.Process.CategoryProcess;
import com.devtam.DevShop.Process.ProductImageProcess;
import com.devtam.DevShop.Process.ProductProcess;
import com.devtam.DevShop.Process.Implement.CloudinaryProcess;
import com.devtam.DevShop.Process.Implement.ProductProcessImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/admin")

public class AdminController{
	
	private ConnectionPool connectionPool;
	private Connection con;
	@Autowired
	private ProductProcess productProcess;
	
	@Autowired
	private ProductImageProcess productImageProcess;
	
	@Autowired
	private CategoryProcess categoryProcess;
	
	@Autowired
	private CloudinaryProcess cloudinaryProcess;
	
    @GetMapping(value = {"/dashboard-addproduct"})
    public String addProduct(HttpSession session)  {
    	Map<Integer, String> categories = categoryProcess.getListCategory();
        session.setAttribute("categories", categories);
        return "admin/dashboard_addproduct";
    }
    
    @PostMapping(value = {"/dashboard-addproduct"})
    public String addProductHandler(HttpServletRequest request, 
    		@RequestParam(value = "product_name", required = false) String product_name,
    		@RequestParam(value = "price", required = false) int price, 
    		@RequestParam(value = "availability", required = false) int availability,
    		@RequestParam(value = "category", required = false) int category, 
    		@RequestParam(value = "description", required = false) String description,
    		@RequestParam(value = "listImage", required = false) MultipartFile[] listImage)  {
    	
    	if (listImage != null) {
			Category cate = categoryProcess.getCategoryById(category);
			System.out.println(cate);
			long millis = System.currentTimeMillis();
			Date create_at = new java.sql.Date(millis);
			Product newPro = new Product();
			newPro.setCreate_at(create_at.toString());
			newPro.setDescription(description);
			newPro.setIs_active(1);
			newPro.setIs_selling(1);
			newPro.setPrice(price);
			newPro.setProduct_name(product_name);
			newPro.setQuantity(availability);
			newPro.setSold(0);
			newPro.setCategory_id(category);
			System.out.println(newPro);
			int added = productProcess.addProduct(newPro);
			if (added != -1) {
				System.out.println("added product with id:" + added);
			}
			else System.out.println("cannot added product");
//			for (MultipartFile y : listImage) {
//				String urlImg = cloudinaryProcess.upload(y);
//				System.out.println(urlImg);
//				ProductImage img = new ProductImage();
//				img.setProduct_id(1);
//				img.setUrl_image(urlImg));
//				productImageProcess.save(img);
//			}
    	}
    	
//    	System.out.println(product_name);
//    	System.out.println(price);
//    	System.out.println(availability);
//    	System.out.println(category);
//    	System.out.println(description);
//    	System.out.println(listImage);
    	
        return "redirect:/admin/dashboard-addproduct";
    }
    @PostMapping
    public ResponseEntity<Map> uploadImage(@RequestParam("image")MultipartFile file){
		return null;
//        Map data = this.cloudinaryService.upload(file);
//        return new ResponseEntity<>(data, HttpStatus.OK);
    }
    
}
