<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品分类</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<!-- 盒模型   -->
<div id="header" class="wrap">
<!-- 动态导入 -->
	<jsp:include page="common/top.jsp" />
</div>

<div id="main" class="wrap">
	<div class="lefter">
		<jsp:include page="common/left.jsp"/>
	</div>
	<!-- 这个是今日特价的 start -->
	<div class="main">
		<div class="price-off">
		<h2>今日特价</h2>
		<ul class="product clearfix">
			<c:forEach items ="${specialPriceProductList}" var="spProduct">
				<li>
					<dl>
						<dt>
							<a href="productServlet?oper=addCard&productId=${spProduct.id}"
								><img src="${spProduct.proPic }"/>
							</a>
						</dt>
						<dd class="title">
							<a  href="productServlet?oper=addCard&productId=${spProduct.id}"
							  >${spProduct.name} </a>
							 </a>
						</dd>
					<dd class="price">￥${spProduct.price}</dd>
					</dl>
				</li>
			</c:forEach>
		</ul>
		</div>
	<!-- 这个是今日特价的 end -->
	<div class="side">
		<div class="news-list">
			<h4>最新公告 </h4>
			<ul>
				<c:forEach items="${noticeList}" var="notice">
					<li>
						<a href="noticeServlet?noticeId=${notice.id }">${notice.title}</a>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="spacer"></div>
		<div class="news-list">
			<h4>新闻动态 </h4>
			<ul>
				<c:forEach items="${newsList}" var="news">
					<li>
						<a href="newsServlet?newsId=${news.id }">${news.title}</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="spacer clear"></div>
	<!--热卖推荐  -->
	<div class="hot">
		<h2>特卖推荐</h2>
		<ul class="product clearfix">
			<c:forEach items="${hotProductList}" var="hProduct">
				<li>
					<dl >
						<dt>
							<a href="productServlet?oper=addCard&productId=${hProduct.id}" >
							<img  src="${hProduct.proPic}"/></a>
						</dt>
						<dd class="title">
							<a href="productServlet?oper=addCard&productId=${hProduct.id}">
							${hProduct.name}</a>
						</dd>
						<dd class="price">￥${hProduct.price}</dd>
					</dl>
				</li>
			</c:forEach>
		</ul>
	</div>
	</div>
	<div class="clear"></div>
</div>
<!-- footer -->
<div id="footer">
	<jsp:include page="common/footer.jsp" />
</div>
</body>
</html>