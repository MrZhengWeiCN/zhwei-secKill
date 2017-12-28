package edu.zhwei.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.zhwei.component.JedisClient;
import edu.zhwei.pojo.Order;
import edu.zhwei.pojo.Product;
import edu.zhwei.service.OrderService;
import edu.zhwei.service.ProductService;

@Controller
public class OrderController {

	@Autowired
	private JedisClient jedisClient;
	@Autowired
	private ProductService productService;
	@Autowired
	private OrderService orderService;

	// 这里只是对请求进行控制，前10名才可以去下单页面
	// 其他的用户直接去了结束页面
	@RequestMapping("/createOrder")
	public String toOrderPage(Integer id, Model model) {
		boolean canOrder = jedisClient.canOrder(id);
		if (canOrder) {
			Product product = productService.findProduct(id);
			model.addAttribute("product", product);
			return "order";
		} else {
			return "ended";
		}
	}

	@RequestMapping("/doCreateOrder")
	public String doCreateOrder(Order order,
			@RequestParam("productId") Integer id, Model model) {
		Order createOrder = orderService.createOrder(order, id);
		Product product = productService.findProduct(id);
		if (createOrder.getCreatetime() == null) {
			// 表示下单失败
			return "order-fail";
		} else {
			model.addAttribute("order", createOrder);
			model.addAttribute("product", product);
			return "order-success";
		}
	}
}
