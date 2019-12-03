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
	<div id="header" class="wrap">
		<jsp:include page="common/top.jsp" />
	</div>
	<!-- 用户的个人信息start -->
		<div id="main" class="wrap">
			<div id="" class="lefter">
				<div class="box">
					<dl>
						<dt>用户管理</dt>
						<dd><a href="userServlet?oper=userCenter">个人信息管理</a></dd>
						<dt>订单管理</dt>
						<dd><a href="order?actionName=list">个人订单管理</a></dd>
					</dl>
				</div>
			</div>
			<div class="main">
				<jsp:include page="${mainPage}" />
			</div>
			<div class="clear"></div>
		</div>
	
	<!-- 用户的个人信息 end-->
	
	<div id="footer">
		<jsp:include page="common/footer.jsp" />
	</div>
</body>
</html>