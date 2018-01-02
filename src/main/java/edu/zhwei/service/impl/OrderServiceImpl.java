package edu.zhwei.service.impl;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.zhwei.component.JedisClient;
import edu.zhwei.mapper.OrderMapper;
import edu.zhwei.mapper.ProductMapper;
import edu.zhwei.mq.SendMessage;
import edu.zhwei.pojo.Order;
import edu.zhwei.pojo.Product;
import edu.zhwei.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private JedisClient jedisClient;
	// rabbitmq客户端
	@Autowired
	private SendMessage sendMessage;

	@Override
	public Order createOrder(Order order, Integer productId) {

		Product product = productMapper.selectByPrimaryKey(productId);
		Integer num = product.getNum();
		/*
		 * String string = jedisClient.incr("Product-Order"+":"+productId);
		 * if(string==null){ //高并发这里存在问题 //多个线程如果同时执行就会出错
		 * jedisClient.set("Product-Order"+":"+productId, "0"); //60分钟过期
		 * jedisClient.expire("Product-Order"+":"+productId, 60*60); }
		 */
		// 这里是安全的
		Integer nowNum = Integer.valueOf(jedisClient.incr("Product-Order" + ":"
				+ productId));
		// 可以真正的购买商品
		if (nowNum <= num) {

			// 这里模拟库存的减少
			// 将减少库存的任务交给下单系统
			// 并且通过rabbitmq告知,使下单和创建订单分离，减少耦合，减少数据库压力
			sendMessage.send(product.getTitle());

			// 补全订单的剩余属性orderid，postFee，createtime，consigntime
			order.setPostFee(0);

			Date date = new Date();
			Timestamp timestamp = new Timestamp(date.getTime());
			order.setCreatetime(timestamp);

			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			calendar.add(Calendar.DATE, 3);
			Date time = calendar.getTime();
			order.setConsigntime(new Timestamp(time.getTime()));

			System.out.println("订单生成信息如下：");
			System.out.println("商品名称：" + product.getTitle());
			System.out.println("订单号：" + order.getOrderid());
			System.out.println("商品秒杀价格：" + product.getKillprice());
			System.out.println("送达时间：" + order.getConsigntime());

			// orderMapper.insert(order);
			// 模拟订单创建系统。

			sendMessage.send("订单已经下，收件人为" + order.getBuyerNick());

			return order;
		}

		return order;
	}

}
