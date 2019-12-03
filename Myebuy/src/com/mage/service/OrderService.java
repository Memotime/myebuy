package com.mage.service;

import java.util.ArrayList;
import java.util.List;

import com.mage.dao.OrderDao;
import com.mage.po.Order;
import com.mage.po.OrderProduct;
import com.mage.po.Product;
import com.mage.po.ShoppingCarProduct;
import com.mage.po.User;
import com.mage.util.DateUtil;
import com.mage.util.StringUtil;

public class OrderService {
	OrderDao orderDao = new OrderDao();

	/**
	 * 增加订单
	 * @param order
	 * @return
	 */
	public int subOarder(Order order) {
		long row = orderDao.addOrder(order);
		//判断是否增加成功
		if(row==0) {
			return 0;
		}else {
			return orderDao.findOrderIdByOrderNo(order.getOrderNo());
		}
	}

	/**
	 * 
	 * 根据用户id查找订单集合
	 * @param id
	 * @return
	 */
	public List<Order> findOrderList(int userId) {
		return orderDao.findOrderListByUserId(userId);
	}

	public int addOrderByProduct(String productId, User user) {
	
		// 非空
		if(StringUtil.isEmpty(productId)||user==null) {
			return 0;
		}
		//获取product对象
		Product product = new ProductService().lookpro(productId);
		
		//包装Order对象
		Order order = new Order();
		order.setCost(product.getPrice());
		order.setOrderNo(DateUtil.getCurrentDateStr());
		order.setStatus(1);
		order.setUserId(user.getId());
		
		//增加订单
		long row = orderDao.addOrder(order);
		//获取订单id
		int orderId = orderDao.findOrderIdByOrderNo(order.getOrderNo());
		
		//包装OrderProduct对象
		OrderProduct orderProduct = new OrderProduct();
		List<OrderProduct> orderProductList = new ArrayList<OrderProduct>();
		orderProduct.setOrderId(orderId);
		orderProduct.setProductId(Integer.parseInt(productId));
		orderProduct.setNum(1);
		orderProductList.add(orderProduct);
		
		//调用OrderProductService
		OrderProductService orderProductService = new OrderProductService();
		long row1 = orderProductService.addOrderProduct(orderProductList);
		if(row==0||row1==0) {
			//受影响行数为0 返回0
			return 0;
		}else {
			//成功 返回 1
			return 1;
		}
		
		
	}

}
