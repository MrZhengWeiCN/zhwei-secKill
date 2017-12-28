package edu.zhwei.service;

import edu.zhwei.pojo.Order;

public interface OrderService {

	Order createOrder(Order order,Integer productId);
}
