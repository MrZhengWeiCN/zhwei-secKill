package mq;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import edu.zhwei.mq.SendMessage;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations={"classpath:spring/applicationContext-*.xml"})  
public class TestMQ {

	@Autowired
	private SendMessage sendMessage;
	
	@Test
	public void testSend(){
		sendMessage.send("iphonex");
		System.out.println("模拟发出了减少iphonex库存的命令");
	}
}
