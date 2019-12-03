package com.mage.service;

import java.util.ArrayList;
import java.util.List;

import com.mage.dao.InitDao;
import com.mage.po.BigType;
import com.mage.po.Product;
import com.mage.po.Tag;

public class InitService {
	private InitDao initdao= new InitDao();
	public List<BigType> querybigType() {
		//调用dao层获取数据集合
		List<BigType> bigtype=new ArrayList<>();
		bigtype=initdao.querybigType();
		return bigtype;
	}
	public List<Product> queryspecial() {
		// 调用dao层获取数据集合
		List<Product> special = new ArrayList<>();
		special = initdao.queryspecial();
		return special;
	}
	public List<Product> queryhotType() {
		// 调用dao层获取数据集合
		List<Product> hotType = new ArrayList<>();
		hotType = initdao.queryhotType();
		return hotType;
	}
	
	
	//调用dao层获取数据集合
	public List<Tag> querytagType() {
		List<Tag> tag = new ArrayList<>();
		tag = initdao.queryTag();
		return tag;
	}

}
