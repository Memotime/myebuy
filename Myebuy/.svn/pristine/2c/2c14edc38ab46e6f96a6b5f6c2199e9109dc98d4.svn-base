function loadimage(){
		document.getElementById("randImage").src = "image.jsp?"+Math.random();
	}
//鼠标焦点
/*$(function(){
	var userName=$("#userName").val();
	var password = $("#password").val();
	//鼠标焦点
	$("#userName").blur(function(){
		console.log(userName);
		if (""==userName) {
			$("#nametip").html("用户名不能为空");
			return false;
		}else{
			$("#nametip").html("");
		}
	}).focus(function(){
		$("#nametip").html("");                          
	});
	$("#password").focus(function(){
		$("#pwdtip").html("");                          
	}).blur(function(){
		var userName=$("#password").val();
		if (""== userName) {
			$("#pwdtip").html("密码名不能为空");
			return false;
		}else{
			$("#pwdtip").html("");
		}
	});
	
});*/
function checkForm() {
	console.log("11544");
	var userName = $("#userName").val();
	var password = $("#password").val();
	var imageCode = $("#imageCode").val();
	if ("" == userName) {
		$("#nametip").html("用户名不能为空");
		return false;
	}
	if ("" == password) {
		console.log("woc");
		$("#pwdtip").html("密码不能为空");
		return false;
	}
	if ("" == imageCode) {
		console.log("woc");
		$("#error").html("验证码不能为空");
		return false;
	}
	return true;
}