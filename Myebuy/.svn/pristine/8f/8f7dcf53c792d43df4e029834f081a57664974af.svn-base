package com.mage.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.tomcat.util.codec.binary.Base64;

/**
 * MD5加密字符串
 * @author Cushier
 *
 */
public class MD5Util {

	public static String encode(String str){
		String value = "";
		
		try {
			// 得到MD5算法的应用程序对象
			MessageDigest messageDigest = MessageDigest.getInstance("md5");
			// 通过md5算法加密字符串，得到byte数组
			byte[] bytes = messageDigest.digest(str.getBytes());
			// 通过Base64编码，将byte数组转换乘字符串
			value = Base64.encodeBase64String(bytes);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return value;
	}
	
	public static void main(String[] args) {
		System.out.println(encode("123456"));
	}
}
