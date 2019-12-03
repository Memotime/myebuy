<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="header" class="wrap">
	<jsp:include page="common/top.jsp"/>
</div>
<div id="register" class="wrap">
	<div class="shadow">
		<em class="corner lb"></em>
		<em class="corner rt"></em>
		<div class="box">
			<h1>欢迎注册易买网</h1>
			<ul class="steps clearfix">
				<li class="current"><em></em>填写注册信息</li>
				<li class="last"><em></em>注册成功</li>
			</ul>													<!-- onsubmit:点击事件  -->
			<form id="regForm" method="post" action="user?actionName=register" onsubmit="return checkForm()">
				<table>				
					<tr>
						<td class="field">用户名(*)：</td>
						<td><input class="text" type="text" id="userName" name="userName" value="${registresult.result.userName }" onblur="checkUserName()" />&nbsp;<font id="userErrorInfo" color="red"></font></td>
					</tr>
					<tr>
						<td class="field">登录密码(*)：</td>
						<td><input class="text"  type="password" id="password" name="password" value="${registresult.result.password }"  /></td>
					</tr>
					<tr>
						<td class="field">确认密码(*)：</td>
						<td><input class="text" type="password"  id="rePassWord"  name="rePassWord" /></td>
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
							<input  type="date"  id="birthday"  name="birthday" value="${registresult.result.birthday }" class="Wdate" />	
						</td> 
					</tr>
					<tr>
						<td class="field">身份证号：</td>
						<td><input class="text" type="text" id="dentityCode" name="dentityCode" value="${registresult.result.dentityCode }" /></td>
					</tr>
					<tr>
						<td class="field">Email：</td>
						<td><input class="text" type="text" id="email" name="email" value="${registresult.result.email }"  /></td>
					</tr>
					<tr>
						<td class="field">手机号码(*)：</td>
						<td><input class="text" type="text" id="mobile" name="mobile" value="${registresult.result.mobile }" /></td>
					</tr>
					<tr>
						<td class="field">收货地址(*)：</td>
						<td><input class="text" type="text" id="address" name="address" value="${registresult.result.address }" /></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-green"><input type="submit" name="submit" onclick ="return checkForm();" value="提交注册" /></label></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><font id="error" color="red">${registresult.msg }</font> </td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>

<div id="footer">
	<jsp:include page="common/footer.jsp"/>
</div>
<script type="text/javascript" src="js/jquery-1.11.1.js""></script>
<script type="text/javascript" src="js/register.js"></script>
</body>
</html>