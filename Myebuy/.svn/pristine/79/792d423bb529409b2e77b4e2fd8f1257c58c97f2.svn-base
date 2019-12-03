package com.mage.service;

import java.util.List;

import com.mage.dao.NoticeDao;
import com.mage.po.Notice;

/**
 * 	公告模块service层
 * @author Administrator
 */
public class NoticeService {
	private NoticeDao noticeDao = new NoticeDao();
	
	//	查询前六条公告信息
	public List<Notice> queryNoticeAll(){
		//调用dao层方法
		List<Notice> noticeList = noticeDao.queryNoticeAll();
		return noticeList;
	}
	
	// 通过id查询公告信息
	public Notice geNoticeById(int noticeId) {
		// 调用dao层方法
		Notice notice =  noticeDao.getNoticeById(noticeId);
		return notice;
	}
}
