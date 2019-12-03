package com.mage.po;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;



public class Order {
	private Integer id;//订单编号
	private Integer cost;//总金额
	private Date createTime;//下单金额
	private String orderNo;//订单标号
	private Integer status;//状态码
	private Integer userId;//所属用户id
	private  List<OrderProduct> orderProductList = new ArrayList<OrderProduct>();//订单商品集合
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCost() {
		return cost;
	}
	public void setCost(Integer cost) {
		this.cost = cost;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public List<OrderProduct> getOrderProductList() {
		return orderProductList;
	}
	public void setOrderProductList(List<OrderProduct> orderProductList) {
		this.orderProductList = orderProductList;
	}
	
}
