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
import org.springframework.web.bind.annotation.ResponseBody;
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

			int added = productProcess.addProduct(newPro);
			if (added != -1) {
				System.out.println("last added id:" + added);
				boolean success = productImageProcess.addImages(added, listImage);
				String str = success ? "Thanh cong" : "Khong thanh cong";
			}
			else System.out.println("cannot added product");
    	}
    	
        return "redirect:/admin/dashboard-addproduct";
    }
    

    @GetMapping("/dashboard-myproduct")
    public String dashboardMyproduct(HttpSession session, Model model){
    	session.setAttribute("type", "list");
    	if(session.getAttribute("page") == null)
    		session.setAttribute("page", 0);
    	model.addAttribute("page", 0);
    	int maxCount = productProcess.countProduct();
    	session.setAttribute("maxPage", (maxCount / 10) + 1);
    	
    	Map<Integer, String> categories = categoryProcess.getListCategory();
    	model.addAttribute("categories", categories);
    	
    	List<Product> products = productProcess
    			.getListProductsByCategory(0, "", (byte)0, (byte)10);
    	model.addAttribute("products", products);
        
        HashMap<Integer, String> images = new HashMap<>();
    	for(Product p : products) {
    		String str = productImageProcess.getImageByProductId(p.getId());
    		images.put(p.getId(),str);
    	}
    	model.addAttribute("images", images);
        
    	return "admin/dashboard_myproduct";
    }
    @GetMapping("/dashboard-myproduct/{page}")
    public String dashboardMyproductPag(HttpSession session,@PathVariable("page") int page, Model model){
    	page -= 1;
    	session.setAttribute("type", "list");    	
    	model.addAttribute("page", page);
    	
    	Map<Integer, String> categories = categoryProcess.getListCategory();
    	model.addAttribute("categories", categories);
    	
    	List<Product> products = productProcess
    			.getListProductsByCategory(0, "", (byte)(0 + page * 10), (byte)10);
    	model.addAttribute("products", products);
        
        HashMap<Integer, String> images = new HashMap<>();
    	for(Product p : products) {
    		String str = productImageProcess.getImageByProductId(p.getId());
    		images.put(p.getId(),str);
    	}
    	model.addAttribute("images", images);
        
    	return "admin/dashboard_myproduct";
    }
    
    @PostMapping("/dashboard-myproduct/search")
    public String dashboardMyproductSearch(HttpSession session, @ModelAttribute(value = "search-input") String search_input,
			@ModelAttribute("category-selected") int category_selected, Model model){
    	session.setAttribute("search-input", search_input);
    	session.setAttribute("category-selected", category_selected);
    	
    	Map<Integer, String> categories = categoryProcess.getListCategory();
    	model.addAttribute("categories", categories);
    	
    	List<Product> products = productProcess
    			.getListProductsByCategory(category_selected, search_input, (byte)0, (byte)10);
    	model.addAttribute("products", products);
        
    	HashMap<Integer, String> images = new HashMap<>();
    	for(Product p : products) {
    		String str = productImageProcess.getImageByProductId(p.getId());
    		images.put(p.getId(),str);
    	}
    	model.addAttribute("images", images);
    	session.setAttribute("type", "search");
    	model.addAttribute("page", 0);
    	return "admin/dashboard_myproduct";
    }
    @GetMapping("/dashboard-myproduct/search/{page}")
    public String dashboardMyproductPagSearch(HttpSession session,@PathVariable("page") int page, Model model){
    	page -= 1;
    	int category_selected = (int) session.getAttribute("category-selected");
    	String search_input = (String) session.getAttribute("search-input");
    	
    	session.setAttribute("type", "search");    	
    	model.addAttribute("page", page);
    	
    	Map<Integer, String> categories = categoryProcess.getListCategory();
    	model.addAttribute("categories", categories);
    	
    	List<Product> products = productProcess
    			.getListProductsByCategory(category_selected, search_input, (byte)(0 + page * 10), (byte)10);
    	model.addAttribute("products", products);
        
        HashMap<Integer, String> images = new HashMap<>();
    	for(Product p : products) {
    		String str = productImageProcess.getImageByProductId(p.getId());
    		images.put(p.getId(),str);
    	}
    	model.addAttribute("images", images);
        
    	return "admin/dashboard_myproduct";
    }
    @GetMapping("admin/dashboard-myproducts/analysis/{id}")
    public String analysis(@PathVariable("id") int id) {
    	
    	return "dashboard_analysis";
    }
    
    @GetMapping("/test")
    @ResponseBody
    public String test(){
    	String str = true ? "Thanh cong" : "Khong thanh cong";
		System.out.println(str);
		return str;
    }
    
}
