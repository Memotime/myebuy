package com.mage.service;

import java.util.List;

import com.mage.dao.NewsDao;
import com.mage.po.News;

/**
 * 	新闻模块service层
 * @author Administrator
 */
public class NewsService {
	private NewsDao newsDao = new NewsDao();
	/**
	 * 	获取前六条新闻信息
	 * @return
	 */
	public List<News> queryNewsAll(){
		// 调用dao层方法获取数据
		List<News> newsList = newsDao.getNewsAll();
		return newsList;
	}
	/**
	 * 	通过newsId获取对应新闻信息
	 * @param newsId
	 * @return
	 */
	public News getNewById(int newsId) {
		// 调用dao层方法获取数据
		News news = newsDao.getNewsById(newsId);
		return news;
	}
}
