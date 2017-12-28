package edu.zhwei.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.zhwei.mapper.ProductMapper;
import edu.zhwei.pojo.Product;
import edu.zhwei.pojo.ProductExample;
import edu.zhwei.pojo.ProductExample.Criteria;
import edu.zhwei.service.ProductService;
import edu.zhwei.utils.DateUtils;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;

	@Override
	public void addProduct(Product product) {
		productMapper.insertSelective(product);
	}

	@Override
	public List<Product> findProducts() {
		ProductExample example = new ProductExample();
		Criteria criteria = example.createCriteria();
		//找出今天要秒杀的商品
		criteria.andKilldateBetween(DateUtils.getTimesmorning(),
				DateUtils.getTimesnight());
		List<Product> list = productMapper.selectByExample(example);
		return list;
	}

	//根据Id查询商品
	@Override
	public Product findProduct(Integer id) {
		Product product = productMapper.selectByPrimaryKey(id);
		return product;
	}
}
