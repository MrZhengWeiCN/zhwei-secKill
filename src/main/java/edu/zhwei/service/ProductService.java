package edu.zhwei.service;

import java.util.List;

import edu.zhwei.pojo.Product;

public interface ProductService {

	public void addProduct(Product product);
	
	List<Product> findProducts();
}
