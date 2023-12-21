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
    public String check(HttpSession session)  {
//    	this.productProcess = new ProductProcessImpl();
        List<Product> products = productProcess.getListProducts("", (byte)10);
        session.setAttribute("products", products);
        return "index";
    }
    @GetMapping("/shop")
    public String shopView(HttpSession session)  {
        List<Product> products = productProcess.getListProducts("", (byte)12);
        session.setAttribute("products", products);
        
        Map<?, ?> productImages = productImageProcess.getListImages();
        session.setAttribute("productImages", productImages);
        
        Map<Integer, String> categories = categoryProcess.getListCategory();
        session.setAttribute("categories", categories);
        
        return "shop";
    }
    
    @GetMapping("/details/{id}")
    public String detailsView(HttpSession session, @PathVariable("id") int id)  {
        Product product = productProcess.getProduct(id);
        List<ProductImage> images = productImageProcess.getListImagesById(id);
        session.setAttribute("product", product);
        session.setAttribute("images", images);
        return "details";
    }

    @RequestMapping(value ="/submit", method = RequestMethod.POST)
    public void submit(@RequestParam String name, @RequestParam String phone) {
      System.out.println("Tên: " + name);
      System.out.println("Tuổi: " + phone);
//      return "index";
    }
    
}
