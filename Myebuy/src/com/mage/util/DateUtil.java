package com.mage.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

//日期格式转换的

public class DateUtil {
	public static Date  formarString(String str ,String format) throws Exception{
		if(StringUtil.isEmpty(str)) {
			return null;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.parse(str);
	}
	//当前时间格式化
	public static String getCurrentDateStr() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmsss");
		return sdf.format(date);
	}
}
