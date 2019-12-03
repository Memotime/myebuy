package com.mage.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mage.po.News;
import com.mage.service.NewsService;

/**
 * 	新闻servlet层
 */
@WebServlet("/news")
public class NewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NewsService newsService = new NewsService();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 接收参数
		int newsId = Integer.parseInt(request.getParameter("newsId"));
		News news = newsService.getNewById(newsId);
		String mainPage = "news/newsDetails.jsp";
		// 将数据存入域对象中
		request.setAttribute("news", news);
		request.setAttribute("mainPage", mainPage);
		// 请求转发newsMain.jsp
		request.getRequestDispatcher("/newsMain.jsp").forward(request, response);
	}
}
