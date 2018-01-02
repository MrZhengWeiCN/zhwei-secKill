package edu.zhwei.mq;

import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;
/**
 * 对seckillQueue的监听
 * @author Administrator
 *
 */
public class SeckillListener implements MessageListener{

	@Override
	public void onMessage(Message message) {
		String title = new String(message.getBody());
		System.out.println("模拟减少了商品"+title+"的一个库存");
	}

}
