package com.mage.po.vo;

public class ResultInfo<T> {
	private Integer code;//状态码 	0失败 1成功
	private String msg;//提示信息
	private T result;//返回对象
	
	public ResultInfo(Integer code, String msg, T result) {
		super();
		this.code = code;
		this.msg = msg;
		this.result = result;
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public T getResult() {
		return result;
	}
	public void setResult(T result) {
		this.result = result;
	}
	
}
