package com.mage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mage.po.News;
import com.mage.util.DBUtil;
/**
 * 	新闻模块dao层
 * @author Administrator
 *
 */
public class NewsDao {
	// 创建news对象
	private News news = null;
	// 获取前六条新闻信息
	public List<News> getNewsAll() {
		// 建立list集合存储新闻标题
		List<News> newsList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		try {
			//建立连接
			conn = DBUtil.getConnection();
			// 编写SQL语句
			String sql = "select * from t_news where id < 7";
			// 预加载
			pstmt = conn.prepareStatement(sql);
			// 执行查询
			rest = pstmt.executeQuery();
			// 分析结果集
			while(rest.next()) {
				news = new News();
				news.setId(rest.getInt("id"));
				news.setContent(rest.getString("content"));
				news.setCreateTime(rest.getDate("createTime"));
				news.setTitle(rest.getString("title"));
				newsList.add(news);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 关闭资源
			DBUtil.close(rest, pstmt,conn );
		}
		return newsList;
	}
	
	public News getNewsById(int newsId){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		try {
			// 建立连接
			conn = DBUtil.getConnection();
			//编写SQL语句
			String sql = "select * from t_news where id = ? ";
			// 预编译
			pstmt = conn.prepareStatement(sql);
			// 设置参数
			pstmt.setInt(1, newsId );
			// 执行查询
			rest = pstmt.executeQuery();
			// 分析结果集
			while(rest.next()) {
				news = new News();
				news.setId(rest.getInt("id"));
				news.setContent(rest.getString("content"));
				news.setCreateTime(rest.getDate("createTime"));
				news.setTitle(rest.getString("title"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 关闭资源
			DBUtil.close(rest, pstmt, conn);
		}
		return news;
 	}
	
}
