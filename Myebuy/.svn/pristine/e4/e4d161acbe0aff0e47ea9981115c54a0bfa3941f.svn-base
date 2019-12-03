package com.mage.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mage.po.Comment;
import com.mage.po.Product;
import com.mage.service.ProductService;
import com.mage.util.PageUtil;
import com.mage.util.StringUtil;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productservice = new ProductService();
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收参数判断执行事件
		String actionName = request.getParameter("actionName");
		if("bigType".equals(actionName)) {
			//查找大类型
			bigType(request,response);
		}else if("smallType".equals(actionName)) {
			//查找小类型
			smallType(request,response);
		}else if("lookproduct".equals(actionName)) {
			//商品详情
			lookproduct(request,response);
		}else if("search".equals(actionName)) {
			//搜索功能
			search(request,response);
		}
		
	}
	/**
	 *搜索功能
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收参数
		String product = request.getParameter("product");
		// 调用ProductService.方法获取数据集合
		List<Product> shproductList = new ArrayList();
		shproductList = productservice.shproductList(product);
		if (shproductList == null) {
			return;
		}
		// 存作用域
		request.setAttribute("productList", shproductList);
		// 将productMain.jsp的动态引入页面路径写好
		request.setAttribute("mainPage", "product/productList.jsp");
		// 请求转发到productMain.jsp页面
		request.getRequestDispatcher("productMain.jsp").forward(request, response);
		
		
	}
	/**
	 * 商品详情
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void lookproduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收参数
		String productid = request.getParameter("productId");
		//调用ProductService.方法获取数据集合
		Product product = new Product();
		product=productservice.lookpro(productid);
		if(product==null) {
			return;
		}
		//添加最近浏览
		nearproduct(product,request);
		//存作用域
		request.setAttribute("product",product);
		//将productMain.jsp的动态引入页面路径写好
		request.setAttribute("mainPage","product/productDetails.jsp");
		//请求转发到productMain.jsp页面
		request.getRequestDispatcher("productMain.jsp").forward(request, response);
		
		
	}
	/**
	 * 添加最近浏览
	 * @param product
	 * @param request 
	 */
	private void nearproduct(Product product, HttpServletRequest request) {
		//获取session
		HttpSession session  = request.getSession();
		List<Product> nearproductList=(LinkedList<Product>)session.getAttribute("nearproductList");
		if(nearproductList==null) {
			nearproductList= new LinkedList<Product>();
		}
		//判断传入的产品是否在最近商品列表中
		boolean flag=true;
		for(Product near:nearproductList) {
			if(near.getId()==product.getId()) {
				flag=false;
				//跳出循环
				break;
			}
		}
		//若是不在集合中，添加进去
		if(flag) {
			nearproductList.add(0,product);
		}
		// 当商品达到了一定的数量我们去掉第一个商品
		if (nearproductList.size() == 4) {
			nearproductList.remove(3);
		}
		// 存储到作用于中
		session.setAttribute("nearproductList", nearproductList);
	}
	/**
	 * 查找小类型
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void smallType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取类别id
			String typeid = request.getParameter("id");
			//获取当前页码
			String page = request.getParameter("page");
			if(StringUtil.isEmpty(page)) {
				page = "1";
			}
			try {
				// 调用service层方法,获取数据集合
				List<Product> productList=productservice.querySmallTypeByPage(Integer.parseInt(page), 8,typeid);
				
				// 调用service层方法,获取数据总数
				int totalNum = productservice.querySmallTypeCount(typeid);
				// 生成分页代码product?actionName=smallType&id=${smallType.id}
				String pageCode = PageUtil.getPagingByPageSize(request.getContextPath()+"/product?actionName=smallType&id="+typeid, totalNum, Integer.parseInt(page), 8);
				
				// 将结果存入域对象中
				request.setAttribute("productList", productList);
				request.setAttribute("pageCode", pageCode);
				
				//将productMain.jsp的动态引入页面路径写好
				request.setAttribute("mainPage","product/productList.jsp");
				//请求转发到productMain.jsp页面
				request.getRequestDispatcher("productMain.jsp").forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	/**
	 * 查找大类型
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void bigType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取类别id
		String typeid = request.getParameter("id");
		//获取当前页码
		String page = request.getParameter("page");
		if(StringUtil.isEmpty(page)) {
			page = "1";
		}
		try {
			// 调用service层方法,获取数据集合
			List<Product> productList=productservice.productListByPage(Integer.parseInt(page), 8,typeid);
			
			// 调用service层方法,获取数据总数
			int totalNum = productservice.queryBigTypeCount(typeid);
			// 生成分页代码
			String pageCode = PageUtil.getPagingByPageSize(request.getContextPath()+"/product?actionName=bigType&id="+typeid, totalNum, Integer.parseInt(page), 8);
			
			// 将结果存入域对象中
			request.setAttribute("productList", productList);
			request.setAttribute("pageCode", pageCode);
			
			//将productMain.jsp的动态引入页面路径写好
			request.setAttribute("mainPage","product/productList.jsp");
			//请求转发到productMain.jsp页面
			request.getRequestDispatcher("productMain.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
