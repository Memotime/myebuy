package com.mage.service;

import java.util.ArrayList;
import java.util.List;

import com.mage.dao.CommentDao;
import com.mage.po.Comment;
import com.mage.util.StringUtil;
/**
 * 	留言模块service层
 * @author Administrator
 */
public class CommentService {
	private CommentDao commentDao = new CommentDao();
	/**
	 * 	分页显示留言内容
	 * @param currentPage
	 * @param pageSize
	 * @return commentList 存储数据的集合
	 */
	public List<Comment> queryListByPage(int currentPage,int pageSize){
		List<Comment> commentList = new ArrayList<>();
		// 调用dao层方法
		commentList = commentDao.queryListByPage(currentPage, pageSize);
		return commentList;
	}
	// 查询所有留言信息总数
	public int queryAllCount() {
		// 调用Dao层方法
		int totalNum = commentDao.queryAllCount();
		return totalNum;
	}
	/**
	 * 	添加留言信息
	 * @param nickName
	 * @param content
	 */
	public void addComment(String nickName,String content) {
		// 非空判断
		if (StringUtil.isEmpty(content)) {
			return;
		}
		if (StringUtil.isEmpty(nickName)) {
			return;
		}
		Comment comment = new Comment();
		comment.setNickName(nickName);
		comment.setContent(content);
		// 调用dao层方法
		commentDao.addComment(comment);
	}
}
