<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	var productId = '${product.id}';
	function addShoppingCart(productId){
		if('${currentUser.userName}' == ''){
			alert("请先登录，然后购物！");
		}else{
			//发送请求位置
			$.post("shopping?oper=addShopping",{productId:productId},
				function(result){
					if(result=="true"){
						alert("已成功加入购物车！");
						location.reload();//重新加载！
					}else{
						alert("添加购物车失败了！");
					}
				}		
			);
		}
	}
	
	function goBuy(productId){
		if('${currentUser.userName}' == ''){
			alert("请先登录，然后购物！");
			
		}else{
			window.location.href="shopping?oper=buy&productId="+productId;
		}
	}
	
</script>

</html>