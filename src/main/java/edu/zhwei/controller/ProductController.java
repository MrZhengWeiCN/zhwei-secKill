package edu.zhwei.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.zhwei.pojo.Product;
import edu.zhwei.service.ProductService;


@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping("/doAddProduct")
	public String addProduct(Product product){
		System.out.println(product.getNum());
		productService.addProduct(product);
		return "addSuccess";
	}
	
	@RequestMapping("/showProduct")
	@ResponseBody
	public String showProduct(){
		List<Product> findProducts = productService.findProducts();
		System.out.println(findProducts.get(0).getKilldate().toLocaleString());
		return "查询成功";
	}
}
