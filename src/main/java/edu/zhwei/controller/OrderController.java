package edu.zhwei.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.zhwei.component.JedisClient;

@Controller
public class OrderController {

	@Autowired
	private JedisClient jedisClient;
	
	//这里只是对请求进行控制，前10名才可以去下单页面
	//其他的用户直接去了结束页面
	@RequestMapping("/createOrder")
	public String toOrderPage(Integer id){
		boolean canOrder = jedisClient.canOrder(id);
		if(canOrder){
			return "order";
		}else {
			return "ended";
		}
	}
}
