package com.shopping.controllers;



import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.shopping.models.Admin;
import com.shopping.models.Product;
import com.shopping.service.AdminService;
import com.shopping.service.ProductService;

@Controller
//@SessionAttributes("productList")
public class HomeController {
	@Autowired
	private AdminService service;
	@Autowired
	private ProductService productService;
	
//	@ModelAttribute("productList")
//	public List<Product> buyerList(){
//		List<Product> buyerList=new ArrayList<Product>();
//		return productService.findProducts();
//	}
//	
	
	@GetMapping(value={"/","/home"})
	public String home( HttpSession session) {
		CopyOnWriteArrayList<Product> buyerList=new CopyOnWriteArrayList<Product>();
		session.setAttribute("productList",productService.findProducts());
		session.setAttribute("buyerList", buyerList);
		return "home";
	}
	
	
	@GetMapping("/adminLogin")
	public String adminLogin() {
		return "AdminLogin";
	}
	
	@GetMapping("/admin")
	public String admin(HttpSession session) {
		session.setAttribute("productList",productService.findProducts());
		return "AdminHome";
	}
	
	@PostMapping("/adminHome")
	public String adminHome(@RequestParam("username") String username,@RequestParam("password") String password, Model model,HttpSession session) {
		
		boolean res=service.validAdmin(username, password);
		System.out.println(res);
		if(res) {
			session.setAttribute("productList",productService.findProducts());
			session.setAttribute("username",username);
			session.setAttribute("password",password);
			
			return "AdminHome";
		}
		else 
		{
			model.addAttribute("message","Invalid Username and Password");
			return "AdminLogin";
		}
		
		
	}
	
	@GetMapping("/addProduct")
	public String addProducts(@ModelAttribute("product")Product product) {
		System.out.println(product);
		return "AddProduct";
		
	}
	
	
	
	
	@PostMapping("/insertProduct")
	public String insertProduct(@ModelAttribute("product")Product product , Model model,HttpSession session)
	{System.out.println(product);
	//List<Product> productList=(List<Product>) session.getAttribute("productList");
	
	if(productService.addProduct(product)) {
//		productList.add(product);
//		session.setAttribute("productList", productList);
		model.addAttribute("message", "Added Succesfully !!");}
	else {model.addAttribute("message", "Product not added");}
	return  "AddProduct";
	}
	
	@GetMapping("/updateProduct")
	public String updateProducts(@ModelAttribute("product") Product product) {
		
		return "updateProduct";
		
	}
	
	@PostMapping("/changeProduct")
	public String changeProduct(@ModelAttribute("product") Product product,Model model) {
		if(productService.updateProduct(product)) {
		model.addAttribute("message", "Updated Succesfully");}
		else {model.addAttribute("message", "Not Updated");}
		return "updateProduct";
	}
	
	
	@GetMapping("/addAdmin")
	public String addAdmin(@ModelAttribute("admin") Admin admin) {
		System.out.println(admin);
		return "AddAdmin";
		
	}
	

	
	
	@PostMapping("/insertAdmin")
	public String insertProduct(@ModelAttribute("admin") Admin admin , Model model)
	{System.out.println(admin);
	if(service.addAdmin(admin)) {model.addAttribute("message", "Added Succesfully !!");}
	else {model.addAttribute("message", "Admin not added");}
	return  "AddAdmin";
	}
	
	@GetMapping("/deleteProduct")
	public String deleteProduct() {
	
		return "deleteProduct";
		
	}
	
	
	
	@PostMapping("/removeProduct")
	public String removeProduct(@RequestParam("pId") int productId , Model model,HttpSession session)
	{System.out.println(productId);
	
//	List<Product> productList=(List<Product>) session.getAttribute("productList");
//	Product product =productService.find(productId);
//	System.out.println(product);
	if(productService.deleteProduct(productId)) {
//		productList.remove(product);
//		session.setAttribute("productList", productList);
		model.addAttribute("message", "Deleted Succesfully !!");}
	else {model.addAttribute("message", "Product not deleted");}
	return  "deleteProduct";
	}
	
	
	
	@GetMapping("/deleteAdmin")
	public String deleteAdmin() {
	
		return "deleteAdmin";
		
	}
	
	
	
	@PostMapping("/removeAdmin")
	public String removeAdmin(@RequestParam("username") String username , Model model)
	{System.out.println(username);
	if(service.deleteAdmin(username)) {model.addAttribute("message", "Deleted Succesfully !!");}
	else {model.addAttribute("message", "Admin not deleted");}
	return  "deleteAdmin";
	}
	
	
	
	@GetMapping("/buy")
	public String buy(@RequestParam("pId") int pId , HttpSession session) {
		List<Product> buyerList=(List<Product>) session.getAttribute("buyerList");
		Product p=productService.find(pId);
		buyerList.add(p);
		System.out.println(buyerList);
		session.setAttribute("buyerList",buyerList);
		return "home";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("pId") int pId , HttpSession session) {
		List<Product> buyerList=(List<Product>) session.getAttribute("buyerList");
		System.out.println(pId);
		//System.out.println(buyerList);
		//Product p=productService.find(pId);
		//buyerList.add(p);
		
		for(Product p:buyerList) {
			if(p.getProductId()==pId) {
				buyerList.remove(p);
				break;
			}
		}
		
		session.setAttribute("buyerList",buyerList);
		System.out.println(session.getAttribute("buyerList"));
		return "home";
	}
	@GetMapping("/generateBill")
	public String generateBill(HttpSession session) {
		if(session==null) {
			return "redirect:home";
		}
		else {
		List<Product> buyerList=(List<Product>) session.getAttribute("buyerList");
		double total=0;
		for(Product p:buyerList) {
			total+=p.getProductPrice();
		}
		session.setAttribute("total",total);
		return "bill";
		}
	}
	
}
