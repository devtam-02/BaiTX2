package com.devtam.DevShop.Controller.Admin;

import java.sql.Connection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devtam.DevShop.Connection.ConnectionPool;
import com.devtam.DevShop.Process.CategoryProcess;
import com.devtam.DevShop.Process.InteractProcesss;
import com.devtam.DevShop.Process.OrderProccess;
import com.devtam.DevShop.Process.ProductImageProcess;
import com.devtam.DevShop.Process.ProductProcess;

@Controller
@RequestMapping("/admin")
public class AdminProductController {
	private ConnectionPool connectionPool;
	private Connection con;
	@Autowired
	private ProductProcess productProcess;
	
	@Autowired
	private ProductImageProcess productImageProcess;
	
	@Autowired
	private CategoryProcess categoryProcess;

	@Autowired
	private InteractProcesss interactProcesss;
	
	@Autowired
	private OrderProccess orderProccess;
	
	@GetMapping("/delete/product/{id}")
	private String deleteProduct(HttpSession session,@PathVariable("id") int id) {
		System.out.println("delete id " + id);
		session.setAttribute("isDelete", 1);
		return "redirect:/admin/dashboard-myproduct";
	}
}
