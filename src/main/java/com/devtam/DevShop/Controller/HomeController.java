package com.devtam.DevShop.Controller;

import com.devtam.DevShop.Connection.ConnectionPool;
import com.devtam.DevShop.Connection.ConnectionPoolImpl;
import com.devtam.DevShop.Entity.User;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
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
import java.util.List;

@Controller
public class HomeController{
	
	private ConnectionPool connectionPool;
	private Connection con;
	
    @GetMapping(value = {"/" ,"/home"})
    public String check(HttpSession session)  {
        List<User> users = new ArrayList<>();

        session.setAttribute("users", users);
        return "index";
    }
    @GetMapping(value = "/model")
    public String checkModel(Model model) {
        List<User> users = new ArrayList<>();

        model.addAttribute("users", users);
        return "indexMol";
    }

    @RequestMapping(value = "/modelView")
    public ModelAndView checkModelView() {
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("indexMolV");
        return modelAndView;
    }
    @RequestMapping(value ="/submit", method = RequestMethod.POST)
    public void submit(@RequestParam String name, @RequestParam String phone) {
      System.out.println("Tên: " + name);
      System.out.println("Tuổi: " + phone);
//      return "index";
    }
    @RequestMapping(value = "/testDb")
    public ModelAndView testDb() {
        ModelAndView modelAndView = new ModelAndView();
        
        connectionPool = new ConnectionPoolImpl();
        try {
			this.con = connectionPool.getConnection("test");
			if(this.con.getAutoCommit()) {
				//Hủy chế độ thực thi tự động
				this.con.setAutoCommit(false);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
        
        if (this.con != null) {
        	modelAndView.addObject("info", "Connect successfully");
        }
        else modelAndView.addObject("info", "Connect unsuccessfully");
        
        modelAndView.setViewName("indexMolV");
        return modelAndView;
    }
}
