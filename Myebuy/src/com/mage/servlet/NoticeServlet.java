package com.mage.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mage.po.Notice;
import com.mage.service.NoticeService;

/**
 * 	公告模块servlet层
 * @author Administrator
 */
@WebServlet("/notice")
public class NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticeService noticeService = new NoticeService();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 接收参数
		int noticeId = Integer.parseInt(request.getParameter("noticeId"));
		// 调用service层方法
		Notice notice = noticeService.geNoticeById(noticeId);
		String mainPage  = "notice/noticeDetails.jsp";
		// 将结果存入域对象中
		request.setAttribute("notice", notice);
		request.setAttribute("mainPage", mainPage);
		// 请求转发noticeMain.jsp页面
		request.getRequestDispatcher("/noticeMain.jsp").forward(request, response);
	}

}
