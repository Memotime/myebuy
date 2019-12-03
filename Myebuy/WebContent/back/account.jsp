<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/commons.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户管理</title>
</head>
<body>
	<!-- 工具栏 -->
	<div id="tb">
		<idv> <a href="javascript:openAddDialog()"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true">添加</a> <a
			href="javascript:openUpdateDialog()" class="easyui-linkbutton"
			data-options="iconCls:'icon-edit',plain:true">修改</a> <a
			href="javascript:openDeletDialog()" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true">删除</a> </idv>
		<div id="serch" style="text-align: center;">
			<div>
				用户ID名称：<input id="Seuname" class="easyui-textbox" /> 
				用户性别：
				<select id="Sesex" class="easyui-combobox" style="width: 160px;"data-options="editable:false">
					<option value="">请选择用户性别</option>
					<option>男</option>
					<option>女</option>
					<option>其他</option>
				</select> 出生日期：
				<input id="Sebirthday" type="text" class="easyui-datebox" data-options="editable:false"></input> 
					<a href="javascript:searchAccount();" class="easyui-linkbutton"
					data-options="iconCls:'icon-search'">查询</a>
			</div>
		</div>
	</div>
	<!-- 增加账户对话框 -->
	<div id="dd" class="easyui-dialog" title="添加账户" style="width:400px;height:400px;"   
        data-options="iconCls:'icon-add',modal:true,closed:true">   
	    <form id="addForm" style="margin-top: 10px">
	    	<table align="center">				
					<tr>
						<td class="field">用户ID(*)：</td>
						<td><input class="text" type="text" id="userName" name="userName" /></td>
					</tr>
					<tr>
						<td class="field">登录密码(*)：</td>
						<td><input class="text"  type="password" id="password" name="password"  /></td>
					</tr>
					<tr>
						<td class="field">用户昵称：</td>
						<td><input class="text" type="text" id="trueName" name="userName" /></td>
					</tr>
					<tr>
						<td class="field">性别(*)：</td>
						<td>
					    <input type="radio"   name="sex" value="男" checked="checked"/>男&nbsp;&nbsp;
					    <input type ="radio" name="sex" value="女"/>女					    					    
					    </td>						
					</tr>
					<tr>
						<td class="field">出生日期：</td>
						<td>
							<input  type="date"  id="birthday"  name="birthday" class="Wdate" />	
						</td> 
					</tr>
					<tr>
						<td class="field">身份证号：</td>
						<td><input class="text" type="text" id="dentityCode" name="dentityCode"  /></td>
					</tr>
					<tr>
						<td class="field">Email：</td>
						<td><input class="text" type="text" id="email" name="email"  /></td>
					</tr>
					<tr>
						<td class="field">手机号码(*)：</td>
						<td><input class="text" type="text" id="mobile" name="mobile" /></td>
					</tr>
					<tr>
						<td class="field">收货地址(*)：</td>
						<td><input class="text" type="text" id="address" name="address" /></td>
					</tr>
					<br/>
					<tr>
		    			<td>
		    				<a style="margin-left: 20px" href="javascript:addAccount()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>  
		    			</td>
		    			<td>
		    				<a style="margin-left: 75px" href="javascript:closeaddDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a>  
		    			</td>
		    		</tr>
				</table>
	    </form>
	</div>  
    
    <!-- 	修改对话框 -->
    <div id="ddUp" class="easyui-dialog" title="修改账户" style="width:400px;height:400px;"   
        data-options="iconCls:'icon-add',modal:true,closed:true">   
	    <form id="uploadForm" style="margin-top: 10px">
	    	<input type="hidden" id="uid" name="uid" />
	    	<table align="center">				
					<tr>
						<td class="field">用户ID(*)：</td>
						<td><input class="text" type="text" id="upuserName" name="upuserName" /></td>
					</tr>
					<tr>
						<td class="field">登录密码(*)：</td>
						<td><input class="text"  type="password" id="uppassword" name="uppassword"  /></td>
					</tr>
					<tr>
						<td class="field">用户昵称：</td>
						<td><input class="text" type="text" id="uptrueName" name="uptrueName" /></td>
					</tr>
					<tr>
						<td class="field">性别(*)：</td>
						<td>
					    <input type="radio"   name="upsex" value="男" checked="checked"/>男&nbsp;&nbsp;
					    <input type ="radio" name="upsex" value="女"/>女					    					    
					    </td>						
					</tr>
					<tr>
						<td class="field">出生日期：</td>
						<td>
							<input  type="date"  id="upbirthday"  name="upbirthday"/>	
						</td> 
					</tr>
					<tr>
						<td class="field">身份证号：</td>
						<td><input class="text" type="text" id="updentityCode" name="updentityCode"  /></td>
					</tr>
					<tr>
						<td class="field">Email：</td>
						<td><input class="text" type="text" id="upemail" name="upemail"  /></td>
					</tr>
					<tr>
						<td class="field">手机号码(*)：</td>
						<td><input class="text" type="text" id="upmobile" name="upmobile" /></td>
					</tr>
					<tr>
						<td class="field">收货地址(*)：</td>
						<td><input class="text" type="text" id="upaddress" name="upaddress" /></td>
					</tr>
					<br/>
					<tr>
		    			<td>
		    				<a style="margin-left: 20px" href="javascript:updateAccount()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>  
		    			</td>
		    			<td>
		    				<a style="margin-left: 75px" href="javascript:closeupdateDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a>  
		    			</td>
		    		</tr>
		    	</table>
	    </form>
	</div>  
	<!-- 数据列表 -->
	<table id="accountData" class="easyui-datagrid" style="fit:true"   
        data-options="url:'../account?actionName=queryAccountListByserch',rownumbers:true,toolbar:'#tb',pagination:true,fit:true">   
    <thead>   
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>    
            <th data-options="field:'id',width:'5%'">编号</th>   
            <th data-options="field:'userName',width:'10%'">用户ID</th>  
            <th data-options="field:'trueName',width:'5%'">用户昵称</th>  
            <th data-options="field:'sex',width:'5%'">性别</th>
            <th data-options="field:'birthday',width:'15%'">出生日期</th>
            <th data-options="field:'email',width:'10%'">Email</th>        
            <th data-options="field:'mobile',width:'10%'">手机号码</th>
            <th data-options="field:'dentityCode',width:'20%'">身份证号</th> 
			<th data-options="field:'address',width:'20%'">收货地址</th>        
        </tr>   
    </thead>   
</table>  
<script type="text/javascript" src="/Myebuy/back/js/account.js"></script>
</body>
</html>