package edu.zhwei.component;

public interface JedisClient {

	boolean canOrder(Integer id);
	String get(String key);
	String set(String key,String value);
	String incr(String key);
	void expire(String key,Integer seconds);
}
