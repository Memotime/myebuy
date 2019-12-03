package com.mage.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mage.po.Order;
import com.mage.po.OrderProduct;
import com.mage.po.ShoppingCarProduct;
import com.mage.po.User;
import com.mage.service.OrderProductService;
import com.mage.service.OrderService;
import com.mage.service.ShoppingCarService;
import com.mage.util.DateUtil;

/**
 * 订单管理
 */
@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private OrderService orderService = new OrderService();
	private OrderProductService orderProductService = new OrderProductService();
	private ShoppingCarService shoppingCarService = new ShoppingCarService();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获取用户行为
		String actionName = request.getParameter("actionName");
		//判断分流
		if("save".equals(actionName)) {
			//提交订单
			subOrder(request,response);
			return;
		}else if("list".equals(actionName)) {
			//展示订单
			findOrderList(request,response);
			return;
		}
	}


	/**
	 * 查询订单数据
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void findOrderList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获取session
		HttpSession session = request.getSession();
		
		//获取用户
		User user = (User)session.getAttribute("user");
		//查询order
		List<Order> orderListOld = orderService.findOrderList(user.getId());
		List<Order> orderList = new ArrayList<Order>();
		List<OrderProduct> orderProductList = new ArrayList<OrderProduct>();
		for (Order order : orderListOld) {
			//根据订单id查询该订单中的商品信息
			orderProductList = orderProductService.findOrderProductList(order);
			//订单对象添加商品集合
			order.setOrderProductList(orderProductList);
			orderList.add(order);
		}
		//存放作用域
		request.setAttribute("orderList", orderList);
		String mainPage = "userCenter/orderList.jsp";
		request.setAttribute("mainPage", mainPage);
		request.setAttribute("orderList", orderList);
		// 请求转发
		request.getRequestDispatcher("/userCenter.jsp").forward(request, response);
		
	}


	/**
	 * 提交订单
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void subOrder(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// 获取session
		HttpSession session = request.getSession();
		
		//创建一个order对象
		Order order = new Order();
		//获取用户
		User user = (User)session.getAttribute("user");
		//获取购物车
		List<ShoppingCarProduct> shoppingCarProductList = (List<ShoppingCarProduct>) session.getAttribute("shoppingCarProductList");
		//填充数据
		order.setUserId(user.getId());
		order.setOrderNo(DateUtil.getCurrentDateStr());
		order.setStatus(1);
		
		int sum = 0; 
		List<OrderProduct> orderProductList = new ArrayList<OrderProduct>();
		for (ShoppingCarProduct shoppingCarProduct : shoppingCarProductList) {
			OrderProduct orderProduct = new OrderProduct();
			orderProduct.setNum(shoppingCarProduct.getNum());
			orderProduct.setProductId(shoppingCarProduct.getProductId());
			//计算总金额
			sum = (shoppingCarProduct.getPrice())*(shoppingCarProduct.getNum());
			orderProductList.add(orderProduct);
		}
		//设置总价
		order.setCost(sum);
		//设置商品集合
		order.setOrderProductList(orderProductList);
		//状态
		boolean flag = true;
		//调用orderService增加订单数据，返回订单id 
		int orderId = orderService.subOarder(order);
		
		//设置订单商品的订单id
		List<OrderProduct> orderProductList2 = new ArrayList<OrderProduct>();
		for (OrderProduct orderProduct : orderProductList) {
			orderProduct.setOrderId(orderId);
			orderProductList2.add(orderProduct);
		}
		//调用订单商品的service 增加订单商品
		orderProductService.addOrderProduct(orderProductList2);
		
		// 清空购物车
		shoppingCarService.removeProductAll(user.getId());
		session.removeAttribute("shoppingCarProductList");
		//成功跳转
		String mainPage = "shopping/shopping-result.jsp";
		request.setAttribute("mainPage", mainPage);
		
		request.getRequestDispatcher("/shoppingMain.jsp").forward(request, response);
		
	}

}
