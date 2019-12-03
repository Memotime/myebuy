<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
 <h2>订单管理</h2>
		<div class="manage">
			<div class="spacer"></div>
				<table class="list">
					<c:forEach items="${orderList}" var="order" >
						
						<tr>
							<th colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								单号：${order.orderNo }
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								下单时间：<fmt:formatDate value="${order.createTime }" type="date" pattern="yyyy-MM-dd"/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								状态：
								<c:choose>
									<c:when test="${order.status==1 }">待审核</c:when>
									<c:when test="${order.status==2 }">待发货</c:when>
								</c:choose>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								总金额：${order.cost}&nbsp;(元)
							</th>
						</tr>
						
						<tr>
								<td style="text-align:center">商品名称</td>
								<td>商品单价</td>
								<td>购买数量</td>
								<td>小计</td>
								
						</tr>
						<c:forEach items="${order.orderProductList}" var="orderProduct" >
							
							<tr>
								<td width="50%">
									<a href="productServlet?oper=addCard&productId=${orderProduct.productId }">
									<img width="72" height="72" src="${orderProduct.proPic }"></a>
									&nbsp;&nbsp;
									<a href="productServlet?oper=addCard&productId=${orderProduct.productId }">
									${orderProduct.proName}</a>
								</td>
								<td width="20%">
									&nbsp;&nbsp;
									${orderProduct.price}
								</td>
								<td width="20%">
									&nbsp;&nbsp;
									${orderProduct.num}
								</td>
								<td>
									
									${orderProduct.num * orderProduct.price}&nbsp;(元)
								</td>
							</tr>
						</c:forEach>
						<tr class="hid">
							<td colspan="4">
								<div style="height:20px;">&nbsp;</div>
							</td>
						</tr>
						
					</c:forEach>
				</table>
		</div> 
</body>
</html>