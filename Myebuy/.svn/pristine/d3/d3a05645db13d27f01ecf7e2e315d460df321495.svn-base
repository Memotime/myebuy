<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="box">
		<h2>商品分类</h2>
		<dl>
			<!--  这个bigTypeList哪里来的？ InitController这个类中的作用域中的key来的！ -->
			<c:forEach items="${bigTypeList}" var="bigType">
				<dt>${bigType.name}</dt>
				<!-- 获取小类目中的内容 -->
				<c:forEach items="${bigType.smallTypeList}" var="smallType">
					<dd>
						<a href="productServlet?oper=smallType&id=${smallType.id}">${smallType.name}</a>
					</dd>
				</c:forEach>
			</c:forEach>
		</dl>
	</div>
	<div class="spacer"></div>
	
	
	<!-- 最近浏览的内容 -->
	<div class="last-view">
		<h2>最近浏览</h2>
		<dl class="clearfix">
			<c:forEach items="${currentBrowseProduct}" var="cbp">
					<dt>		
						<a href="productServlet?oper=addCard&productId=${cbp.id }">
						<img src="${cbp.proPic}" class="imgs"></img>
						</a>
					</dt>
					<dd>
						<a href="productServlet?oper=addCard&productId=${cbp.id }">${cbp.name}</a>
					</dd>
			</c:forEach>
		</dl>
	</div>
</body>
</html>