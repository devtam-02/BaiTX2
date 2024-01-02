package com.devtam.DevShop.Controller;

import com.devtam.DevShop.Connection.ConnectionPool;
import com.devtam.DevShop.Connection.ConnectionPoolImpl;
import com.devtam.DevShop.Entity.Product;
import com.devtam.DevShop.Entity.ProductImage;
import com.devtam.DevShop.Process.CategoryProcess;
import com.devtam.DevShop.Process.ProductImageProcess;
import com.devtam.DevShop.Process.ProductProcess;
import com.devtam.DevShop.Process.Implement.ProductProcessImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
public class HomeController{
	
	private ConnectionPool connectionPool;
	private Connection con;
	@Autowired
	private ProductProcess productProcess;
	
	@Autowired
	private ProductImageProcess productImageProcess;
	
	@Autowired
	private CategoryProcess categoryProcess;
	
	
    @GetMapping(value = {"/" ,"/home"})
    public String check(HttpSession session, Model model)  {
        List<Product> products = productProcess.getListProducts("", (byte) 0, (byte)12);
        model.addAttribute("products", products);

        List<Product> bestSeller = productProcess.getListProductsBestSeller("", (byte) 0, (byte)12);
        model.addAttribute("best-sellers", bestSeller);
        
        Map<?, ?> productImages = productImageProcess.getListImages();
        model.addAttribute("productImages", productImages);
        
        return "index";
    }
    @GetMapping("/shop")
    public String shopView(HttpSession session, Model model)  {
    	int page = 0;
    	int productsPerPage = 12;
    	if(session.getAttribute("Spage") == null || (int)session.getAttribute("Spage") < 0)
    		session.setAttribute("Spage", page);
    	else {
    		page = (int) session.getAttribute("Spage");
    	}
    	
    	int category = 0;
    	if(session.getAttribute("Scategory") != null) {
    		category = (int) session.getAttribute("Scategory");
    	}
    	
    	int maxCount = productProcess.countProduct(category);
    	session.setAttribute("SmaxPage", (maxCount / productsPerPage) + 1);

        List<Product> products = productProcess.getListProductsByCategory(category, "",(byte) 
        		(0 + page * productsPerPage), (byte)productsPerPage);
        model.addAttribute("products", products);
        
        Map<?, ?> productImages = productImageProcess.getListImages();
        model.addAttribute("productImages", productImages);
        
        Map<Integer, String> categories = categoryProcess.getListCategory();
        model.addAttribute("categories", categories);
        
        session.setAttribute("current-category", category);
        session.setAttribute("current-page", page);
        session.setAttribute("Scategory", 0);
        session.setAttribute("Spage", 0);

        return "shop";
    }
    @GetMapping("/shop/{catId}/{pageNum}")
    public String shopViewPage(HttpSession session, 
    		@PathVariable("catId") int id, 
    		@PathVariable("pageNum") int num)  
    {
    	session.setAttribute("Scategory", id);
    	session.setAttribute("Spage", num);
        return "redirect:/shop";
    }
    @GetMapping("/direct-shop")
    public String shopViewCate(HttpSession session, @PathVariable("catId") int id)  {
    	session.setAttribute("Scategory", 0);
    	session.setAttribute("Spage", 0);
        return "redirect:/shop";
    }
    
    @GetMapping("/details/{id}")
    public String detailsView(HttpSession session, @PathVariable("id") int id)  {
        Product product = productProcess.getProduct(id);
        List<ProductImage> images = productImageProcess.getListImagesById(id);
        session.setAttribute("product", product);
        session.setAttribute("images", images);
        return "details";
    }
    @GetMapping("/blog")
    public String blogView(HttpSession session, Model model)  {
    	return "blog";
    }
    @GetMapping("/contact")
    public String contact(HttpSession session, Model model)  {
    	return "contact";
    }
    @RequestMapping(value ="/submit", method = RequestMethod.POST)
    public void submit(@RequestParam String name, @RequestParam String phone) {
      System.out.println("Tên: " + name);
      System.out.println("Tuổi: " + phone);
//      return "index";
    }
    
}
