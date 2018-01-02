package edu.zhwei.mq;

import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class SendMessage {

	@Autowired
	private AmqpTemplate amqpTemplate;

	public void send(String message) {
		// 这里会按xml中配置的convert方式转换对象
		amqpTemplate
				.convertAndSend("seckillExchange", "seckillQueue", message);
	}
}
