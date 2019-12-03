<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/commons.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ebuy后台</title> 
</head>
<body class="easyui-layout">   
    <div data-options="region:'north'" style="height:100px;background-image: url('/Myebuy/images/logo.gif'); background-repeat: no-repeat;">
   		<a href="/Myebuy/backindex.jsp" style="text-decoration: none;position: absolute;bottom: 20px;font-size: 12px">ebuy后台管理系统</a>
   		<div style="margin-top: 75px;margin-left: 90px;font-size: 13px">
    		<span style="float: right;margin-right: 20px;font-size: 17px">当前登录用户：<b>${user.userName }</b>
    		&nbsp;&nbsp;&nbsp;&nbsp;
    		<a href="/Myebuy/user?actionName=logout">注销</a></span>
    	</div> 
   </div>   
    <div data-options="region:'south'" style="height:50px;text-align: center;color: blue;">
    	Copyright &copy; 2019 杭州码歌教育 All Rights Reserved.
		http://www.pxcoder.com
    </div>
  <!--   菜单栏   -->
	<div data-options="region:'west',title:'菜单列表'" style="width: 180px;">
		<div class="easyui-accordion" style="width:100%;height:100%;">   
		    <div title="用户管理" data-options="iconCls:'icon-man'" style="overflow:auto;padding:10px;">  
		    	<a href="javascript:openTab('账号管理','icon-fwgl','/Myebuy/back/account.jsp')" class="easyui-linkbutton" data-options="iconCls:'icon-fwgl',plain:true">账号管理</a> 
		    	<a href="javascript:openTab('商品管理','icon-yxjhgl','/Myebuy/back/product.jsp')" class="easyui-linkbutton" data-options="iconCls:'icon-lsdd',plain:true">商品管理</a>
		    	<a href="javascript:openTab('类型管理','icon-yxjhgl','/Myebuy/back/type.jsp')" class="easyui-linkbutton" data-options="iconCls:'icon-fwcl',plain:true">类型管理</a>
		    	<a href="javascript:openTab('报表管理','icon-tjbb','/Myebuy/back/echarts.jsp')" class="easyui-linkbutton" data-options="iconCls:'icon-tjbb',plain:true">报表管理</a> 
		    </div>   
		    <div title="系统管理" data-options="iconCls:'icon-item'" style="padding:10px;">   
		    	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-item',plain:true">系统设置</a>
		    </div>   
    	</div> 

	</div>
	<!--   中间主体框   -->
    <div data-options="region:'center'" style="padding:5px;background:#eee;">
    	<div id="tabs" class="easyui-tabs" data-options="fit:true">   
		    <div title="主页" iconCls='icon-home' style="padding:20px;text-align: center;" > 
		    	<h2>欢迎来到易购商城后台系统</h2> 
		    	<a href="index.jsp">返回商城首页</a>     
		    </div>   
		</div>  
    </div> 
</body>  
<script type="text/javascript" src="back/js/backindex.js"></script>
</html>