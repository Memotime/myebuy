/**
 * 给添加按钮绑定点击事件
 */
/*初始化*/
$(function(){
	// 加载所属大类型
	$('#Sbigtype').combobox({    
	    url:'../backproduct?actionName=Sbigtype',  // 设置远程访问的url  
	    valueField:'id',    // 基础数据值名称绑定到该下拉列表框。
	    textField:'name'  // 基础数据字段名称绑定到该下拉列表框。
	}); 
	//加载所属小类型
	$('#Sbigtype').combobox({
		onChange:function(){
			var pid = $("#Sbigtype").combo("getValue");
			//填充支出类型
			$('#Ssmalltype').combobox({    
			    url:'../backproduct?actionName=Ssmalltype&pid='+pid,  // 设置远程访问的url  
			    valueField:'id',    // 基础数据值名称绑定到该下拉列表框。
			    textField:'name',   // 基础数据字段名称绑定到该下拉列表框。
			});
			
		}
	});
});
function openAddDialog(){
	// 重置表单
	$("#addForm").form("reset");
	// 加载所属大类型
	$('#addbigTypeId').combobox({    
	    url:'../backproduct?actionName=Sbigtype',  // 设置远程访问的url  
	    valueField:'id',    // 基础数据值名称绑定到该下拉列表框。
	    textField:'name'  // 基础数据字段名称绑定到该下拉列表框。
	}); 
	//加载所属小类型
	$('#addbigTypeId').combobox({
		onChange:function(){
			var pid = $("#addbigTypeId").combo("getValue");
			//填充支出类型
			$('#addsmallTypeId').combobox({    
			    url:'../backproduct?actionName=Ssmalltype&pid='+pid,  // 设置远程访问的url  
			    valueField:'id',    // 基础数据值名称绑定到该下拉列表框。
			    textField:'name',   // 基础数据字段名称绑定到该下拉列表框。
			});
			
		}
	});
	// 打开对话框
	$("#dd").dialog("open");
}

/**
 * 给取消按钮绑定点击事件
 */
function closeAddDialog(){
	// 关闭对话框
	$("#dd").dialog("close");
}

/**
 * 给保存按钮绑定点击事件
 */
function addProduct(){
	//接收参数
	var name = $("#addname").val();   
	var description = $("#adddescription").val();   
	var hot = $("#addhot").val();
	var hotTime = $("#addhotTime").val();
	var price = $("#addprice").val();
	var proPic = $("#addproPic").val();
	var specialPrice = $("#addspecialPrice").val();
	var specialPriceTime = $("#addspecialPriceTime").val();
	var stock = $("#addstock").val();
	var bigTypeId = $("#addbigTypeId").combo("getValue");
	var smallTypeId = $("#addsmallTypeId").combo("getValue");
	console.log(name+"="+description+"="+hot+"="+specialPrice+"="+bigTypeId+"="+smallTypeId+"="+proPic);
	//非空判断
	if(isEmpty(name)){
		// 提示用户
		$.messager.alert('添加商品','商品名称不能为空！','warning');
		return;
	}
	if(isEmpty(price)){
		// 提示用户
		$.messager.alert('添加商品','商品价格不能为空！','warning');
		return;
	}
	if(isEmpty(proPic)){
		// 提示用户
		$.messager.alert('添加商品','商品图片不能为空！','warning');
		return;
	}
	if(isEmpty(stock)){
		// 提示用户
		$.messager.alert('添加商品','商品库存不能为空！','warning');
		return;
	}
	if(isEmpty(bigTypeId)){
		// 提示用户
		$.messager.alert('添加商品','商品类型不能为空！','warning');
		return;
	}
	//通过ajax将数据提交后台
	$.ajax({
		type:"post",
		url:"../backproduct",
		data:{
			'name':name,
			'description':description,
			'hot':hot,
			'hotTime':hotTime,
			'price':price,
			'proPic':proPic,
			'specialPrice':specialPrice,
			'specialPriceTime':specialPriceTime,
			'stock':stock,
			'bigTypeId':bigTypeId,
			'smallTypeId':smallTypeId,
			'actionName':'addProduct'
		},
		success:function(result){
			//	回调函数  result
			if(result == 1){
				//	=1成功
				//	提示添加成功
				$.messager.alert('添加商品','添加成功！','info');
				//	刷新数据表格
				$("#productData").datagrid("reload");
				//	关闭对话框
				closeAddDialog();
			}else{
				//	=0失败
				//	提示添加失败
				$.messager.alert('添加商品','添加失败！','error');
			}

		}
	});
}
/***********************************修改账户 begin******************************/
/**
 * 给修改按钮绑定点击事件
 */
function openUpdateDialog(){
	// 判断是否有选中的记录
	var obj =$("#productData").datagrid("getSelected");
	console.log(obj);
	if(obj == null){
		// 否：弹出提示框警告用户
		$.messager.alert('修改账户','请至少选中一条记录！','warning');
		return;
	}
	// 加载所属大类型
	$('#upbigTypeId').combobox({    
	    url:'../backproduct?actionName=Sbigtype',  // 设置远程访问的url  
	    valueField:'id',    // 基础数据值名称绑定到该下拉列表框。
	    textField:'name'  // 基础数据字段名称绑定到该下拉列表框。
	}); 
	//加载所属小类型
	$('#upbigTypeId').combobox({
		onChange:function(){
			var pid = $("#upbigTypeId").combo("getValue");
			//填充支出类型
			$('#upsmallTypeId').combobox({    
			    url:'../backproduct?actionName=Ssmalltype&pid='+pid,  // 设置远程访问的url  
			    valueField:'id',    // 基础数据值名称绑定到该下拉列表框。
			    textField:'name',   // 基础数据字段名称绑定到该下拉列表框。
			});
			
		}
	});
	// 填充选中记录中的数据到修改账户对话框中的表单里
	$('#uploadForm').form('load',{
		upname:obj.name,
		updescription:obj.description,
		uphot:obj.hot,
		uphotTime:obj.hotTime,
		upprice:obj.price,
		upspecialPrice:obj.specialPrice,
		upspecialPriceTime:obj.specialPriceTime,
		upstock:obj.stock,
		upbigTypeId:obj.bigTypeid,
		upsmallTypeId:obj.smallTypeid,
		pid:obj.id
	});
	// 打开对话框
	$("#ddUp").dialog("open");
}
/**
 * 关闭修改对话框
 */
function closeuploadDialog(){
	$("#ddUp").dialog("close");
}

/**
 * 保存账户操作
 */
function upProduct(){
	//接收参数
	var pid = $("#pid").val(); 
	console.log("256");
	var name = $("#upname").val();   
	var description = $("#updescription").val();   
	var hot = $("#uphot").val();
	var hotTime = $("#uphotTime").val();
	var price = $("#upprice").val();
	var proPic = $("#upproPic").val();
	var specialPrice = $("#upspecialPrice").val();
	var specialPriceTime = $("#upspecialPriceTime").val();
	var stock = $("#upstock").val();
	var bigTypeId = $("#upbigTypeId").combo("getValue");
	var smallTypeId = $("#upsmallTypeId").combo("getValue");
	console.log(name+"="+description+"="+hot+"="+specialPrice+"="+bigTypeId+"="+smallTypeId+"="+proPic);
	//非空判断
	if(isEmpty(name)){
		// 提示用户
		$.messager.alert('修改商品','商品名称不能为空！','warning');
		return;
	}
	if(isEmpty(price)){
		// 提示用户
		$.messager.alert('修改商品','商品价格不能为空！','warning');
		return;
	}
	if(isEmpty(proPic)){
		// 提示用户
		$.messager.alert('修改商品','商品图片不能为空！','warning');
		return;
	}
	if(isEmpty(stock)){
		// 提示用户
		$.messager.alert('修改商品','商品库存不能为空！','warning');
		return;
	}
	if(isEmpty(bigTypeId)){
		// 提示用户
		$.messager.alert('修改商品','商品类型不能为空！','warning');
		return;
	}
	//通过ajax将数据提交到后台（actionName、accountId）
	$.ajax({
		type:"post",
		url:"../backproduct",
		data:{
			'pid':pid,
			'name':name,
			'description':description,
			'hot':hot,
			'hotTime':hotTime,
			'price':price,
			'proPic':proPic,
			'specialPrice':specialPrice,
			'specialPriceTime':specialPriceTime,
			'stock':stock,
			'bigTypeId':bigTypeId,
			'smallTypeId':smallTypeId,
			'actionName':'uploadProduct'
		},
		success:function(result){
			// =1 成功 提示成功、刷新数据表格、关闭对话框
			if(result == 1){
				// 提示成功
				$.messager.alert('修改商品','修改成功！','info');
				// 刷新数据表格
				$("#productData").datagrid("reload");
				// 关闭对话框
				closeuploadDialog();
			}else{
				// =0 失败 提示失败
				$.messager.alert('修改商品','修改失败！','error');
			}
			
		}
	});
}

/***********************************删除账户 begin******************************/
function openDeletDialog(){
	//判断是否选中记录(使用datagrid的方法：getChecked  在复选框呗选中的时候返回所有行)
	var objs =$("#productData").datagrid("getChecked");
	console.log(objs);
	//未选
	if(objs<0){
		$.messager.alert('删除账户','请择至少一条账户信息','warning');  
		return;
	}
	//获取用户选择的id
	var ids="";
	for(var i in objs){
		if(i==objs.length-1){
			ids+=objs[i].id;
		}else{
			ids+=objs[i].id+","	
		}
	}
	//提醒用户确定删除
	$.messager.confirm('删除账户','您确认想要删除记录吗？',function(r){    
	    if (r){    
	        //向后台提交数据
	    	$.ajax({
	    		type:"post",
	    		url:"../backproduct",
	    		data:{
	    			'actionName':'deleteProduct',
	    			'ids':ids
	    		},
	    		success:function(result){
				    // =1 成功 提示成功、刷新数据表格
					if(result == 1){
						// 提示成功
						$.messager.alert('删除账户','删除成功！','info');
						// 刷新数据表格
						$("#productData").datagrid("reload");
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
function searchProduct(){
	var name=$("#Sname").val();
	var bigtype = $("#Sbigtype").combo("getValue");
	var smalltype = $("#Ssmalltype").combo("getValue");
	var price=$("#Sprice").val();
	console.log(bigtype);
	console.log("1111");
	$('#productData').datagrid('load',{
		'name': name,
		'bigtype': bigtype,
		'smalltype':smalltype,
		'price': price,
		'actionName':'queryAccountListByserch'
	});
	
}