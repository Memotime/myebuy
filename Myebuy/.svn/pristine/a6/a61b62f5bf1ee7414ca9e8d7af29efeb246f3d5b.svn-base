package com.mage.service;

import java.util.List;

import com.mage.dao.OrderProductDao;
import com.mage.po.Order;
import com.mage.po.OrderProduct;

public class OrderProductService {
	
	private OrderProductDao orderProductDao = new OrderProductDao();

	public long addOrderProduct(List<OrderProduct> orderProductList) {
		
		return orderProductDao.addOrderProduct(orderProductList);
	}

	public List<OrderProduct> findOrderProductList(Order order) {
		
		
		return orderProductDao.findOrderProductList(order.getId());
	}

}
