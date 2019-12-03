package com.mage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mage.po.ShoppingCarProduct;
import com.mage.util.DBUtil;

public class ShoppingCarDao {

	
	
	/**
	 * 
	 * 根据用户id查询购物车的中的产品
	 * @param userId
	 * @return
	 */
	public List<ShoppingCarProduct> findShoppingListByUid(Integer userId){
		List<ShoppingCarProduct> list = new ArrayList<ShoppingCarProduct>();
		Connection conn = null;
		PreparedStatement sta = null;
		ResultSet res = null;
		
		try {
			//获取连接
			conn = DBUtil.getConnection();
			//编写sql
			String sql = "SELECT sc.id, p.id as pid, p.name, proPic, price, num "
					+ "FROM t_shoppingcar sc "
					+ "INNER JOIN t_product p ON sc.productId = p.id "
					+ "WHERE userId = ?";
			//预编译
			sta = conn.prepareStatement(sql);
			//设置参数
			sta.setInt(1, userId);
			//执行查询
			res = sta.executeQuery();
			//分析结果集
			while(res.next()) {
				ShoppingCarProduct pro = new ShoppingCarProduct();
				pro.setId(res.getInt(1));
				pro.setProductId(res.getInt(2));
				pro.setProName(res.getString(3));
				pro.setProPic(res.getString(4));
				pro.setPrice(res.getInt(5));
				pro.setNum(res.getInt(6));
				list.add(pro);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(res, sta, conn);
		}
		
		return list;
	}


	/**
	 * 减数量
	 * @param productId
	 * @return
	 */
	public int minNum(String productId) {
		Connection conn = null;
		PreparedStatement sta = null;
		long row = 0;
		try {
			//获取连接
			conn = DBUtil.getConnection();
			//编写sql
			String sql = "update t_shoppingCar set num = num-1 where id = ?";
			//预编译
			sta = conn.prepareStatement(sql);
			//设置参数
			sta.setInt(1, Integer.parseInt(productId));
			//执行查询
			row = sta.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(null, sta, conn);
		}
		return (int)row;
	}

	/**
	 * 加数量
	 * @param productId
	 * @return
	 */
	public int addNum(String productId) {
		Connection conn = null;
		PreparedStatement sta = null;
		long row = 0;
		try {
			//获取连接
			conn = DBUtil.getConnection();
			//编写sql
			String sql = "update t_shoppingCar set num = num+1 where id = ?";
			//预编译
			sta = conn.prepareStatement(sql);
			//设置参数
			sta.setInt(1, Integer.parseInt(productId));
			//执行查询
			row = sta.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(null, sta, conn);
		}
		return (int)row;
	}


	public int removeProduct(String productId) {
		Connection conn = null;
		PreparedStatement sta = null;
		long row = 0;
		try {
			//获取连接
			conn = DBUtil.getConnection();
			//编写sql
			String sql = "delete from t_shoppingCar where id = ?";
			//预编译
			sta = conn.prepareStatement(sql);
			//设置参数
			sta.setInt(1, Integer.parseInt(productId));
			//执行查询
			row = sta.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(null, sta, conn);
		}
		return (int)row;
	}


	/**
	 * 根据用户id删除他购物车中的商品
	 * @param id
	 * @return
	 */
	public int removeProductAll(int id) {
		Connection conn = null;
		PreparedStatement sta = null;
		long row = 0;
		try {
			//获取连接
			conn = DBUtil.getConnection();
			//编写sql
			String sql = "delete from t_shoppingCar where userId = ?";
			//预编译
			sta = conn.prepareStatement(sql);
			//设置参数
			sta.setInt(1, id);
			//执行查询
			row = sta.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(null, sta, conn);
		}
		return (int)row;
	}


	public int addShopping(String productId,int userId) {
		Connection conn = null;
		PreparedStatement sta = null;
		long row = 0;
		try {
			//获取连接
			conn = DBUtil.getConnection();
			//编写sql
			String sql = "insert into t_shoppingCar (userId,num,productId) values (?,?,?)";
			//预编译
			sta = conn.prepareStatement(sql);
			//设置参数
			sta.setInt(1, userId);
			sta.setInt(2, 1);
			sta.setString(3, productId);
			//执行查询
			row = sta.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(null, sta, conn);
		}
		return (int)row;
	}


}
