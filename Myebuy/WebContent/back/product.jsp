<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/commons.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品管理</title>
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
				商品名称：<input id="Sname" class="easyui-textbox" /> 
				商品类型：
				<select id="Sbigtype" class="easyui-combobox" style="width: 160px;"data-options="editable:false">	
				</select> 
				<select id="Ssmalltype" class="easyui-combobox" style="width: 160px;"data-options="editable:false">	
				</select>
				价格：
				<input id="Sprice" type="text" class="easyui-textbox"/>
					<a href="javascript:searchProduct();" class="easyui-linkbutton"
					data-options="iconCls:'icon-search'">查询</a>
			</div>
		</div>
	</div>
	<!-- 增加账户对话框 -->
	<div id="dd" class="easyui-dialog" title="添加商品" style="width:400px;height:500px;"   
        data-options="iconCls:'icon-add',modal:true,closed:true">   
	    <form id="addForm" enctype="multipart/form-data"  style="margin-top: 10px;position: absolute;left: 50px;">
			<table align="center">
				<tr>
					<td class="field">商品名称：</td>
					<td><input class="text" type="text" id="addname" name="addname" /></td>
				</tr>
				<tr>
					<td class="field">商品描述：</td>
					<td><input class="text" type="text" id="adddescription"
						name="adddescription" /></td>
				</tr>
				<tr>
					<td>是否设置特卖推荐：</td>
					<td><select id="addhot" class="easyui-combobox"
						style="width: 160px;" data-options="editable:false">
							<option value="1">是</option>
							<option value="0">否</option>
					</select></td>
				</tr>
				<tr>
					<td class="field">特卖时间：</td>
					<td><input type="date" id="addhotTime" name="addhotTime"
						class="Wdate" /></td>
				</tr>
				<tr>
					<td class="field">价格：</td>
					<td><input class="text" type="text" id="addprice" name="addprice" /></td>
				</tr>
				<tr>
					<td class="field">选择图片：</td>
					<td><input type="file" id="addproPic" name="addproPic"
						accept="image/gif, image/jpeg, image/png, image/jpg" /></td>
				</tr>
				<tr>
					<td>是否设置今日特价：</td>
					<td><select id="addspecialPrice" class="easyui-combobox"
						style="width: 160px;" data-options="editable:false">
							<option value="1">是</option>
							<option value="0">否</option>
					</select></td>
				</tr>
				<tr>
					<td class="field">特价时间：</td>
					<td><input type="date" id="addspecialPriceTime" name="addspecialPriceTime"
						class="Wdate" /></td>
				</tr>
				<tr>
					<td class="field">库存：</td>
					<td><input class="text" type="text" id="addstock" name="addstock" /></td>
				</tr>
				<tr>
					<td>所属大类型：</td>
					<td><select id="addbigTypeId" class="easyui-combobox"
						style="width: 160px;" data-options="editable:false">
					</select></td>
				</tr>
				<tr>
					<td>所属小类型：</td>
					<td><select id="addsmallTypeId" class="easyui-combobox"
						style="width: 160px;" data-options="editable:false">
					</select></td>
				</tr>
				<br />
				<tr>
					<td><a style="margin-left: 20px"
						href="javascript:addProduct()" class="easyui-linkbutton"
						data-options="iconCls:'icon-save'">保存</a></td>
					<td><a style="margin-left: 75px"
						href="javascript:closeAddDialog()" class="easyui-linkbutton"
						data-options="iconCls:'icon-cancel'">取消</a></td>
				</tr>
			</table>
		</form>
	</div>  
    
    <!-- 	修改对话框 -->
    <div id="ddUp" class="easyui-dialog" title="修改账户" style="width:400px;height:500px;"   
        data-options="iconCls:'icon-add',modal:true,closed:true">   
	    <form id="uploadForm" enctype="multipart/form-data"  style="margin-top: 10px;position: absolute;left: 50px;">
	    	<input type="hidden" id="pid" name="pid" />
	    	<table align="center">
				<tr>
					<td class="field">商品名称：</td>
					<td><input class="text" type="text" id="upname" name="upname" /></td>
				</tr>
				<tr>
					<td class="field">商品描述：</td>
					<td><input class="text" type="text" id="updescription"
						name="updescription" /></td>
				</tr>
				<tr>
					<td>是否设置特卖推荐：</td>
					<td><select id="uphot" name="uphot" class="easyui-combobox"
						style="width: 160px;" data-options="editable:false">
							<option value="1">是</option>
							<option value="0">否</option>
					</select></td>
				</tr>
				<tr>
					<td class="field">特卖时间：</td>
					<td><input type="date" id="uphotTime" name="uphotTime"
						class="Wdate" /></td>
				</tr>
				<tr>
					<td class="field">价格：</td>
					<td><input class="text" type="text" id="upprice" name="upprice" /></td>
				</tr>
				<tr>
					<td class="field">选择图片：</td>
					<td><input type="file" id="upproPic" name="upproPic"
						accept="image/gif, image/jpeg, image/png, image/jpg" /></td>
				</tr>
				<tr>
					<td>是否设置今日特价：</td>
					<td><select id="upspecialPrice" name="upspecialPrice" class="easyui-combobox"
						style="width: 160px;" data-options="editable:false">
							<option value="1">是</option>
							<option value="0">否</option>
					</select></td>
				</tr>
				<tr>
					<td class="field">特价时间：</td>
					<td><input type="date" id="upspecialPriceTime" name="upspecialPriceTime"
						class="Wdate" /></td>
				</tr>
				<tr>
					<td class="field">库存：</td>
					<td><input class="text" type="text" id="upstock" name="upstock" /></td>
				</tr>
				<tr>
					<td>所属大类型：</td>
					<td><select id="upbigTypeId" name="upbigTypeId" class="easyui-combobox"
						style="width: 160px;" data-options="editable:false">
					</select></td>
				</tr>
				<tr>
					<td>所属小类型：</td>
					<td><select id="upsmallTypeId" name="upsmallTypeId" class="easyui-combobox"
						style="width: 160px;" data-options="editable:false">
					</select></td>
				</tr>
				<br />
				<tr>
					<td><a style="margin-left: 20px"
						href="javascript:upProduct()" class="easyui-linkbutton"
						data-options="iconCls:'icon-save'">保存</a></td>
					<td><a style="margin-left: 75px"
						href="javascript:closeuploadDialog()" class="easyui-linkbutton"
						data-options="iconCls:'icon-cancel'">取消</a></td>
				</tr>
			</table>
	    </form>
	</div>  
	<!-- 数据列表 -->
	<table id="productData" class="easyui-datagrid" style="fit:true"   
        data-options="url:'../backproduct?actionName=queryAccountListByserch',rownumbers:true,toolbar:'#tb',pagination:true,fit:true">   
    <thead>   
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>    
            <th data-options="field:'id',width:'5%'">编号</th>   
            <th data-options="field:'description',width:'20%'">商品描述</th>  
            <th data-options="field:'name',width:'20%'">商品名称</th>  
            <th data-options="field:'hot',width:'5%'">是否为热卖</th>
            <th data-options="field:'hotTime',width:'15%'">热卖时间</th>
            <th data-options="field:'price',width:'5%'">价格</th>        
            <th data-options="field:'specialPrice',width:'5%'">是否特价商品</th>
			<th data-options="field:'specialPriceTime',width:'15%'">特价时间</th> 
			<th data-options="field:'stock',width:'5%'">库存</th> 
			<th data-options="field:'smallName',width:'5%'">所属类型</th>        
        </tr>   
    </thead>   
</table>  
<script type="text/javascript" src="/Myebuy/back/js/product.js"></script>
</body>
</html>