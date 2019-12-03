package com.mage.back.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mage.po.User;
import com.mage.util.DBUtil;
import com.mage.util.StringUtil;

public class accountDao {

	public static Map<String, Object> addaccount(String ssql, String ssqllist, List<Object> params, int index,
			int pageSize, String name) {

		long count = 0;
		Connection conn = null;
		PreparedStatement sta = null;
		ResultSet res = null;
		List<User> list = new ArrayList<>();
		try {
			conn = DBUtil.getConnection();
			String sql = "select count(*) from t_user where 1=1" + ssql;
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
			String sql2 = "select * from t_user where 1=1" + ssqllist;
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
				User user = new User();
				user.setId(res.getInt("id"));
				user.setUserName(res.getString("userName"));
				user.setPassword(res.getString("password"));
				user.setTrueName(res.getString("trueName"));
				user.setSex(res.getString("sex"));
				user.setDentityCode(res.getString("dentityCode"));
				user.setEmail(res.getString("email"));
				user.setMobile(res.getString("mobile"));
				user.setAddress(res.getString("address"));
				user.setBirthday(res.getDate("birthday"));
				user.setStatus(res.getInt("status"));
				list.add(user);
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

	public static int deletAccount(String ids) {
		// 连接数据库，操作数据库
		Connection conn = null;
		PreparedStatement sta = null;
		int row = 0;
		try {
			// 获取连接
			conn = DBUtil.getConnection();
			// 设置不自动提交事务
			conn.setAutoCommit(false);
			// 编写sql语句
			String sqle = "delete from t_order where id in(" + ids + ")";
			// 预编译
			sta = conn.prepareStatement(sqle);
			// 执行编译
			sta.executeUpdate();
			// 编写sql语句
			String sql = "delete from t_user where id in(" + ids + ")";
			// 预编译
			sta = conn.prepareStatement(sql);
			// 执行编译
			row = sta.executeUpdate();
			if(row<1) {
				// 失败，回滚
				conn.rollback();
				return row;
			}else {
				conn.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(null, sta, conn);
		}
		return row;
	}

}
