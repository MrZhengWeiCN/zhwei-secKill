package edu.zhwei.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {

	//这里只是对请求进行控制，前10名才可以去下单页面
	//其他的用户直接去了结束页面
	@RequestMapping("/createOrder")
	public String toOrderPage(){
		
	}
}
