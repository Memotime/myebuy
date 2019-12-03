package com.mage.po;

import java.util.Date;

//用户实体
public class User {
	private int id;//id
	private String trueName;//真是姓名
	private String userName;//用户名
	private String password;//密码
	private String sex;//性别
	private Date birthday;//生日
	private String dentityCode;//身份证号
	private String email;//邮箱
	private String mobile;//手机
	private String address;//地址
	private int status;//状态  1是普通用户 2是管理员
	public User() {
		// TODO Auto-generated constructor stub
	}
	public User(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}
	public User( String userName, String password, String sex, Date birthday,
			String dentityCode, String email, String mobile, String address, int status) {
		this.userName = userName;
		this.password = password;
		this.sex = sex;
		this.birthday = birthday;
		this.dentityCode = dentityCode;
		this.email = email;
		this.mobile = mobile;
		this.address = address;
		this.status = status;
	}
	public User(String userName, String password, String sex, Date birthday, String dentityCode, String email,
			String mobile, String address) {
		this.userName = userName;
		this.password = password;
		this.sex = sex;
		this.birthday = birthday;
		this.dentityCode = dentityCode;
		this.email = email;
		this.mobile = mobile;
		this.address = address;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTrueName() {
		return trueName;
	}
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getDentityCode() {
		return dentityCode;
	}
	public void setDentityCode(String dentityCode) {
		this.dentityCode = dentityCode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}	
