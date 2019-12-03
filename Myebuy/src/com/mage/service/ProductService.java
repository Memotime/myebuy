package com.mage.service;

import java.util.ArrayList;
import java.util.List;

import com.mage.dao.ProductDao;
import com.mage.po.Comment;
import com.mage.po.Product;

public class ProductService {
private ProductDao productdao =new ProductDao();
	public List<Product> productList(String typeid) {
		//判断是否为空
		if(typeid==null) {
			return null;
		}
		//调用dao层方法获得数据集合
		List<Product> productList = new ArrayList();
		productList=productdao.queryProduct(typeid);
		return productList;
	}
	public List<Product> smallTypeList(String typeid) {
		// 判断是否为空
		if (typeid == null) {
			return null;
		}
		// 调用dao层方法获得数据集合
		List<Product> productList = new ArrayList();
		productList = productdao.querysmallType(typeid);
		return productList;
	}
	public Product lookpro(String productid) {
		// 判断是否为空
		if (productid == null) {
			return null;
		}
		// 调用dao层方法获得数据集合
		Product product = new Product();
		product = productdao.querysproduct(productid);
		return product;
	}
	/**
	 * 搜索
	 * @param product
	 * @return
	 */
	public List<Product> shproductList(String product) {
		// 判断是否为空
		if (product == null) {
			return null;
		}
		// 调用dao层方法获得数据集合
		List<Product> shproductList = new ArrayList<Product>();
		shproductList = productdao.querybyname(product);
		return shproductList;
	}
	public List<Product> productListByPage(int currentPage, int pageSize,String typeid) {
		List<Product> productList = new ArrayList<Product>();
		// 调用dao层方法
		productList = productdao.queryListByPage(currentPage, pageSize,typeid);
		return productList;
	}
	public List<Product> querySmallTypeByPage(int currentPage, int pageSize,String typeid) {
		List<Product> productList = new ArrayList<Product>();
		// 调用dao层方法
		productList = productdao.querySmallTypeByPage(currentPage, pageSize,typeid);
		return productList;
	}
	
	public int queryBigTypeCount(String typeid) {
		// 调用Dao层方法
		int totalNum = productdao.queryBigTypeCount(typeid);
		return totalNum;
	}
	public int querySmallTypeCount(String typeid) {
		// 调用Dao层方法
		int totalNum = productdao.querySmallTypeCount(typeid);
		return totalNum;
	}

}
