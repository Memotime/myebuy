package com.mage.filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/*")
public class EncodeFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		//	基于HTTP
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)resp;
		
		//	设置POST请求编码以及响应编码
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		//	获取服务器版本
		String serverInfo = request.getServletContext().getServerInfo();
		//	得到服务器版本号
		String info = serverInfo.substring(serverInfo.indexOf("/")+1, serverInfo.indexOf("."));
		//	判断服务器版本号是否小于8
		if(info!=null && Integer.parseInt(info)<8) {
			//	获取请求方式
			String method = request.getMethod();
			//	判断请求方式
			if("get".equalsIgnoreCase(method)) {
				HttpServletRequest myWrapper = new MyWrapper(request);
				//	放行
				chain.doFilter(myWrapper, response);
				return;
			}
		}
		//	放行
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		
	}
	/**
	 * 定义内部类MyWrapper继承HttpServletRequestWrapper
	 *    目的：重写getParameter方法
	 * @author Administrator
	 *
	 */
	class MyWrapper  extends HttpServletRequestWrapper{
		HttpServletRequest request;
		
		public MyWrapper(HttpServletRequest request) {
			super(request);
			this.request = request;
		}

		@Override
		public String getParameter(String name) {
			String value = null;
			try {
				if(request.getParameter(name)!=null) {
					value = new String(request.getParameter(name).getBytes("ISO-8859-1"),"UTF-8");
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			return value;
		}
		
	}
	
}
