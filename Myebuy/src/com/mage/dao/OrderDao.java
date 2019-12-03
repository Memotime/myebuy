package com.mage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mage.po.Order;
import com.mage.po.ShoppingCarProduct;
import com.mage.util.DBUtil;

public class OrderDao {

	public long addOrder(Order order) {
		Connection conn = null;
		PreparedStatement sta = null;
		long row = 0;
		try {
			//获取连接
			conn = DBUtil.getConnection();
			//编写sql
			String sql = "insert into t_order (cost,createTime,orderNo,status,userId) values (?,now(),?,?,?)";
			//预编译
			sta = conn.prepareStatement(sql);
			//设置参数
			sta.setInt(1, order.getCost());
			sta.setString(2, order.getOrderNo());
			sta.setInt(3, order.getStatus());
			sta.setInt(4, order.getUserId());
			//执行查询
			row = sta.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(null, sta, conn);
		}
		return row;
	}

	public int findOrderIdByOrderNo(String orderNo) {
		Connection conn = null;
		PreparedStatement sta = null;
		ResultSet res = null;
		int orderId = 0;
		
		try {
			//获取连接
			conn = DBUtil.getConnection();
			//编写sql
			String sql = "SELECT id FROM t_order WHERE orderNo = ?";
			//预编译
			sta = conn.prepareStatement(sql);
			//设置参数
			sta.setString(1, orderNo);
			//执行查询
			res = sta.executeQuery();
			//分析结果集
			while(res.next()) {
				orderId = res.getInt(1);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(res, sta, conn);
		}
		return orderId;
	}

	public List<Order> findOrderListByUserId(int userId) {
		Connection conn = null;
		PreparedStatement sta = null;
		ResultSet res = null;
		List<Order> orderList = new ArrayList<Order>();
		try {
			//获取连接
			conn = DBUtil.getConnection();
			//编写sql
			String sql = "SELECT * FROM t_order WHERE userId = ? order by id desc";
			//预编译
			sta = conn.prepareStatement(sql);
			//设置参数
			sta.setInt(1, userId);
			//执行查询
			res = sta.executeQuery();
			//分析结果集
			while(res.next()) {
				Order order = new Order();
				order.setId(res.getInt(1));
				order.setCost(res.getInt(2));
				order.setCreateTime(res.getTimestamp(3));
				order.setOrderNo(res.getString(4));
				order.setStatus(res.getInt(5));
				order.setUserId(userId);
				orderList.add(order);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(res, sta, conn);
		}
		return orderList;	
		
	}

}
