package com.devtam.DevShop.Controller.Admin;

import com.devtam.DevShop.Connection.ConnectionPool;
import com.devtam.DevShop.Connection.ConnectionPoolImpl;
import com.devtam.DevShop.DTO.OrderDTO;
import com.devtam.DevShop.DTO.UserDTO;
import com.devtam.DevShop.Entity.Category;
import com.devtam.DevShop.Entity.Order;
import com.devtam.DevShop.Entity.Product;
import com.devtam.DevShop.Entity.ProductImage;
import com.devtam.DevShop.Entity.User;
import com.devtam.DevShop.Process.CategoryProcess;
import com.devtam.DevShop.Process.InteractProcesss;
import com.devtam.DevShop.Process.OrderItemProcess;
import com.devtam.DevShop.Process.OrderProccess;
import com.devtam.DevShop.Process.ProductImageProcess;
import com.devtam.DevShop.Process.ProductProcess;
import com.devtam.DevShop.Process.UserProcess;
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

	@Autowired
	private InteractProcesss interactProcesss;
	
	@Autowired
	private OrderProccess orderProccess;
	
	@Autowired
	private OrderItemProcess orderItemProcess;
	
	@Autowired
	private UserProcess userProcess;
	
	@GetMapping({"/dashboard"})
	public String dashboardHome(Model model)  {
    	int totalProduct = productProcess.countProduct(0);
    	model.addAttribute("totalProduct", totalProduct);
    	
    	int totalOrder = orderProccess.countTotal();
    	model.addAttribute("totalOrder", totalOrder);
    	
    	int totalUser = userProcess.countTotalUser();
    	model.addAttribute("totalUser", totalUser);
    	
    	int totalCategory = categoryProcess.countTotalCategory();
    	model.addAttribute("totalCategory", totalCategory);
    	
    	ArrayList<UserDTO> userDto = userProcess.getListUserForDashboard();
    	model.addAttribute("userDto",userDto);
    	
    	ArrayList<OrderDTO> orderDTO = orderProccess.getListOrderDto();
    	model.addAttribute("orderDTO",orderDTO);
    	
        return "admin/dashboard_home";
    }
	@GetMapping({"/home", "/"})
	public String directHome()  {
        return "redirect:/admin/dashboard";
    }
	@GetMapping("/dashboard/invoice/{id}")
	public String viewInvoice(@PathVariable("id") int id)  {
//		orderProccess;
        return "admin/invoice";
    }
			
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
    	int maxCount = productProcess.countProduct(0);
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
    
    @GetMapping("dashboard-orders")
    public String dashboardOrders(HttpSession session, Model model) {

    	int page = 0;
    	int ordersPerPage = 5;
    	if(session.getAttribute("Opage") == null || (int)session.getAttribute("Opage") < 0)
    		session.setAttribute("Opage", page);
    	else {
    		page = (int) session.getAttribute("Opage");
    	}
    	
    	int maxCount = orderProccess.countTotal();
    	session.setAttribute("OmaxPage", (maxCount / ordersPerPage) + 1);
    	
    	ArrayList<Order> listOrders = orderProccess.getListOrders((0 + page * ordersPerPage), ordersPerPage);
        model.addAttribute("listOrders", listOrders);
        for(Order o : listOrders) System.out.println("Orders:" + o);
        
        HashMap<String, User> listUsers = new HashMap<String, User>();
        for(Order item: listOrders) {
        	User user = userProcess.getUserById(item.getUserId());
        	if (user != null)
        		listUsers.put(item.getUserId(), user);
        	System.out.println("---key(" + item.getUserId() + "): " + user);
        }
        model.addAttribute("listUsers", listUsers);
        
        HashMap<Integer, ArrayList<Product>> listProducts = new HashMap<Integer, ArrayList<Product>>();
        for(Order item: listOrders) {
        	ArrayList<Product> products = orderItemProcess.getListProductByOrderId(item.getId());
        	if (products != null)
        		listProducts.put(item.getId(), products);
        	System.out.println("key(" + item.getId() + "): " + products.size());
        }
        model.addAttribute("listProducts", listProducts);
        
        
        
        session.setAttribute("current-page", page);
        session.setAttribute("Scategory", 0);
        session.setAttribute("Spage", 0);
    	return "admin/dashboard_orders";
    }
    @GetMapping("/dashboard-orders/{pageNum}")
    public String shopViewPage(HttpSession session,
    		@PathVariable("pageNum") int num)  
    {
    	session.setAttribute(")page", num);
        return "redirect:/dashboard-orders";
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
    @GetMapping("dashboard-myproduct/analysis/{id}")
    public String analysis(@PathVariable("id") int id, Model model) {
    	Product product = productProcess.getProduct(id);
    	List<ProductImage> images = productImageProcess.getListImagesById(id);
    	ArrayList<Integer> viewed = interactProcesss.getViewedById(id);
    	ArrayList<Integer> bought = orderProccess.countSoldLastWeek(id);
    	
    	model.addAttribute("product", product);
    	model.addAttribute("images", images);
    	model.addAttribute("viewed", viewed);
    	model.addAttribute("bought", bought);
    	return "admin/dashboard_analysis";
    }
    
    @GetMapping("/test")
    @ResponseBody
    public String test(){
    	ArrayList<Integer> viewed = interactProcesss.getViewedById(78);
    	ArrayList<Integer> bought = orderProccess.countSoldLastWeek(78);
    	if(viewed != null)
    		System.out.println(viewed);
    	if(bought != null)
    		System.out.println(bought);
    	String str = true ? "Thanh cong" : "Khong thanh cong";
		System.out.println(str);
		return str;
    }
    
}
