package com.mage.back.servlet;


import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mage.back.dao.accountDao;
import com.mage.back.dao.productDao;
import com.mage.po.BigType;
import com.mage.po.Product;
import com.mage.po.SmallType;
import com.mage.po.vo.Echarst;
import com.mage.service.InitService;
import com.mage.util.DBUtil;
import com.mage.util.StringUtil;

@WebServlet(name = "BackProductServlet", urlPatterns = { "/backproduct" })
@MultipartConfig
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//接收参数判断执行事务
				String actionName = req.getParameter("actionName");
				if("queryAccountListByserch".equals(actionName)) {
					queryAccountListByserch(req,resp);
				}else if("addProduct".equals(actionName)) {
					//添加商品
					addProduct(req,resp);
				}else if("uploadProduct".equals(actionName)) {
					//修改商品信息
					uploadProduct(req,resp);
				}else if("deleteProduct".equals(actionName)) {
					//删除商品
					deleteProduct(req,resp);
				}else if("Sbigtype".equals(actionName)) {
					//查询大类型
					sBigeType(req,resp);
				}else if("Ssmalltype".equals(actionName)) {
					//查询小类型
					Ssmalltype(req,resp);
				}else if("echarst".equals(actionName)) {
					//echars图表
					echars(req,resp);
				}
				
	}
	//echarst图表
	private void echars(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		/* 调用InnitService查询到的结果 */
		InitService initService=new InitService();
		List<BigType> bigTypeList=new ArrayList<>();
		bigTypeList=initService.querybigType();
		Echarst echar=null;
		List<Echarst> map=new ArrayList<>();
		for(BigType list:bigTypeList) {
			echar=new Echarst();
			echar.setName(list.getName());
			echar.setValue((int)(Math.random()*1000+1));
			map.add(echar);
		}
		// 将List转换为json并响应给前台
		Gson gson = new Gson();
		String json = gson.toJson(map);
		resp.getWriter().write(json);
	}
	/**
	 * 删除商品信息
	 * @param req
	 * @param resp
	 * @throws IOException 
	 */
	private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// 获取选中的账户id
		String ids = req.getParameter("ids");
		if (StringUtil.isEmpty(ids)) {
			resp.getWriter().write(0);
			return;
		}
		// 接收dao层数据库查询的数据
		int row = productDao.deletProduct(ids);
		// 判断是否删除成功
		if (row > 0) {
			// 删除成功
			resp.getWriter().write("1");
		} else {
			// 删除失败
			resp.getWriter().write("0");
		}

	}
	/**
	 * 修改商品信息
	 * @param req
	 * @param resp
	 * @throws IOException 
	 */
	private void uploadProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//获取参数
				String pid = req.getParameter("pid");
				String name = req.getParameter("name");
				String description = req.getParameter("description");
				String hot = req.getParameter("hot");
				String hotTime = req.getParameter("hotTime");
				String price = req.getParameter("price");
				String prosrc = req.getParameter("proPic");
				String specialPrice = req.getParameter("specialPrice");
				String specialPriceTime = req.getParameter("specialPriceTime");
				String stock = req.getParameter("stock");
				String bigTypeId = req.getParameter("bigTypeId");
				String smallTypeId = req.getParameter("smallTypeId");	
				//判断时间是否为空
				if(StringUtil.isEmpty(hotTime)) {
					hotTime=null;
				}
				if(StringUtil.isEmpty(specialPriceTime)) {
					specialPriceTime=null;
				}
				String prosrcs[]=prosrc.split("\\\\");
				String proPic="images/product/";
				for(int i=0;i<prosrcs.length;i++) {
					if(i==prosrcs.length-1) {
						proPic+=prosrcs[i];
					}
				}
				//连接数据库
				Connection conn=null;
				PreparedStatement sta=null;
				int row=0;
				try {
					conn=DBUtil.getConnection();
					String sql="update t_product set description=?,hot=?,hotTime=?,name=?,"
							+ "price=?,proPic=?,specialPrice=?,specialPriceTime=?,stock=?,bigTypeId=?,smallTypeId=? where id=?";
					sta=conn.prepareStatement(sql);
					//设置参数
					sta.setString(1,description );
					sta.setInt(2,Integer.parseInt(hot));
					sta.setObject(3,hotTime);
					sta.setString(4,name );
					sta.setInt(5,Integer.parseInt(price) );
					sta.setString(6,proPic );
					sta.setInt(7,Integer.parseInt(specialPrice) );
					sta.setObject(8,specialPriceTime);
					sta.setInt(9,Integer.parseInt(stock) );
					sta.setInt(10,Integer.parseInt(bigTypeId)); 
					sta.setInt(11,Integer.parseInt(smallTypeId));
					sta.setInt(12,Integer.parseInt(pid) );
					row=sta.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					DBUtil.close(null, sta, conn);
				}
				if(row<1) {
					//失败
					resp.getWriter().write("0");
				}else {
					//成功
					resp.getWriter().write("1");
				}
		
	}
	/**
	 * 添加商品
	 * @param req
	 * @param resp
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void addProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		//获取参数
		String name = req.getParameter("name");
		String description = req.getParameter("description");
		String hot = req.getParameter("hot");
		String hotTime = req.getParameter("hotTime");
		String price = req.getParameter("price");
		String prosrc = req.getParameter("proPic");
		String specialPrice = req.getParameter("specialPrice");
		String specialPriceTime = req.getParameter("specialPriceTime");
		String stock = req.getParameter("stock");
		String bigTypeId = req.getParameter("bigTypeId");
		String smallTypeId = req.getParameter("smallTypeId");	
		String prosrcs[]=prosrc.split("\\\\");
		String proPic="images/product/";
		for(int i=0;i<prosrcs.length;i++) {
			if(i==prosrcs.length-1) {
				proPic+=prosrcs[i];
			}
		}
		/*
		 * //获取项目路径 File file = new File(""); String filePath = file.getCanonicalPath();
		 * // 1、得到 文件 part 对象 Part part = req.getPart(prosrc);
		 * 
		 * // 得到上传文件名称 String submittedFileName = part.getSubmittedFileName(); //
		 * 2、得到文件上传路径 String realPath = filePath+proPic; // 3、输出文件 part.write(realPath);
		 */
		//连接数据库
		Connection conn=null;
		PreparedStatement sta=null;
		int row=0;
		try {
			conn=DBUtil.getConnection();
			String sql="insert into t_product (description,hot,hotTime,name,price,proPic,specialPrice,specialPriceTime,stock,bigTypeId,smallTypeId) "
					+ "values (?,?,?,?,?,?,?,?,?,?,?)";
			sta=conn.prepareStatement(sql);
			//设置参数
			sta.setString(1,description );
			sta.setInt(2,Integer.parseInt(hot));
			sta.setObject(3,hotTime);
			sta.setString(4,name );
			sta.setInt(5,Integer.parseInt(price) );
			sta.setString(6,proPic );
			sta.setInt(7,Integer.parseInt(specialPrice) );
			sta.setObject(8,specialPriceTime);
			sta.setInt(9,Integer.parseInt(stock) );
			sta.setInt(10,Integer.parseInt(bigTypeId)); 
			sta.setInt(11,Integer.parseInt(smallTypeId));
			row=sta.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(null, sta, conn);
		}
		if(row<1) {
			//失败
			resp.getWriter().write("0");
		}else {
			//成功
			resp.getWriter().write("1");
		}
	}
	/**
	 * 分页查询及条件查找
	 * @param req
	 * @param resp
	 * @throws IOException 
	 */
	private void queryAccountListByserch(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// 获取参数
				String name = req.getParameter("name");
				String bigtype = req.getParameter("bigtype");
				String smalltype = req.getParameter("smalltype");
				String price = req.getParameter("price");
				String pageSrr = req.getParameter("page");
				String pageSizeSrr=req.getParameter("rows");
				String ssql="";
				String ssqllist="";
				int pagenum=1;
				int pageSize=5;
				if(StringUtil.isNotEmpty(pageSrr)) {
					pagenum=Integer.parseInt(pageSrr);
				}
				if(StringUtil.isNotEmpty(pageSizeSrr)) {
					pageSize=Integer.parseInt(pageSizeSrr);
				}
				int index = (pagenum - 1)*pageSize;
				List<Object> params = new ArrayList<>();
				// 非空
				if(StringUtil.isNotEmpty(name)) {
					params.add(name);
					ssql+=" and p.name like ?";
					ssqllist+=" and p.name like ?";
				}
				if(StringUtil.isNotEmpty(bigtype)) {
					params.add(bigtype);
					ssql+=" and p.bigTypeId = ?";
					ssqllist+=" and p.bigTypeId = ?";
				}
				if(StringUtil.isNotEmpty(smalltype)) {
					params.add(smalltype);
					ssql+=" and p.smallTypeId = ?";
					ssqllist+=" and p.smallTypeId = ?";
				}
				if(StringUtil.isNotEmpty(price)) {
					params.add(price);
					ssql+=" and p.price <= ?";
					ssqllist+=" and p.price <= ?";
				}
				//接收dao层数据库查询的数据
				Map<String,Object> map = new HashMap<>();
				map=productDao.sercher(ssql,ssqllist,params,index,pageSize,name);
				// 将Map转换为json并响应给前台
				Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
				String json = gson.toJson(map);
				resp.getWriter().write(json);
		
	}
	/**
	 * 查询小类型
	 * @param req
	 * @param resp
	 * @throws IOException 
	 */
	private void Ssmalltype(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//接收参数
		int pid = Integer.parseInt(req.getParameter("pid"));
		/* 调用InnitService查询到的结果 */
		InitService initService=new InitService();
		List<BigType> bigTypeList=new ArrayList<>();
		bigTypeList=initService.querybigType();
		List<SmallType> smalltype=new ArrayList<>();
		//将数据发送到前台
		for(BigType small:bigTypeList) {
			if(small.getId()==pid) {
				smalltype=small.getSmallTypeList();
			}
		}
		Gson gson =new Gson();
		String json = gson.toJson(smalltype);
		resp.getWriter().write(json);
		
	}
	/**
	 * 查询大类型
	 * @param req
	 * @param resp
	 * @throws IOException 
	 */
	private void sBigeType(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		/* 调用InnitService查询到的结果 */
		InitService initService=new InitService();
		List<BigType> bigTypeList=new ArrayList<>();
		bigTypeList=initService.querybigType();
		//将数据发送到前台
		Gson gson =new Gson();
		String json = gson.toJson(bigTypeList);
		resp.getWriter().write(json);
	}

}
