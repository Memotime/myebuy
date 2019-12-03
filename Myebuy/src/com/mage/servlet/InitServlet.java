package com.mage.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mage.po.BigType;
import com.mage.po.Product;
import com.mage.po.Tag;
import com.mage.service.InitService;
import com.mage.po.News;
import com.mage.po.Notice;
import com.mage.service.NewsService;
import com.mage.service.NoticeService;


/**
 * 	首页初始化servlet
 */
public class InitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//头部和左侧标签栏
	private InitService initService=new InitService();
	// 新闻
	private NewsService newsService = new NewsService();
	// 公告
	private NoticeService noticeService = new NoticeService();
	/**
	 * 	分发器
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取大类型列表
		List<BigType> bigTypeList=new ArrayList<>();
		bigTypeList=initService.querybigType();
		//将数据集合存到域对象
		request.getSession().setAttribute("bigTypeList", bigTypeList);
		/*******************获取今日特价列表***********************/
		// 获取今日特价列表
		List<Product> special = new ArrayList<>();
		special = initService.queryspecial();
		// 将数据集合存到域对象
		request.getSession().setAttribute("special", special);
		/********************获取特卖推荐列表************************************************/
		// 获取特卖推荐列表
		List<Product> hotType = new ArrayList<>();
		hotType = initService.queryhotType();
		// 将数据集合存到域对象
		request.getSession().setAttribute("hotType", hotType);
		/********************获取标签列表************************************************/		
		//标签
		List<Tag> tagList=new ArrayList<>();
		tagList=initService.querytagType();
		//将数据集合存到域对象
		request.getSession().setAttribute("tagList", tagList);

		// 查询新闻
		List<News> newsList = newsService.queryNewsAll();
		// 查询公告
		List<Notice> noticeList = noticeService.queryNoticeAll();
		// 创建session域对象，也是获取
		HttpSession session  = request.getSession();
		// 提示作用域，将查询结果存放到session作用域中
		session.setAttribute("newsList", newsList);
		session.setAttribute("noticeList", noticeList);
		//请求转发到首页
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
