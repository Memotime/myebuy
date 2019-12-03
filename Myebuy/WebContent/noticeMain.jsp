<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告页面</title>
</head>
<body>
	<!--  top begin -->
	<div id="header" class="wrap">
		<!--  动态包含top.jsp -->
		<jsp:include page="common/top.jsp"></jsp:include>
	</div>
	<!--  top end -->
	
	<!--  main begin -->
	<div id="main" class="wrap">
		<div class="lefter">
			<!--  动态包含lefter.jsp -->
			<jsp:include page="common/left.jsp"></jsp:include>
		</div>
			<jsp:include page="${mainPage }"></jsp:include>
			<div class="spear clear"></div>
	</div>
	<!--  main end -->
	
	<!--  footer begin -->
	<div id="footer">
		<!--  动态包footer.jsp -->
		<jsp:include page="common/footer.jsp"></jsp:include>
	</div>
	<!--  footer end -->
</body>
</html>