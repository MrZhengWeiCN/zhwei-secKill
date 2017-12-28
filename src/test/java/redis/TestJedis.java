package redis;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import edu.zhwei.component.JedisClient;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations={"classpath:spring/applicationContext-*.xml"})  
public class TestJedis {

	@Autowired
	private JedisClient jedisClient;
	
	@Test
	public void test(){
		String incr = jedisClient.incr("test-key2");
		System.out.println(incr);
	}
}
