<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>报表管理</title>

<!-- 静态包含引入必要的CSS以及JS文件 -->
<%@include file="/common/commons.jsp" %>

<!-- 导入 ECharts -->
<script type="text/javascript" src="/Myebuy/back/js/echarts.js"></script>

</head>
<body>
    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <div id="main" style="width: 100%;height:400px;"></div>
</body>
<script type="text/javascript">
	$.ajax({
		type:"post",
		url:"../backproduct",
		data:{
			'actionName':'echarst'
		},
		dataType:"json",
		success:function(data){
			console.log(data);
			var typeName=[];
			var typenum=[];
			// 循环遍历拼接数据
			for(var i = 0;i < data.length;i++){
				var obj = data[i];
				// 将数据添加到数组的最后面
				typeName.push(obj.name);
			}
			console.log(data);
			console.log(typeName);
			loadAcountCharts(typeName,data);
		}
	});
	// 加载账户分析图
	function loadAcountCharts(typeName,data){
		
		   // 基于准备好的dom，初始化echarts实例
	    var myChart = echarts.init(document.getElementById('main'));

	    // 指定图表的配置项和数据
	     option = {
	    	    title : {
	    	        text: 'ebuy商城来源',
	    	        subtext: '纯属虚构',
	    	        x:'center'
	    	    },
	    	    tooltip : {
	    	        trigger: 'item',
	    	        formatter: "{a} <br/>{b} : {c} ({d}%)"
	    	    },
	    	    legend: {
	    	        orient: 'vertical',
	    	        left: 'left',
	    	        data: typeName
	    	    },
	    	    series : [
	    	        {
	    	            name: '访问来源',
	    	            type: 'pie',
	    	            radius : '55%',
	    	            center: ['50%', '60%'],
	    	            data:data,
	    	            itemStyle: {
	    	                emphasis: {
	    	                    shadowBlur: 10,
	    	                    shadowOffsetX: 0,
	    	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	    	                }
	    	            }
	    	        }
	    	    ]
	    	};


	    // 使用刚指定的配置项和数据显示图表。
	    myChart.setOption(option);
		
	}

</script>
</html>