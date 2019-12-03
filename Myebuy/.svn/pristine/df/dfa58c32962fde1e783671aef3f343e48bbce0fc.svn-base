package com.mage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mage.po.Notice;
import com.mage.util.DBUtil;
/**
 * 	公告dao层
 * @author Administrator
 */
public class NoticeDao {
	private Notice notice = null;
	
	
	// 查询前六条公告信息
	public List<Notice> queryNoticeAll(){
		List<Notice> noticeList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		try {
			// 建立连接
			conn = DBUtil.getConnection();
			// 编写SQL语句
			String sql = "select * from t_notice where id < 7";
			// 预编译
			pstmt = conn.prepareStatement(sql);
			// 执行查询
			rest = pstmt.executeQuery();
			// 分析结果集
			while(rest.next()) {
				notice = new Notice();
				notice.setId(rest.getInt("id"));
				notice.setContent(rest.getString("content"));
				notice.setCreateTime(rest.getDate("createTime"));
				notice.setTitle(rest.getString("title"));
				noticeList.add(notice);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 关闭连接
			DBUtil.close(rest, pstmt, conn);
		}
		return noticeList;
	}
	
	// 根据id查询公告信息
	public Notice getNoticeById(int noticeId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		try {
			// 建立连接
			conn = DBUtil.getConnection();
			// 编写SQL语句
			String sql = "select * from t_notice where id = ?";
			// 预编译
			pstmt = conn.prepareStatement( sql);
			// 设置参数
			pstmt.setInt(1, noticeId);
			// 执行查询
			rest = pstmt.executeQuery();
			// 分析结果集
			while(rest.next()) {
				notice = new Notice();
				notice.setId(rest.getInt("id"));
				notice.setContent(rest.getString("content"));
				notice.setCreateTime(rest.getDate("createTime"));
				notice.setTitle(rest.getString("title"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 关闭连接
			DBUtil.close(rest, pstmt, conn);
		}
		return notice;
	}
}
