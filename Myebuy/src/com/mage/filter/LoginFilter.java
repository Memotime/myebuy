package com.mage.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/index.jsp")
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		// 基于HTTP
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse)resp;
		// 未登录情况
		// 判断cookie中是否记住密码
		// 获取cookie
		Cookie[] cookies = request.getCookies();
		// 判断cookie是否为空
		if (cookies != null && cookies.length > 0) {
			// 遍历cookie数组
			for (Cookie cookie : cookies) {
				// 判断是否是记住密码的cookie对象
				if ("user".equals(cookie.getName())) {
					// 得到cookie的值
					String value = cookie.getValue();
					// 分割cookie的值，得到登录的用户名和密码
					String uname = value.split("-")[0];
					String upwd = value.split("-")[1];
					// 请求转发跳转 调用登录功能
					request.getRequestDispatcher("user?actionName=login&uname=" + uname + "&upwd=" + upwd)
							.forward(request, response);
					return;
				}
			}
		}

		// 拦截到登录界面
		response.sendRedirect("index");
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
