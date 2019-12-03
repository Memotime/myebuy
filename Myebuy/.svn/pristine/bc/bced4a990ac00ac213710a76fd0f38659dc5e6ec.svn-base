package com.mage.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mage.po.ShoppingCarProduct;
import com.mage.po.User;
import com.mage.service.OrderProductService;
import com.mage.service.OrderService;
import com.mage.service.ShoppingCarService;

/**
 * 购物车管理
 */
@WebServlet("/shopping")
public class ShoppingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ShoppingCarService shoppingCarService = new ShoppingCarService();
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取用户行为
		String actionName = request.getParameter("actionName");
		//判断行为
		//查询用户购物车信息
		if("showShopping".equals(actionName)) {
			showShopping(request,response);
			return;
		}else if("findShoppingListByUid".equals(actionName)){
			findShoppingListByUid(request,response);
			return;
		}else if("addNum".equals(actionName)) {
			addNum(request,response);
			return;
		}else if("minNum".equals(actionName)) {
			minNum(request,response);
			return;
		}else if("removeProduct".equals(actionName)) {
			removeProduct(request,response);
			return;
		}else if("addShopping".equals(actionName)) {
			addShopping(request,response);
			return;
		}else if("buy".equals(actionName)) {
			buyProduct(request,response);
			return;
		}
	}


	/**
	 * 
	 * 购买
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void buyProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 获取产品id
		String productId = request.getParameter("productId");
		//获取用户
		User user = (User)request.getSession().getAttribute("user");
		//创建订单service
		OrderService orderService = new OrderService();
		OrderProductService orderProductService = new OrderProductService();
		//调用订单
		int row = orderService.addOrderByProduct(productId,user);
		response.getWriter().write(row+"");
	}


	/**
	 * 
	 * 加入购物车
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void addShopping(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 获取产品id
		String productId = request.getParameter("productId");
		//获取用户id
		User user = (User)request.getSession().getAttribute("user");
		int row = shoppingCarService.addShopping(productId,user);
		//刷新购物车中数据
		findShoppingListByUid(request,response);
		response.getWriter().write(row+"");
	}


	/**
	 * 显示购物车页面
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void showShopping(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//跳转融合页面
		String mainPage = "shopping/shopping.jsp";
		//存储信息
		request.setAttribute("mainPage", mainPage);
		//请求转发
		request.getRequestDispatcher("/shoppingMain.jsp").forward(request, response);
		
	}


	/**
	 * 删除商品
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void removeProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//获取参数
		String productId = request.getParameter("productId");
		//调用service层方法
		int row = shoppingCarService.removeProduct(productId);
		
		//刷新购物车中数据
		findShoppingListByUid(request,response);
		//响应受影响行数
		response.getWriter().write(row+"");

		
	}


	/**
	 * 减少数量
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException 
	 */
	private void minNum(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//获取参数
		String productId = request.getParameter("productId");
		//调用service层方法
		int row = shoppingCarService.minNum(productId);
		response.getWriter().write(row+"");
		
	}


	/**
	 * 增加数量
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void addNum(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//获取参数
		String productId = request.getParameter("productId");
		//调用service层方法
		int row = shoppingCarService.addNum(productId);
		response.getWriter().write(row+"");
	}


	/**
	 * 根据用户id查询购物车的中的产品 存入session域对象中
	 * @param request
	 * @param response
	 */
	private void findShoppingListByUid(HttpServletRequest request, HttpServletResponse response) {
		  
		  // 获取用户id
		  User user = (User)request.getSession().getAttribute("user");
		  int userId = user.getId();
		  //调用service层 返回购物车中的产品信息列表 
		  List<ShoppingCarProduct> shoppingCarProductList = shoppingCarService.findShoppingListByUid(userId);
		  
		  //将数据存到session域对象中
		  HttpSession session = request.getSession();
		  session.setAttribute("shoppingCarProductList", shoppingCarProductList);
		 
	
	}

}
