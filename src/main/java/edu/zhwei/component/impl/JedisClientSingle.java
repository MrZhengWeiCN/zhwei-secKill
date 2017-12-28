package edu.zhwei.component.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import edu.zhwei.component.JedisClient;

@Service
public class JedisClientSingle implements JedisClient {

	@Autowired
	private JedisPool jedisPool;

	@Value("${productKey}")
	private String productKey;
	@Value("${canOrder}")
	private Integer maxOrder;

	@Override
	public boolean canOrder(Integer id) {
		Jedis jedis = jedisPool.getResource();
		Integer num = Integer
				.valueOf(jedis.get(productKey + ":" + id) == null ? "0" : jedis
						.get(productKey + ":" + id));
		if (num == 0) {
			// 表示是第一个到达的人
			jedis.set(productKey + ":" + id, "1");
			return true;
		} else {
			if (num >= maxOrder)
				return false;
			else {
				jedis.set(productKey + ":" + id, (num++).toString());
				return true;
			}
		}
	}

}
