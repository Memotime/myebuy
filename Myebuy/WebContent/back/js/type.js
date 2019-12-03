$(function(){
	// 加载所属大类型
	$('#btype').combobox({    
	    url:'../backproduct?actionName=Sbigtype',  // 设置远程访问的url  
	    valueField:'id',    // 基础数据值名称绑定到该下拉列表框。
	    textField:'name'  // 基础数据字段名称绑定到该下拉列表框。
	}); 
	// 加载添加所属大类型
	$('#addtype').combobox({    
	    url:'../backproduct?actionName=Sbigtype',  // 设置远程访问的url  
	    valueField:'id',    // 基础数据值名称绑定到该下拉列表框。
	    textField:'name'  // 基础数据字段名称绑定到该下拉列表框。
	}); 
	// 加载修改所属大类型
	$('#uptype').combobox({    
	    url:'../backproduct?actionName=Sbigtype',  // 设置远程访问的url  
	    valueField:'id',    // 基础数据值名称绑定到该下拉列表框。
	    textField:'name'  // 基础数据字段名称绑定到该下拉列表框。
	}); 
});
/**
 * 给添加按钮绑定点击事件
 */
function openAddDialog(){
	// 重置表单
	$("#addForm").form("reset");
	
	// 打开对话框
	$("#dd").dialog("open");
	
}

/**
 * 给取消按钮绑定点击事件
 */
function closeaddDialog(){
	// 关闭对话框
	$("#dd").dialog("close");
}

/**
 * 给保存按钮绑定点击事件
 */
function addType(){
	//接收参数
	var name = $("#addtname").val();
	var bigtype = $("#addtype").combo("getValue");
	var remarks = $("#addremarks").val();
	//非空判断
	if(isEmpty(name)){
		// 提示用户
		$.messager.alert('添加类型','类型名称不能为空！','warning');
		return;
	}
	//通过ajax将数据提交后台
	$.ajax({
		type:"post",
		url:"../type",
		data:{
			'name':name,
			'bigtype':bigtype,
			'remarks':remarks,
			'actionName':'addType'
		},
		success:function(result){
			//	回调函数  result
			if(result == 1){
				//	=1成功
				//	提示添加成功
				$.messager.alert('添加类型','添加成功！','info');
				//	刷新数据表格
				$("#typeData").datagrid("reload");
				//	关闭对话框
				closeaddDialog();
			}else{
				//	=0失败
				//	提示添加失败
				$.messager.alert('添加类型','添加失败！','error');
			}

		}
	});
}
/***********************************修改类型 begin******************************/
/**
 * 给修改按钮绑定点击事件
 */
function openUpdateDialog(){
	// 判断是否有选中的记录
	var obj =$("#typeData").datagrid("getSelected");
	console.log(obj);
	if(obj == null){
		// 否：弹出提示框警告用户
		$.messager.alert('修改账户','请至少选中一条记录！','warning');
		return;
	}
	// 填充选中记录中的数据到修改账户对话框中的表单里
	$('#uploadForm').form('load',{
		uptname:obj.name,
		upremarks:obj.remarks,
		uptype:obj.bigTypeId,
		uid:obj.id
	});
	// 打开对话框
	$("#ddUp").dialog("open");
}
/**
 * 关闭修改对话框
 */
function closeupdateDialog(){
	$("#ddUp").dialog("close");
}

/**
 * 保存账户操作
 */
function upType(){
	//获取表单中的数据
	var uid = $("#uid").val();
	var name = $("#uptname").val();
	var remarks = $("#upremarks").val();
	var bigtype = $("#uptype").combo("getValue");
	//非空判断
	if(isEmpty(name)){
		// 提示用户
		$.messager.alert('修改类型','用户名称不能为空！','warning');
		return;
	}
	if(isEmpty(bigtype)){
		// 提示用户
		$.messager.alert('修改类型','所属类型不能为空！','warning');
		return;
	}
	//通过ajax将数据提交到后台（actionName、accountId）
	$.ajax({
		type:"post",
		url:"../type",
		data:{
			'uid':uid,
			'name':name,
			'remarks':remarks,
			'bigtype':bigtype,
			'actionName':'uploadType'
		},
		success:function(result){
			// =1 成功 提示成功、刷新数据表格、关闭对话框
			if(result == 1){
				// 提示成功
				$.messager.alert('修改类型','修改成功！','info');
				// 刷新数据表格
				$("#typeData").datagrid("reload");
				// 关闭对话框
				closeUpdateDialog();
			}else{
				// =0 失败 提示失败
				$.messager.alert('修改类型','修改失败！','error');
			}
			
		}
	});
}

/***********************************删除账户 begin******************************/
function openDeletDialog(){
	//判断是否选中记录(使用datagrid的方法：getChecked  在复选框呗选中的时候返回所有行)
	var objs =$("#typeData").datagrid("getChecked");
	console.log(objs);
	//未选
	if(objs<1){
		$.messager.alert('删除账户','请择至少一条账户信息','warning');  
		return;
	}
	//获取用户选择的id
	var ids="";
	var bigTypeId="";
	for(var i in objs){
		if(i==objs.length-1){
			ids+=objs[i].id;
			bigTypeId+=objs[i].bigTypeId;
		}else{
			ids+=objs[i].id+",";
			bigTypeId+=objs[i].bigTypeId+",";
		}
	}
	//提醒用户确定删除
	$.messager.confirm('删除账户','您确认想要删除记录吗？',function(r){    
	    if (r){    
	        //向后台提交数据
	    	$.ajax({
	    		type:"post",
	    		url:"../type",
	    		data:{
	    			'actionName':'deleteType',
	    			'ids':ids,
	    			'bigTypeId':bigTypeId
	    		},
	    		success:function(result){
				    // =1 成功 提示成功、刷新数据表格
					if(result == 1){
						// 提示成功
						$.messager.alert('删除账户','删除成功！','info');
						// 刷新数据表格
						$("#typeData").datagrid("reload");
					}else{
						// =0 失败 提示失败
						$.messager.alert('删除账户','删除失败！','error');
					}
					
				}
	    	});
	    }    
	});  
}
/***********************************账户信息查询 begin******************************/
function searchAccount(){
	var name=$("#Seuname").val();
	var sex=$("#Sesex").val();
	var birthday=$("#Sebirthday").val();
	$('#accountData').datagrid('load',{
		'name': name,
		'sex': sex,
		'birthday': birthday,
		'actionName':'queryAccountListByserch'
	});
	
}