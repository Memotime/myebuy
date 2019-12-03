package com.mage.back.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mage.back.dao.accountDao;
import com.mage.po.BigType;
import com.mage.po.User;
import com.mage.po.vo.ResultInfo;
import com.mage.service.InitService;
import com.mage.service.UserService;
import com.mage.util.StringUtil;

/**
 * Servlet implementation class accountServlet
 */
@WebServlet("/account")
public class accountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//接收参数判断执行事务
		String actionName = req.getParameter("actionName");
		if("queryAccountListByserch".equals(actionName)) {
			queryAccountListByserch(req,resp);
		}else if("addAccount".equals(actionName)) {
			try {
				addAccount(req,resp);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if("uploadAccount".equals(actionName)) {
			//修改用户信息
			try {
				uploadAccount(req,resp);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if("deleteAccount".equals(actionName)) {
			//删除用户
			deleteAccount(req,resp);
		}
		
	}
	/**
	 * 删除用户
	 * @param req
	 * @param resp
	 * @throws IOException 
	 */
	private void deleteAccount(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// 获取选中的账户id
		String ids = req.getParameter("ids");
		System.out.println(ids);
		if (StringUtil.isEmpty(ids)) {
			resp.getWriter().write(0);
			return;
		}
		// 接收dao层数据库查询的数据
		int row= accountDao.deletAccount(ids);
		//判断是否删除成功
		if(row>0) {
			//删除成功
			resp.getWriter().write("1");
		}else {
			//删除失败
			resp.getWriter().write("0");
		}

	}
	/**
	 * 修改用户信息
	 * @param req
	 * @param resp
	 * @throws ParseException 
	 * @throws IOException 
	 */
	private void uploadAccount(HttpServletRequest req, HttpServletResponse resp) throws ParseException, IOException {
		// 接收参数
		String uid = req.getParameter("uid");// 编号
		String userName = req.getParameter("userName");// 用户名
		String trueName = req.getParameter("trueName");// 姓名
		String password = req.getParameter("password");// 密码
		String mobile = req.getParameter("mobile");// 电话
		String address = req.getParameter("address");// 地址
		String sex = req.getParameter("sex");// 性别
		String birthday = req.getParameter("birthday");// 生日
		String dentityCode = req.getParameter("dentityCode");// 身份证号码
		String email = req.getParameter("email");// 电子邮
		// 日期格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date biryhdate = sdf.parse(birthday);
		// 创建对象储存参数对象
		User upuser = new User();
		upuser.setId(Integer.parseInt(uid));
		upuser.setTrueName(trueName);
		upuser.setUserName(userName);
		upuser.setPassword(password);
		upuser.setMobile(mobile);
		upuser.setAddress(address);
		upuser.setSex(sex);
		upuser.setBirthday(biryhdate);
		upuser.setDentityCode(dentityCode);
		upuser.setEmail(email);
		upuser.setStatus(1);
		// 调用service方法获取结果信息
		UserService userService = new UserService();
		ResultInfo<User> result = userService.update(upuser);
		if (result.getCode() == 1) {
			// 修改成功，向前台发送信息
			resp.getWriter().write("1");
		} else {
			// 修改失败
			resp.getWriter().write("0");
		}

	}
	/**
	 * 增加用户
	 * @param req
	 * @param resp
	 * @throws ParseException 
	 */
	private void addAccount(HttpServletRequest req, HttpServletResponse resp) throws ParseException {
		// 接收参数
		String userName = req.getParameter("userName");// 用户名
		String trueName = req.getParameter("trueName");// 用户昵称
		String password = req.getParameter("password");// 密码
		String mobile = req.getParameter("mobile");// 电话
		String address = req.getParameter("address");// 地址
		String sex = req.getParameter("sex");// 性别
		String birthday = req.getParameter("birthday");// 生日
		String dentityCode = req.getParameter("dentityCode");// 身份证号码
		String email = req.getParameter("email");// 电子邮件
		User user = new User();
		user.setUserName(userName);
		user.setTrueName(trueName);
		user.setPassword(password);
		user.setMobile(mobile);
		user.setAddress(address);
		user.setSex(sex);
		//日期格式
		SimpleDateFormat sdf =   new SimpleDateFormat("yyyy-MM-dd");
		Date birthdate = sdf.parse(birthday); 
		user.setBirthday(birthdate);
		user.setDentityCode(dentityCode);
		user.setEmail(email);
		//接收dao层添加方法传回的信息
		UserService userService = new UserService();
		ResultInfo<User> registresult = userService.register(user);
		//判断是否注册成功
		if(registresult.getCode()==1) {
			//给前台传输一个信息
			try {
				resp.getWriter().write("1");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			//给前台传输一个信息
			try {
				resp.getWriter().write("0");
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
	}
	/**
	 * 查询和搜索列表
	 * @param req
	 * @param resp
	 * @throws IOException 
	 */
	private void queryAccountListByserch(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// 获取参数
		String name = req.getParameter("name");
		String sex = req.getParameter("sex");
		String birthday = req.getParameter("birthday");
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
			ssql+=" and userName like ?";
			ssqllist+=" and userName like ?";
		}
		if(StringUtil.isNotEmpty(sex)) {
			params.add(sex);
			ssql+=" and sex = ?";
			ssqllist+=" and sex = ?";
		}
		if(StringUtil.isNotEmpty(birthday)) {
			params.add(birthday);
			ssql+=" and birthday >= ?";
			ssqllist+=" and birthday >= ?";
		}
		//接收dao层数据库查询的数据
		Map<String,Object> map = new HashMap<>();
		map=accountDao.addaccount(ssql,ssqllist,params,index,pageSize,name);
		// 将Map转换为json并响应给前台
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String json = gson.toJson(map);
		resp.getWriter().write(json);
	}

}
