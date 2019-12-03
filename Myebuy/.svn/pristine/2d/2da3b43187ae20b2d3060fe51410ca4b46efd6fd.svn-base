package com.mage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mage.po.Comment;
import com.mage.po.Product;
import com.mage.util.DBUtil;

public class ProductDao {

	public List<Product> queryProduct(String typeid) {
		// 查询数据库
		Connection conn = null;
		PreparedStatement sta = null;
		ResultSet res = null;
		List<Product> productList = new ArrayList<>();
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from t_product where bigTypeId = ?";
			sta = conn.prepareStatement(sql);
			sta.setInt(1, Integer.parseInt(typeid));
			// 执行编译，获取结果集
			res = sta.executeQuery();
			while (res.next()) {
				Product pro = new Product();
				pro.setId(res.getInt("id"));
				pro.setName(res.getString("name"));
				pro.setDescription(res.getString("description"));
				pro.setHot(res.getInt("hot"));
				pro.setHotTime(res.getDate("hotTime"));
				pro.setPrice(res.getInt("price"));
				pro.setProPic(res.getString("proPic"));
				pro.setSpecialPrice(res.getInt("specialPrice"));
				pro.setSpecialPriceTime(res.getDate("specialPriceTime"));
				pro.setStock(res.getInt("stock"));
				pro.setBigTypeid(res.getInt("bigTypeId"));
				pro.setSmallTypeid(res.getInt("smallTypeId"));
				productList.add(pro);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productList;
	}

	public List<Product> querysmallType(String typeid) {
		// 查询数据库
		Connection conn = null;
		PreparedStatement sta = null;
		ResultSet res = null;
		List<Product> productList = new ArrayList<>();
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from t_product where smallTypeId = ?";
			sta = conn.prepareStatement(sql);
			sta.setInt(1, Integer.parseInt(typeid));
			// 执行编译，获取结果集
			res = sta.executeQuery();
			while (res.next()) {
				Product pro = new Product();
				pro.setId(res.getInt("id"));
				pro.setName(res.getString("name"));
				pro.setDescription(res.getString("description"));
				pro.setHot(res.getInt("hot"));
				pro.setHotTime(res.getDate("hotTime"));
				pro.setPrice(res.getInt("price"));
				pro.setProPic(res.getString("proPic"));
				pro.setSpecialPrice(res.getInt("specialPrice"));
				pro.setSpecialPriceTime(res.getDate("specialPriceTime"));
				pro.setStock(res.getInt("stock"));
				pro.setBigTypeid(res.getInt("bigTypeId"));
				pro.setSmallTypeid(res.getInt("smallTypeId"));
				productList.add(pro);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productList;
	}

	public Product querysproduct(String productid) {
		// 查询数据库
		Connection conn = null;
		PreparedStatement sta = null;
		ResultSet res = null;
		Product pro = null;
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from t_product where id = ?";
			sta = conn.prepareStatement(sql);
			sta.setInt(1, Integer.parseInt(productid));
			// 执行编译，获取结果集
			res = sta.executeQuery();
			while (res.next()) {
				pro = new Product();
				pro.setId(res.getInt("id"));
				pro.setName(res.getString("name"));
				pro.setDescription(res.getString("description"));
				pro.setHot(res.getInt("hot"));
				pro.setHotTime(res.getDate("hotTime"));
				pro.setPrice(res.getInt("price"));
				pro.setProPic(res.getString("proPic"));
				pro.setSpecialPrice(res.getInt("specialPrice"));
				pro.setSpecialPriceTime(res.getDate("specialPriceTime"));
				pro.setStock(res.getInt("stock"));
				pro.setBigTypeid(res.getInt("bigTypeId"));
				pro.setSmallTypeid(res.getInt("smallTypeId"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pro;
	}

	public List<Product> querybyname(String product) {
		Product pro = null;
		Connection conn = null;
		PreparedStatement sta = null;
		ResultSet res = null;
		List<Product> productList = new ArrayList<>();
		String sql ="select * from t_product where name like ?";
		try {
			conn = DBUtil.getConnection();
			sta = conn.prepareStatement(sql);
			sta.setString(1, "%"+product+"%");
			res = sta.executeQuery();
			while (res.next()) {
				pro = new Product();
				pro.setId(res.getInt("id"));
				pro.setName(res.getString("name"));
				pro.setDescription(res.getString("description"));
				pro.setHot(res.getInt("hot"));
				pro.setHotTime(res.getDate("hotTime"));
				pro.setPrice(res.getInt("price"));
				pro.setProPic(res.getString("proPic"));
				pro.setSpecialPrice(res.getInt("specialPrice"));
				pro.setSpecialPriceTime(res.getDate("specialPriceTime"));
				pro.setStock(res.getInt("stock"));
				pro.setBigTypeid(res.getInt("bigTypeId"));
				pro.setSmallTypeid(res.getInt("smallTypeId"));
				productList.add(pro);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(res, sta, conn);
		}
		return productList;
	}

	public List<Product> queryListByPage(int currentPage, int pageSize, String typeid) {
		// 创建list集合存储数据
		List<Product> productList = new ArrayList<Product>();
		// 获取查询开始数据索引
	    int index	= pageSize*(currentPage-1);
		Connection conn = null;
		PreparedStatement sta = null;
		ResultSet res = null;
		Product pro = null;
		try {
			// 建立连接
			conn = DBUtil.getConnection();
			// 编写SQL语句
			String sql = "select * from t_product where bigTypeId = ? limit ?,? ";
			// 预编译
			sta = conn.prepareStatement(sql);
			// 设置参数
			sta.setInt(1, Integer.parseInt(typeid));
			sta.setInt(2, index);
			sta.setInt(3, pageSize);
			// 执行查询
			res = sta.executeQuery();
			// 分析结果集
			while(res.next()) {
				pro = new Product();
				pro.setId(res.getInt("id"));
				pro.setName(res.getString("name"));
				pro.setDescription(res.getString("description"));
				pro.setHot(res.getInt("hot"));
				pro.setHotTime(res.getDate("hotTime"));
				pro.setPrice(res.getInt("price"));
				pro.setProPic(res.getString("proPic"));
				pro.setSpecialPrice(res.getInt("specialPrice"));
				pro.setSpecialPriceTime(res.getDate("specialPriceTime"));
				pro.setStock(res.getInt("stock"));
				pro.setBigTypeid(res.getInt("bigTypeId"));
				pro.setSmallTypeid(res.getInt("smallTypeId"));
				productList.add(pro);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 关闭连接
			DBUtil.close(res, sta, conn);
		}
		return productList;
	}

	public List<Product> querySmallTypeByPage(int currentPage, int pageSize, String typeid) {
		// 查询数据库
		Connection conn = null;
		PreparedStatement sta = null;
		ResultSet res = null;
		List<Product> productList = new ArrayList<>();
		// 获取查询开始数据索引
	    int index	= pageSize*(currentPage-1);
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from t_product where smallTypeId = ? limit ?,? ";
			sta = conn.prepareStatement(sql);
			sta.setInt(1, Integer.parseInt(typeid));
			sta.setInt(2, index);
			sta.setInt(3, pageSize);
			// 执行编译，获取结果集
			res = sta.executeQuery();
			while (res.next()) {
				Product pro = new Product();
				pro.setId(res.getInt("id"));
				pro.setName(res.getString("name"));
				pro.setDescription(res.getString("description"));
				pro.setHot(res.getInt("hot"));
				pro.setHotTime(res.getDate("hotTime"));
				pro.setPrice(res.getInt("price"));
				pro.setProPic(res.getString("proPic"));
				pro.setSpecialPrice(res.getInt("specialPrice"));
				pro.setSpecialPriceTime(res.getDate("specialPriceTime"));
				pro.setStock(res.getInt("stock"));
				pro.setBigTypeid(res.getInt("bigTypeId"));
				pro.setSmallTypeid(res.getInt("smallTypeId"));
				productList.add(pro);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productList;
	}

	public int queryBigTypeCount(String typeid) {
		int  count = 0;
		Connection conn = null;
		PreparedStatement sta =null;
		ResultSet rest  = null;
		try {
			// 建立连接
			conn =DBUtil.getConnection();
			// 编写SQL语句
			String sql  = "select count(1) from t_product where bigTypeId = ?";
			// 预编译
			sta = conn.prepareStatement(sql);
			//设置参数
			sta.setInt(1, Integer.parseInt(typeid));
			// 执行查询
			rest = sta.executeQuery();
			// 分析结果集
			while(rest.next()) {
				 count = rest.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(rest, sta, conn);
		}
		return count;
	}
	
	public int querySmallTypeCount(String typeid) {
		int  count = 0;
		Connection conn = null;
		PreparedStatement sta =null;
		ResultSet rest  = null;
		try {
			// 建立连接
			conn =DBUtil.getConnection();
			// 编写SQL语句
			String sql  = "select count(1) from t_product where smallTypeId = ?";
			// 预编译
			sta = conn.prepareStatement(sql);
			//设置参数
			sta.setInt(1, Integer.parseInt(typeid));
			// 执行查询
			rest = sta.executeQuery();
			// 分析结果集
			while(rest.next()) {
				 count = rest.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(rest, sta, conn);
		}
		return count;
	}
}
