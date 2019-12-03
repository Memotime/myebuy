package com.mage.po;

import java.util.Date;

//商品实体类
public class Product {

	private int id;// id
	private String name;// 商品名称
	private int price;// 价钱
	private int hot;//商品热度
	private Date hotTime;//商品热度时间
	private int stock;//库存
	private String proPic;//商品路劲
	private String description;//商品描述
	private int specialPrice;//特价的
	private Date specialPriceTime;//特价时间
	private int bigTypeid;//所属大类型的
	private int smallTypeid;//所属小类型的
	private String smallName;//所属小类型的名称
	
	public String getSmallName() {
		return smallName;
	}

	public void setSmallName(String smallName) {
		this.smallName = smallName;
	}

	public Product() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getHot() {
		return hot;
	}

	public void setHot(int hot) {
		this.hot = hot;
	}

	public Date getHotTime() {
		return hotTime;
	}

	public void setHotTime(Date hotTime) {
		this.hotTime = hotTime;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getProPic() {
		return proPic;
	}

	public void setProPic(String proPic) {
		this.proPic = proPic;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getSpecialPrice() {
		return specialPrice;
	}

	public void setSpecialPrice(int specialPrice) {
		this.specialPrice = specialPrice;
	}

	public Date getSpecialPriceTime() {
		return specialPriceTime;
	}

	public void setSpecialPriceTime(Date specialPriceTime) {
		this.specialPriceTime = specialPriceTime;
	}

	public int getBigTypeid() {
		return bigTypeid;
	}

	public void setBigTypeid(int bigTypeid) {
		this.bigTypeid = bigTypeid;
	}

	public int getSmallTypeid() {
		return smallTypeid;
	}

	public void setSmallTypeid(int smallTypeid) {
		this.smallTypeid = smallTypeid;
	}
	
	
}
