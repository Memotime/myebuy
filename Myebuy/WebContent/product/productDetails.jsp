	`<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.11.1.js"> </script>
</head>
<body>
	<div id="product" class="main">
		<h1>${product.name}</h1>
		<div class="infos">
			<div class="thumb ">
				<img class="img" src="${product.proPic}"/>
			</div>
			<div class="buy">
					<br/>
					<p>
						商城价:<span class="price">￥${product.price}</span>
					</p>
					<!-- p 段落标签  p -->
					<p>
						库存:${product.stock}
					</p>
					<br/>
					<div class="button">
						<input type="button" name="button" value="" onclick="goBuy(${product.id})" /><br/>
						<a href="javascript:addShoppingCart(${product.id})">放入购物车</a>
					</div>
					
			</div>
			<div class="clear"></div>
		</div>
		<div class="introduce">
			<h2><strong>商品详情</strong></h2>
			<div class="text">${product.description}</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	
	function addShoppingCart(productId){
		if('${user.userName}' == ''){
			alert("请先登录，然后购物！");
		}else{ 
			//增加购物车购物车记录的数量
			$.ajax({
				type:"post",
				url:"shopping",
				data:{
					"productId":productId,
					"actionName":"addShopping"
				},
				success:function (row){
					//返回商品记录id
					if(row==1){
						alert("已成功加入购物车！");
						location.reload();//重新加载！
					}else{
						alert("添加购物车失败了！");
					}
				}
				
			});
		}
	}
	
	function goBuy(productId){
		if('${user.userName}' == ''){
			alert("请先登录，然后购物！");
			
		}else{
			//增加购物车购物车记录的数量
			$.ajax({
				type:"post",
				url:"shopping",
				data:{
					"productId":productId,
					"actionName":"buy"
				},
				success:function (row){
					//返回受影响行
					if(row==1){
						alert("支付成功，可到个人中心查看订单信息噢！");
						location.reload();//重新加载！
					}else{
						alert("支付失败！");
					}
				}
				
			});
			//window.location.href="shopping?actionName=buy&productId="+productId;
		}
	}
	
</script>

</html>