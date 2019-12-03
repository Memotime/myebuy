package com.mage.service;

import java.util.List;

import com.mage.dao.ShoppingCarDao;
import com.mage.po.ShoppingCarProduct;
import com.mage.po.User;
import com.mage.util.StringUtil;

public class ShoppingCarService {
	private ShoppingCarDao shoppingCarDao = new ShoppingCarDao();

	/**
	 * 根据用户id查询购物车的中的产品
	 * @param userId
	 */
	public List<ShoppingCarProduct> findShoppingListByUid(int userId) {
		return shoppingCarDao.findShoppingListByUid(userId);
	}

	/**
	 * 减数量
	 * @param productId
	 * @return
	 */
	public int minNum(String productId) {
		return shoppingCarDao.minNum(productId);
	}
	/**
	 * 加数量
	 * @param productId
	 * @return
	 */
	public int addNum(String productId) {
		if(StringUtil.isEmpty(productId)) {
			return 0;
		}else {
			return shoppingCarDao.addNum(productId);
		}
		
	}

	/**
	 * 移除商品
	 * @param productId
	 * @return
	 */
	public int removeProduct(String productId) {
		return shoppingCarDao.removeProduct(productId);
	}

	public int removeProductAll(int id) {
		return shoppingCarDao.removeProductAll(id);
	}

	public int addShopping(String productId,User user) {
		//非空判断
		if(StringUtil.isEmpty(productId)||user==null) {
			return 0;
		}else {
			return shoppingCarDao.addShopping(productId,user.getId());
		}
		
		
	}
	
	

}
