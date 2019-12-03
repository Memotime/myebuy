package com.mage.back.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mage.po.BigType;
import com.mage.po.Product;
import com.mage.po.SmallType;
import com.mage.util.DBUtil;
import com.mage.util.StringUtil;

public class TypeDao {
	/**
	 * 查询所有类型
	 * @param params 
	 * @param ssqllist 
	 * @param ssql 
	 * @param pageSize 
	 * @param index 
	 * @param name 
	 * @return
	 */
	public Map<String, Object> queryAllType(String ssql, String ssqllist, List<Object> params, int index, int pageSize, String name) {
		// 查询数据库
		long count = 0;
		Connection conn = null;
		PreparedStatement sta = null;
		ResultSet res = null;
		List<Object> List = new ArrayList<>();
		try {
			conn = DBUtil.getConnection();
			String sql = "select count(1) from t_bigtype b left join t_smalltype s on b.id=s.bigTypeId"+ ssql;
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
			String sql2 = "select * from t_bigtype b left join t_smalltype s on b.id=s.bigTypeId"
					+ ssqllist;
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
				SmallType small = new SmallType();
				small.setId(res.getInt("s.id"));
				small.setName(res.getString("s.name"));
				small.setRemarks(res.getString("s.remarks"));
				small.setBigTypeId(res.getInt("b.id"));
				small.setBigname(res.getString("b.name"));
				List.add(small);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(res, sta, conn);
		}
		// 把上面的总数和当前页要显示的数据放到Map里 分别对应键 total 和 rows 的值
		Map<String, Object> map = new HashMap<>();
		map.put("total", count);
		map.put("rows", List);
		return map;
	}
	/**
	 * 添加类型
	 * @param big
	 * @return
	 */
	public int addType(BigType big) {
		//判断是添加大类型还是小类型
		List<Object> params = new ArrayList<Object>();
		params.add(big.getName());
		params.add(big.getRemarks());
		String sql="";
		if(big.getId()==0) {
			//添加大类型
			sql="insert into t_bigtype (name,remarks) values (?,?)";
		}else {
			//添加小类型
			sql="insert into t_smalltype (name,remarks,bigTypeId) values (?,?,?)";
			params.add(big.getId());
		}
		Connection conn=null;
		PreparedStatement sta=null;
		int row=0;
		try {
			conn=DBUtil.getConnection();
			sta=conn.prepareStatement(sql);
			//设置参数
			for(int i=0;i<params.size();i++) {
				sta.setObject(i+1, params.get(i));
			}
			//编译执行
			row=sta.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(null, sta, conn);
		}
		return row;
	}
	/**
	 * 修改类型
	 * @param small
	 * @return
	 */
	public int updateType(SmallType small) {
		//连接数据库
		Connection conn=null;
		PreparedStatement sta=null;
		int row=0;
		try {
			conn=DBUtil.getConnection();
			String sql="update t_smalltype set name=?,remarks=?,bigTypeId=? where id=?";
			sta=conn.prepareStatement(sql);
			//设置参数
			sta.setString(1, small.getName());
			sta.setString(2, small.getRemarks());
			sta.setInt(3, small.getBigTypeId());
			sta.setInt(4, small.getId());
			//编译执行
			row=sta.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(null, sta, conn);
		}
		return row;
	}
	/**
	 * 删除类型
	 * @param ids
	 * @param bigTypeId 
	 * @return
	 */
	public static int deletType(String ids, String bigTypeId) {
		// 连接数据库，操作数据库
		Connection conn = null;
		PreparedStatement sta = null;
		int row = 0;
		String[] ids2=ids.split(",");
		String[] bigTypeIds=bigTypeId.split(",");
		try {	
			for(int i=0;i<ids2.length;i++) {
				// 获取连接
				conn = DBUtil.getConnection();
				String sql="";
				// 编写sql语句
				if(Integer.parseInt(ids2[i])==0) {
					sql = "delete from t_bigtype where id =?";
					ids2[i]=bigTypeIds[i];
				}else {
					sql = "delete from t_smalltype where id =?";
				}
				// 预编译
				sta = conn.prepareStatement(sql);
				//设置参数
				sta.setInt(1, Integer.parseInt(ids2[i]));
				// 执行编译
				row = sta.executeUpdate();
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(null, sta, conn);
		}
		return row;
	}
}
