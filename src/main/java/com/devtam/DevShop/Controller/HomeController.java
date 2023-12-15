package com.devtam.DevShop.Controller;

import com.devtam.DevShop.Entity.User;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController{

    @GetMapping(value = {"/" ,"/home"})
    public String check(HttpSession session)  {
        List<User> users = new ArrayList<>();
        users.add(new User(1,"hadwaf"));
        users.add(new User(2,"gdhehy"));
        users.add(new User(6,"sfnhsnjtfrdfg"));
        users.add(new User(4,"ljkdfgdzgfhsdfsdf"));
        users.add(new User(3,"ghygmjrdsff"));
        session.setAttribute("users", users);
        return "index";
    }
    @RequestMapping(path = "/model")
    public String checkModel(Model model) {
        List<User> users = new ArrayList<>();
        users.add(new User(1,"hadwaf"));
        users.add(new User(2,"gdhehy"));
        users.add(new User(6,"sfnhsnjtfrdfg"));
        users.add(new User(4,"ljkdfgdzgfhsdfsdf"));
        users.add(new User(3,"ghygmjrdsff"));
        model.addAttribute("users", users);
        return "indexMol";
    }

    @RequestMapping(value = "/modelView")
    public ModelAndView checkModelView() {
        ModelAndView modelAndView = new ModelAndView();
        List<User> users = new ArrayList<>();
        users.add(new User(1,"hadwaf"));
        users.add(new User(2,"gdhehy"));
        users.add(new User(6,"sfnhsnjtfrdfg"));
        users.add(new User(4,"ljkdfgdzgfhsdfsdf"));
        users.add(new User(3,"ghygmjrdsff"));
        modelAndView.addObject("users", users);
        modelAndView.setViewName("indexMolV");
        return modelAndView;
    }
}
