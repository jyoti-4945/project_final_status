package ProjectFrontend.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.CartItemDao;
import com.dao.CategoryDao;
import com.dao.ProductDao;

import com.models.Product;

@Controller
public class HomeController {

@Autowired
	ProductDao productdao;
@Autowired
CartItemDao cartitemdao;
		public HomeController() {
		System.out.println("homeController initialized");
	}
		
		@RequestMapping("/")
		public String home()
		{
			return "home";
		}
		@RequestMapping("/home")
		public String home1(HttpSession session)
		{
			session.setAttribute("categories",productdao.getAllCategories());
			return "home";
		}
		@RequestMapping("/admin_header")
		public String valid()
		{
			return "admin_header";
		}
		@RequestMapping("/AboutUs")
		public String aboutus()
		{
			return "AboutUs";
		}
		
		@RequestMapping("/login")
		public String login()
		{
			return "Login";
		}
		@RequestMapping("/loginerror")
		public String userlogin(Model model)
		{
			model.addAttribute("error","Invalid Credentials");
			return "Login";
		}
		@RequestMapping(value="/logout")
		public String logout(Model model)
		{
			model.addAttribute("msg","loggedout succesfully");
			return "Login";
			
		}
		@RequestMapping("/contactus")
		public String contactus()
		{
			return "contactus";
		}
		}
