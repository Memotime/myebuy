package com.mage.po;

public class ShoppingCarProduct {
	private Integer id; //购物车产品id
	private Integer shoppingCarId;	//购物车id
	private Integer num;	//加购产品个数
	private Integer productId; //产品id
	private String proName;	//产品名字
	private String proPic;	//产品图片
	private Integer price ;//产品价格
	

	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getProPic() {
		return proPic;
	}
	public void setProPic(String proPic) {
		this.proPic = proPic;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getShoppingCarId() {
		return shoppingCarId;
	}
	public void setShoppingCarId(Integer shoppingCarId) {
		this.shoppingCarId = shoppingCarId;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	

}
