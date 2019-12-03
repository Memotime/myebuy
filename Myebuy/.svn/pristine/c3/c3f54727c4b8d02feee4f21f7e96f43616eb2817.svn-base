<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="/Myebuy/js/jquery-1.11.1.js"></script>
</head>
<body>
	<h2>修改用户</h2>
	<div class="manage">
		<form action="user?actionName=updateuser" method="post" onsubmit="return checkForm()">
			
			<table class="form">
				<tr>
					<td class="field">用户名:</td>
					<td><input type="text" class="text" name="userName"
						value="${user.userName}" readonly="readonly" /></td>
				</tr>
				<tr>
					<td class="field">姓名</td>
					<td><input type="text" class="text" id="trueName"
						name="trueName" value="${user.trueName}" /></td>
				</tr>
				<tr>
					<td class="field">密码</td>
					<td><input type="text" class="text" id="password"
						name="password" value="${user.password}" /></td>
				</tr>
				<tr>
					<td class="field">性别</td>
					<td>
						<input type="radio" name="sex" value="男" ${user.sex=='男'? 'checked':'' }/>男
						<input type="radio" name="sex" value="女" ${user.sex=='女'? 'checked':'' }/>女
					</td>
				</tr>
				<tr>
					<td class="field">出生日期</td>
					<td><input type="text" id="birthday" name="birthday"
						class="Wdate"
						value="<fmt:formatDate value="${user.birthday}" type="date" pattern="yyyy-MM-dd "/>"
						onClick="WdatePicker()" /></td>
				</tr>
				<tr>
					<td class="field">手机号码</td>
					<td><input type="text" id="mobile" class="text" name="mobile"
						value="${user.mobile}" /></td>
				</tr>
				<tr>
					<td class="field">送货地址</td>
					<td><input type="text" id="address" class="text"
						name="address" value="${user.address}" /></td>
				</tr>
				<tr>
					<td class="field">身份证号</td>
					<td><input type="text" id="dentityCode" class="text"
						name="dentityCode" value="${user.dentityCode}" /></td>
				</tr>
				<tr>
					<td class="field">Email</td>
					<td><input type="text" id="email" class="text" name="email"
						value="${user.email}" /></td>
				</tr>
				<tr>
					<td><input type="hidden" name="uid" value="${user.id}" />
						<input type="hidden" name="ustatus" value="${user.status}" />
					</td>
					<td><label class="ui-blue"><input type="submit"
							name="submit" value="更新" /></label></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><font id="error" color="red">${result.msg}</font></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
//验证
	function checkForm() {
		var trueName = $("#trueName").val();
		//alert(trueName);
		var password = $("#password").val();
		var birthday = $("#birthday").val();
		var mobile = $("#mobile").val();
		var address = $("#address").val();
		var dentityCode = $("#dentityCode").val();
		var email = $("#email").val();
		if( trueName == ""){
			$("#error").html("姓名不能为空");
			return false;//不会提交form表单！
		}
		if( password ==""){
			$("#error").html("密码不能为空");
			return false;
		}
		if( birthday ==""){
			$("#error").html("出生日期不能为空");
			return false;
		}
		if(mobile ==""){
			$("#error").html("手机号码不能为空");
			return false;
		}
		if( address==""){
			$("#error").html("地址不能为空");
			return false;
		}
		if( dentityCode==""){
			$("#error").html("身份证不能为空");
			return false;
		}
		if( email==""){
			$("#error").html("邮箱不能为空");
			return false;
		}
		return true;
		
	}
</script>

</html>