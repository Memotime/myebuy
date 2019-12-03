package com.mage.back.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import com.mage.po.Product;
import com.mage.util.DBUtil;
import com.mage.util.StringUtil;

public class productDao {

	public static Map<String, Object> sercher(String ssql, String ssqllist, List<Object> params, int index,
			int pageSize, String name) {
		long count = 0;
		Connection conn = null;
		PreparedStatement sta = null;
		ResultSet res = null;
		List<Product> list = new ArrayList<>();
		try {
			conn = DBUtil.getConnection();
			String sql = "select count(*) from t_product p where 1=1" + ssql;
			sta = conn.prepareStatement(sql);
			// 设置参数
			for (int i = 0; i < params.size(); i++) {

				if (StringUtil.isNotEmpty(name) && i == 1) {
					sta.setObject(i + 1, "%" + params.get(i) + "%");
				} else {
					sta.setObject(i + 1, params.get(i));
				}
			}

			res = sta.executeQuery();
			// 获取查询总数
			while (res.next()) {
				count = res.getLong(1);
			}
			// 查询数据
			params.add(index);
			params.add(pageSize);
			ssqllist += " limit ?,?";
			String sql2 = "select * from t_product p LEFT JOIN t_smalltype s on p.smallTypeId=s.id where 1=1" + ssqllist;
			sta = conn.prepareStatement(sql2);
			if (params.size() > 0) {
				for (int i = 0; i < params.size(); i++) {

					if (StringUtil.isNotEmpty(name) && i == 0) {
						sta.setObject(i + 1, "%" + params.get(i) + "%");
					} else {
						sta.setObject(i + 1, params.get(i));
					}
				}
			}

			res = sta.executeQuery();
			// 分析结果集
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
				pro.setSmallName(res.getString("s.name"));
				list.add(pro);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(res, sta, conn);
		}
		// 把上面的总数和当前页要显示的数据放到Map里 分别对应键 total 和 rows 的值
		Map<String, Object> map = new HashMap<>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
/**
 * 删除
 * @param ids
 * @return
 */
	public static int deletProduct(String ids) {
		// 连接数据库，操作数据库
		Connection conn = null;
		PreparedStatement sta = null;
		int row = 0;
		try {
			// 获取连接
			conn = DBUtil.getConnection();
			// 编写sql语句
			String sql = "delete from t_product where id in(" + ids + ")";
			// 预编译
			sta = conn.prepareStatement(sql);
			// 执行编译
			row = sta.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(null, sta, conn);
		}
		return row;
	}

}
