<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/commons.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>类型管理</title>
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
				类型名称：<input id="tname" class="easyui-textbox" /> 
				所属类型：
				<select id="btype" class="easyui-combobox" style="width: 160px;"data-options="editable:false">	
				</select>
					<a href="javascript:searchAccount();" class="easyui-linkbutton"
					data-options="iconCls:'icon-search'">查询</a>
			</div>
		</div>
	</div>
	<!-- 增加账户对话框 -->
	<div id="dd" class="easyui-dialog" title="添加类型" style="width:400px;height:400px;"   
        data-options="iconCls:'icon-add',modal:true,closed:true">   
	    <form id="addForm" style="margin-top: 10px">
	    	<table align="center">				
					<tr>
						<td class="field">类型名称：</td>
						<td><input class="text" type="text" id="addtname" name="addtname" /></td>
					</tr>
					<tr>
						<td class="field">所属类型：</td>
						<td>
							<select id="addtype" class="easyui-combobox" style="width: 160px;"data-options="editable:false">	
							</select>
						</td>
					</tr>
					<tr>
						<td class="field">备注：</td>
						<td><input class="text" type="text" id="addremarks" name="addremarks" /></td>
					</tr>
					<tr>
						<td class="field">注意(*)</td>
						<td>所属类型若是未填，默认为添加大类型</td>
					</tr>
					<tr>
		    			<td>
		    				<a style="margin-left: 20px" href="javascript:addType()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>  
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
					<td class="field">类型名称：</td>
					<td><input class="text" type="text" id="uptname"
						name="uptname" /></td>
				</tr>
				<tr>
					<td class="field">所属类型：</td>
					<td><select id="uptype" name="uptype" class="easyui-combobox"
						style="width: 160px;" data-options="editable:false">
					</select></td>
				</tr>
				<tr>
					<td class="field">备注：</td>
					<td><input class="text" type="text" id="upremarks"
						name="upremarks" /></td>
				</tr>
				<tr>
					<td><a style="margin-left: 20px" href="javascript:upType()"
						class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
					</td>
					<td><a style="margin-left: 75px"
						href="javascript:closeaddDialog()" class="easyui-linkbutton"
						data-options="iconCls:'icon-cancel'">取消</a></td>
				</tr>
			</table>
		</form>
	</div>  
	<!-- 数据列表 -->
	<table id="typeData" class="easyui-datagrid" style="fit:true"   
        data-options="url:'../type?actionName=queryAccountListByserch',rownumbers:true,toolbar:'#tb',pagination:true,fit:true">   
    <thead>   
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>    
            <th data-options="field:'id',width:'10%'">编号</th>   
            <th data-options="field:'name',width:'10%'">类型名称</th>  
            <th data-options="field:'remarks',width:'10%'">备注</th> 
            <th data-options="field:'bigTypeId',width:'10%'">所属大类id</th>  
            <th data-options="field:'bigname',width:'10%'">所属大类</th>   
        </tr>   
    </thead>   
</table>  
<script type="text/javascript" src="/Myebuy/back/js/type.js"></script>
</body>
</html>