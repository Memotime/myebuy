package com.mage.back.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mage.back.dao.TypeDao;
import com.mage.back.dao.productDao;
import com.mage.po.BigType;
import com.mage.po.SmallType;
import com.mage.util.StringUtil;

@WebServlet("/type")
public class TypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收参数判断执行事务
		String actionName = request.getParameter("actionName");
		if("queryAccountListByserch".equals(actionName)) {
			//查找所有类型
			queryAccountListByserch(request,response);
		}else if("addType".equals(actionName)) {
			//添加类型
			addType(request,response);
		}else if("uploadType".equals(actionName)) {
			//修改类型
			uploadType(request,response);
		}else if("deleteType".equals(actionName)) {
			//删除类型
			deleteType(request,response);
		}
	}
	/**
	 * 删除类型
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void deleteType(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 获取选中的账户id
		String ids = request.getParameter("ids");
		String bigTypeId = request.getParameter("bigTypeId");
		if (StringUtil.isEmpty(ids)) {
			response.getWriter().write(0);
			return;
		}
		// 接收dao层数据库查询的数据
		
		  int row = TypeDao.deletType(ids,bigTypeId); 
		  // 判断是否删除成功 
		  if (row > 0) { 
			 //删除成功 
			 response.getWriter().write("1"); 
		  }else { // 删除失败
			 response.getWriter().write("0"); 
		  }
		 

	}
	/**
	 * 修改类型
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void uploadType(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 接收参数
		String pid = request.getParameter("uid");
		String name = request.getParameter("name");
		String bigtype = request.getParameter("bigtype");
		String remarks = request.getParameter("remarks");
		SmallType small = new SmallType();
		small.setName(name);
		small.setRemarks(remarks);
		small.setId(Integer.parseInt(pid));
		small.setBigTypeId(Integer.parseInt(bigtype));
		// 非空判断
		if (StringUtil.isEmpty(name)) {
			// 为空返回0，添加失败
			response.getWriter().write("0");
			return;
		}
		if (StringUtil.isEmpty(bigtype)) {
			// 为空返回0，添加失败
			response.getWriter().write("0");
			return;
		}

		// 调用dao层返回的结果
		TypeDao typedao = new TypeDao();
		int row = typedao.updateType(small);
		if (row > 0) {
			// 修改成功
			response.getWriter().write("1");
			return;
		} else {
			// 修改失败
			response.getWriter().write("0");
			return;
		}

	}
	/**
	 * 添加类型
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void addType(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//接收参数
		String name = request.getParameter("name");
		String bigtype = request.getParameter("bigtype");
		String remarks = request.getParameter("remarks");
		BigType big = new BigType();
		big.setName(name);
		big.setRemarks(remarks);
		//非空判断
		if(StringUtil.isEmpty(name)) {
			//为空返回0，添加失败
			response.getWriter().write("0");
			return;
		}
		if(StringUtil.isEmpty(bigtype)) {
			big.setId(0);
		}else {
			big.setId(Integer.parseInt(bigtype));
		}
		
		//调用dao层返回的结果	
		TypeDao typedao = new TypeDao();
		int row = typedao.addType(big);
		if (row > 0) {
			// 添加成功
			response.getWriter().write("1");
			return;
		} else {
			// 添加失败
			response.getWriter().write("0");
			return;
		}

	}
	/**
	 * 查询所有类型
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void queryAccountListByserch(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//接收参数
		String name = request.getParameter("name");
		String bigtype = request.getParameter("bigtype");
		String pageSrr = request.getParameter("page");
		String pageSizeSrr=request.getParameter("rows");
		// 非空
		List<Object> params = new ArrayList<>();
		String ssql="";
		String ssqllist="";
		if(StringUtil.isNotEmpty(name)) {
			params.add(name);
			ssql+=" and s.name like ?";
			ssqllist+=" and s.name like ?";
		}
		if(StringUtil.isNotEmpty(bigtype)) {
			params.add(bigtype);
			ssql+=" and s.bigTypeId = ?";
			ssqllist+=" and s.bigTypeId = ?";
		}
		int pagenum=1;
		int pageSize=5;
		if(StringUtil.isNotEmpty(pageSrr)) {
			pagenum=Integer.parseInt(pageSrr);
		}
		if(StringUtil.isNotEmpty(pageSizeSrr)) {
			pageSize=Integer.parseInt(pageSizeSrr);
		}
		int index = (pagenum - 1)*pageSize;
		//接收dao层数据库查询的数据
		TypeDao typedao=new TypeDao();
		Map<String,Object> map = new HashMap<>();
		map=typedao.queryAllType(ssql,ssqllist,params,index,pageSize,name);
		//发送给前台
		Gson gson =new Gson();
		String json = gson.toJson(map);
		response.getWriter().write(json);
		
	}
	
}
