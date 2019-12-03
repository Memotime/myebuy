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
function closeAddDialog(){
	// 关闭对话框
	$("#dd").dialog("close");
}

/**
 * 给保存按钮绑定点击事件
 */
function addAccount(){
	//接收参数
	var userName = $("#userName").val();
	var password = $("#password").val();
	var trueName = $("#trueName").val();
	var sex = $('input:radio[name="sex"]:checked').val();
	var birthday = $("#birthday").val();
	var dentityCode = $("#dentityCode").val();
	var address = $("#address").val();
	var email = $("#email").val();
	var mobile = $("#mobile").val();
	//非空判断
	if(isEmpty(userName)){
		// 提示用户
		$.messager.alert('添加用户','用户名称不能为空！','warning');
		return;
	}
	if(isEmpty(password)){
		// 提示用户
		$.messager.alert('添加用户','用户密码不能为空！','warning');
		return;
	}
	if(isEmpty(sex)){
		// 提示用户
		$.messager.alert('添加用户','用户性别不能为空！','warning');
		return;
	}
	if(isEmpty(mobile)){
		// 提示用户
		$.messager.alert('添加用户','用户电话号码不能为空！','warning');
		return;
	}
	if(isEmpty(address)){
		// 提示用户
		$.messager.alert('添加用户','用户收货地址不能为空！','warning');
		return;
	}
	//通过ajax将数据提交后台
	$.ajax({
		type:"post",
		url:"../account",
		data:{
			'userName':userName,
			'password':password,
			'sex':sex,
			'trueName':trueName,
			'email':email,
			'mobile':mobile,
			'birthday':birthday,
			'dentityCode':dentityCode,
			'address':address,
			'actionName':'addAccount'
		},
		success:function(result){
			//	回调函数  result
			if(result == 1){
				//	=1成功
				//	提示添加成功
				$.messager.alert('添加用户','添加成功！','info');
				//	刷新数据表格
				$("#accountData").datagrid("reload");
				//	关闭对话框
				closeAddDialog();
			}else{
				//	=0失败
				//	提示添加失败
				$.messager.alert('添加用户','添加失败！','error');
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
	var obj =$("#accountData").datagrid("getSelected");
	console.log(obj);
	if(obj == null){
		// 否：弹出提示框警告用户
		$.messager.alert('修改账户','请至少选中一条记录！','warning');
		return;
	}
	// 填充选中记录中的数据到修改账户对话框中的表单里
	$('#uploadForm').form('load',{
		uid:obj.id,
		upuserName:obj.userName,
		uppassword:obj.password,
		upsex:obj.sex,
		uptrueName:obj.trueName,
		upemail:obj.email,
		upmobile:obj.mobile,
		upbirthday:obj.birthday,
		updentityCode:obj.dentityCode,
		upaddress:obj.address
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
function updateAccount(){
	//获取表单中的数据
	var uid = $("#uid").val();
	var userName = $("#upuserName").val();
	var password = $("#uppassword").val();
	var trueName = $("#uptrueName").val();
	var sex = $('input:radio[name="upsex"]:checked').val();
	var birthday = $("#upbirthday").val();
	var dentityCode = $("#updentityCode").val();
	var address = $("#upaddress").val();
	var email = $("#upemail").val();
	var mobile = $("#upmobile").val();
	//非空判断
	if(isEmpty(userName)){
		// 提示用户
		$.messager.alert('修改用户','用户名称不能为空！','warning');
		return;
	}
	if(isEmpty(password)){
		// 提示用户
		$.messager.alert('修改用户','用户密码不能为空！','warning');
		return;
	}
	if(isEmpty(sex)){
		// 提示用户
		$.messager.alert('修改用户','用户性别不能为空！','warning');
		return;
	}
	if(isEmpty(mobile)){
		// 提示用户
		$.messager.alert('修改用户','用户电话号码不能为空！','warning');
		return;
	}
	if(isEmpty(address)){
		// 提示用户
		$.messager.alert('修改用户','用户收货地址不能为空！','warning');
		return;
	}
	if(isEmpty(birthday)){
		// 提示用户
		$.messager.alert('修改用户','用户生日不能为空！','warning');
		return;
	}
	//通过ajax将数据提交到后台（actionName、accountId）
	$.ajax({
		type:"post",
		url:"../account",
		data:{
			'uid':uid,
			'userName':userName,
			'password':password,
			'sex':sex,
			'trueName':trueName,
			'email':email,
			'mobile':mobile,
			'birthday':birthday,
			'dentityCode':dentityCode,
			'address':address,
			'actionName':'uploadAccount'
		},
		success:function(result){
			// =1 成功 提示成功、刷新数据表格、关闭对话框
			if(result == 1){
				// 提示成功
				$.messager.alert('修改账户','修改成功！','info');
				// 刷新数据表格
				$("#accountData").datagrid("reload");
				// 关闭对话框
				closeUpdateDialog();
			}else{
				// =0 失败 提示失败
				$.messager.alert('修改账户','修改失败！','error');
			}
			
		}
	});
}

/***********************************删除账户 begin******************************/
function openDeletDialog(){
	//判断是否选中记录(使用datagrid的方法：getChecked  在复选框呗选中的时候返回所有行)
	var objs =$("#accountData").datagrid("getChecked");
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
	    		url:"../account",
	    		data:{
	    			'actionName':'deleteAccount',
	    			'ids':ids
	    		},
	    		success:function(result){
				    // =1 成功 提示成功、刷新数据表格
					if(result == 1){
						// 提示成功
						$.messager.alert('删除账户','删除成功！','info');
						// 刷新数据表格
						$("#accountData").datagrid("reload");
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