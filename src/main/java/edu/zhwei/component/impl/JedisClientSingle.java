package edu.zhwei.component.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import edu.zhwei.component.JedisClient;

@Service
public class JedisClientSingle implements JedisClient {

	private static boolean canOrder = true;

	@Autowired
	private JedisPool jedisPool;

	/* @Value("${productKey}") */
	private String productKey = "productKey";
	/* @Value("${canOrder}") */
	private static final Integer MAXORDER = 10;

	@Override
	public boolean canOrder(Integer id) {
		// canOrder作为标志符，使得不需要每次都去Redis中查询是否能下单
		// 减少Redis的压力

		if (canOrder) {
			// 虽然canOrder为true，但是高并发下还需要去Redis中查询
			Integer num = Integer.valueOf(incr(productKey + ":" + id));
			if (num > MAXORDER) {
				canOrder = false;
				return false;
			} else {
				return canOrder;
			}
		} else {
			return false;
		}

	}

	@Override
	public String get(String key) {
		String num = null;
		try {
			Jedis jedis = jedisPool.getResource();
			num = jedis.get(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}

	@Override
	public String set(String key, String value) {
		String set = null;
		try {
			Jedis jedis = jedisPool.getResource();
			set = jedis.set(key, value);
		} catch (Exception e) {
			// TODO: handle exception
		} 
		return set;
	}

	@Override
	public String incr(String key) {
		Jedis jedis = jedisPool.getResource();
		String incr = String.valueOf(jedis.incr(key));
		

		return incr;
	}

	public void expire(String key, Integer seconds) {
		Jedis jedis = jedisPool.getResource();
		jedis.expire(key, seconds);
	}
}
