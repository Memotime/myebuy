package com.mage.po;

import java.util.ArrayList;
import java.util.List;

public class BigType {
	private Integer id;//id
	private String name;//名称
	private String remarks;//备注
	private List<SmallType> smallTypeList = new ArrayList<SmallType>();
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public List<SmallType> getSmallTypeList() {
		return smallTypeList;
	}
	public void setSmallTypeList(List<SmallType> smallTypeList) {
		this.smallTypeList = smallTypeList;
	}
	
}
