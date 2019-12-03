<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告详情页面</title>
</head>
<body>
	<div id="noticeDetails" style="margin-left: 200px;">
		<!--  从域对象中获取指定公告的详情 -->
		<h3>${notice.title }</h3>
		<div class="content">${notice.content } </div>
	</div>
</body>
</html>