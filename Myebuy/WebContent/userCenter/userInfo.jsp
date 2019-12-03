<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
	<h2>用户管理</h2>
	<div class="manage">
		<table class="list">
			<tr>
				<th>ID</th>
				<th>姓名</th>
				<th>性别</th>
				<th>Email</th>
				<th>手机</th>
				<th>操作</th>
			</tr>
			<tr>
				<td class="first w4 c">${user.id }</td>
				<td class="w1 c">${user.trueName}</td>
				<td class="w2 c">${user.sex}</td>
				<td class="c">${user.email}</td>
				<td class="c w4">${currentUser.mobile}</td>
				<td class="w1 c"><a href="user?actionName=userSave">修改</a></td>
			</tr>
		</table>
	</div>
	
</body>
</html>