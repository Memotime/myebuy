package com.mage.util;
/**
 * 	分页工具类
 * @author Administrator
 */
public class PageUtil {
	/**
	 * 	通过传入参数进行分页操作
	 * @param tageUrl	目标地址
	 * @param totalNum	总记录数
	 * @param currentPage	当前页面数
	 * @param pageSize	每页显示数
	 * @return
	 */
	public static String getPagingByPageSize(String tageUrl,long totalNum,int currentPage,int pageSize) {
		// 总页码数
		long totalPage = totalNum % pageSize == 0 ? (totalNum/pageSize) : (totalNum/pageSize+1);
		
		//为0判断
		if (totalPage==0) {
			return "未查询到数据信息";
		}
		StringBuffer pageCode = new StringBuffer();
		
		// 显示首页
		pageCode.append("<li><a href='"+tageUrl+"&page=1'>首页</a></li>");
		if (currentPage>1) {
			// 显示上一页
			pageCode.append("<li><a href='"+tageUrl+"&page="+(currentPage-1)+"'>上一页</a></li>");
		}
		if (currentPage-2>1) {
			pageCode.append("<li><a>"+"..."+"</a></li>");
		}
		for (int i = currentPage-2; i < currentPage+3; i++) {
			if (i<1||i>totalPage) {
				continue;
			}
			
			if (currentPage==i) {
				pageCode.append("<li><a style='opacity: 0.4'>"+i+"</a></li>");
			}else {
				pageCode.append("<li><a href='"+tageUrl+"&page="+i+"'>"+i+"</a></li>");
			}
		}
		
		if (currentPage+1<=totalPage) {
			pageCode.append("<li><a>"+"..."+"</a></li>");
		}
		// 显示下一页
		if (currentPage<totalPage) {
			pageCode.append("<li><a href='"+tageUrl+"&page="+(currentPage+1)+"'>下一页</a></li>");
		}
		// 显示尾页
		pageCode.append("<li><a href='"+tageUrl+"&page="+totalPage+"'>尾页</a></li>");
		
		return pageCode.toString();
	}
}
