package com.mage.util;
/**
 * 生成分页代码
 * 	tagetUrl 目标地址
 *	totalNum 总记录数
 *	currentPage 当前页
 *	pageSize 每页大小
 */
public class PageUtil {
	public static String getPaginactionNoParmy(String tagetUrl,long totalNum, int currentPage ,int pageSize) {
		//总页码数		总记录数 % 每页大小==0       ?
		long totalPage = totalNum % pageSize == 0 ? totalNum/pageSize : totalNum / pageSize +1;
		if(totalPage==0) {
			return "未查询到数据";
		}else {
			StringBuffer pageCode = new StringBuffer();
			pageCode.append("<li><a href='" + tagetUrl +"&page=1'>首页</a></li>");
			//当前页面
			if(currentPage>1) {
				pageCode.append("<li><a href='" +tagetUrl +"&page="+(currentPage-1)+"'>上一页</a></li>");
			}
			
			for(int i = currentPage-2; i<=currentPage+2; i++ ) {
				if(i<1||i>totalPage) {
					continue;//掉到下一次循环中
				}
				//如果当前页是1 1等于当前页数，只显示当前数，不能点击
				if(i==currentPage) {
					//只是显示不做别的
					pageCode.append("<li>"+i+"</li>");
				}else {
					//否者不是当前页面可以点击
					pageCode.append("<li><a href='"+tagetUrl+ "&page=" +i +"'>" +i+"</a></li>");
				}
			}
			//当前页如果小于总页面数有下一页
			if(currentPage<totalPage) {
				pageCode.append("<li><a href='" +tagetUrl +"&page="+(currentPage+1)+"'>下一页</a></li>");
			}
			//不管如何都会有尾页
			pageCode.append("<li><a href='" + tagetUrl +"&page="+totalPage +"'>尾页</a></li>");
			return pageCode.toString();
		}
		
	}
}
