package com.mage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mage.po.Order;
import com.mage.po.OrderProduct;
import com.mage.util.DBUtil;

public class OrderProductDao {

	public long addOrderProduct(List<OrderProduct> orderProductList) {
		Connection conn = null;
		PreparedStatement sta = null;
		long row = 0;
		try {
			//获取连接
			conn = DBUtil.getConnection();
			//编写sql
			String sql = "insert into t_order_product (num,orderId,productId) values (?,?,?)";
			//设置事务为手动提交
			conn.setAutoCommit(false);
			for (OrderProduct orderProduct : orderProductList) {
				//预编译
				sta = conn.prepareStatement(sql);
				//设置参数
				sta.setInt(1, orderProduct.getNum());
				sta.setInt(2, orderProduct.getOrderId());
				sta.setInt(3, orderProduct.getProductId());
				//执行查询
				row = sta.executeUpdate();
				if(row==0) {
					//回滚
					conn.rollback();
					return 0;
				}
			}
			
			//提交事务
			conn.commit();
		}catch (Exception e) {
			try {
				//回滚
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			DBUtil.close(null, sta, conn);
		}
		return row;
	}

	public List<OrderProduct> findOrderProductList(Integer id) {
		Connection conn = null;
		PreparedStatement sta = null;
		ResultSet res = null;
		List<OrderProduct> orderList = new ArrayList<OrderProduct>();
		try {
			//获取连接
			conn = DBUtil.getConnection();
			//编写sql
			String sql = "SELECT op.id,op.num,op.orderId,op.productId,p.name,p.proPic,p.price "
					+ "FROM t_order_product op "
					+ "INNER JOIN t_product p ON op.productId = p.id  "
					+ "WHERE orderId = ?" ;
			
			//预编译
			sta = conn.prepareStatement(sql);
			//设置参数
			sta.setInt(1, id);
			//执行查询
			res = sta.executeQuery();
			//分析结果集
			while(res.next()) {
				OrderProduct orderProduct = new OrderProduct();
				orderProduct.setId(res.getInt(1));
				orderProduct.setNum(res.getInt(2));
				orderProduct.setOrderId(id);
				orderProduct.setProductId(res.getInt(4));
				orderProduct.setProName(res.getString(5));
				orderProduct.setProPic(res.getString(6));
				orderProduct.setPrice(res.getInt(7));
				orderList.add(orderProduct);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(res, sta, conn);
		}
		return orderList;
		
	}

}
