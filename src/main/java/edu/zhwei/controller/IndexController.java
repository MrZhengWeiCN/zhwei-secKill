package edu.zhwei.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.zhwei.pojo.Product;
import edu.zhwei.service.ProductService;

@Controller
public class IndexController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping("/index")
	public String showIndex(Model model){
		List<Product> products = productService.findProducts();
		List<Product> subList = products.subList(0, 3);
		model.addAttribute("products1", subList.get(0));
		model.addAttribute("products2", subList.get(1));
		model.addAttribute("products3", subList.get(2));
		return "index";
	}
	
	@RequestMapping("/addProduct")
	public String addPage(){
		return "add";
	}
}
