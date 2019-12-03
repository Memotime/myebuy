<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/Myebuy/js/jquery-1.11.1.js"> </script>
</head>
<body>
	<div id="shopping">
		<form action="order?actionName=save" method="post" >
			<table>
				<tr>
					<th style="text-align:center">商品名称</th>
					<th>商品单价</th>
					<th>金额</th>
					<th>购买数量</th>
					<th>操作</th>
				</tr>
				<!-- 展示已添加的商品信息 -->
				<c:forEach items="${shoppingCarProductList}" var="shoppingCarProduct">
					<tr class="productTr">
						<td class="thumb">
							<img  src="${shoppingCarProduct.proPic}"  class="imgs"/>
							<a href="productServlet?oper=addCard&productId=${shoppingCarProduct.productId}">${shoppingCarProduct.proName}</a>
						</td>
						<td class="price"><!-- 单价 -->
<span>￥<label class="price_" id="price_${shoppingCarProduct.id}">${shoppingCarProduct.price}</label> </span>
						</td>
						<td class="price"><!-- 单价*个数= 总价-->
<span>￥<label class="price_sum_" id="price_sum_${shoppingCarProduct.id}">${shoppingCarProduct.price*shoppingCarProduct.num}</label> </span>					
						</td>
						<td class="number"><!-- 商品的数量 操作-->
						
						<input type="hidden" id="productId" value="${shoppingCarProduct.id}"/>
						
						<input type="button" class="min" value=" - "/>
		<input  class="text_box" id="text_box_${shoppingCarProduct.id}" type="text" style="width:30px;text-align:center;" value="${shoppingCarProduct.num}"  disabled="disabled"/>
						<input type="button" class="add" value=" + "/>
						</td>
						<td class="delete">
						<a href="javascript:removeShopping(${shoppingCarProduct.id})">删除</a>
						</td>
					</tr>
				</c:forEach>
				
			</table>
			<!-- 订单内容显示 -->
			<div class="shopping_list_end">
				<ul>
					<li class="shopping_list_end_2">
						￥<lable id="product_total"></lable>
					</li>
					<li class="shopping_list_end_3">商品金额总计:</li>
				</ul>
			</div>
			<div class="button">
				<input type="submit"  value=""/>
			</div>
		</form>
	</div>

	
	<!-- 个人信息的显示 -->
	<div style="background-color:#cddbb8;margin-top:10px;font-size:20px;height:40px;text-align:center;">
		<div style="padding:5px">
			<b>收件人:</b>${user.trueName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b>收货地址:</b>${user.address}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b>联系电话:</b>${user.mobile}
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){  //自动加载
		
		setTotal();//调用计量方法
		
		//商品的总价
		function setTotal(){
			var sub = 0;
			$(".productTr").each(function(){
				
				//获取商品的数量
				var number = $(this).find('input[class=text_box]').val();
				//获取商品的价钱
				var price = $(this).find('label[class=price_]').html();
				//计算  数量*价钱=总价钱
				sub += number * price;
				
			});
			 //把总结显示出去
			$("#product_total").html(sub);
			
		}
		
		
		//对 “ + ”按钮进行操作
		$(".add").click(function(){
			//获取参数
			var productId = $(this).parent().find("#productId").val();
			
			//调用ajax修改购物车记录的数量
			$.ajax({
				type:"post",
				url:"shopping",
				data:{
					"productId":productId,
					"actionName":"addNum"
				},
				success:function (row){
					//返回商品记录id
					if(row==1){
						//修改前台数目显示
						var t = $("#text_box_"+productId);
						t.val(parseInt(t.val())+1);
						
						//修改金额显示
						var price = $("#price_"+productId).html();
						var sum = $("#price_sum_"+productId).html(parseInt(price)*t.val()); 
						
						//调用总价
						setTotal(); 
					}else{
						alert("增加失败");
					}
				}
				
			});
			
		})
		
		//对 “ - ” 按钮进行操作
		$(".min").click(function(){
			
			//获取参数
			var productId = $(this).parent().find("#productId").val();
			var t = $("#text_box_"+productId);
			//判断数量是否大于0
			if(t.val()>1){
				//调用ajax修改购物车记录的数量
				$.ajax({
					type:"post",
					url:"shopping",
					data:{
						"productId":productId,
						"actionName":"minNum"
					},
					success:function (row){
						//返回商品记录id
						if(row==1){
							//修改前台数目显示
							t.val(parseInt(t.val())-1);
							//修改金额显示
							var price = $("#price_"+productId).html();
							var sum = $("#price_sum_"+productId).html(parseInt(price)*t.val()); 
							//调用总价
							setTotal(); 
						}else{
							alert("减少失败");
						}
					}
					
				});
			}
			
			
		})
		
		
	});
	//删除购物车中的订单
	function removeShopping(productId){
		if(confirm("您确定要删除这个商品吗？")){
			$.ajax({
				type:"post",
				url:"shopping",
				data:{
					"productId":productId,
					"actionName":"removeProduct"
				},
				success:function (row){
					//返回商品记录id
					if(row==1){
						location.reload(); 
						alert("删除成功");
					}else{
						alert("删除失败");
					}
				}
				
			});
		}
	}

</script>












</html>