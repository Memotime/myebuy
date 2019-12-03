package com.mage.util;

/**
 * 字符串工具类
 * @author Cushier
 *
 */
public class StringUtil {

	/**
	 * 判断字符串是否为空
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str) {
		if (null == str || "".equals(str.trim())) {
			return true;
		}
		return false;
	}
	

	/**
	 * 判断字符串是否不为空
	 * @param str
	 * @return
	 */
	public static boolean isNotEmpty(String str) {
		if (null == str || "".equals(str.trim())) {
			return false;
		}
		return true;
	}
}
