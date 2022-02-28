var rolename = null;
var password = null;
var telephone = null;
var saveBtn = null;
var backBtn = null;

$(function(){
	rolename = $("#rolename");
	password = $("#password");
	telephone = $("#telephone");
	saveBtn = $("#save");
	backBtn = $("#back");
	
	//初始化的时候，要把所有的提示信息变为：* 以提示必填项，更灵活，不要写在页面上
	rolename.next().html("*");
	password.next().html("*");
	telephone.next().html("*");
	
	/*
	 * 验证
	 * 失焦\获焦
	 * jquery的方法传递
	 */
	/*rolename.on("focus",function(){
		validateTip(rolename.next(),{"color":"#666666"},"* 请输入管理员用户名",false);
	}).on("blur",function(){
		if(rolename.val() != null && rolename.val() != ""){
			validateTip(rolename.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(rolename.next(),{"color":"red"},imgNo+" 管理员用户名不能为空，请重新输入",false);
		}
		
	});*/

	password.bind("focus",function(){
		validateTip(password.next(),{"color":"#666666"},"* 密码长度必须是大于5小于20",false);
	}).bind("blur",function(){
		if(password.val() != null && password.val().length > 5
			&& password.val().length < 20 ){
			validateTip(password.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(password.next(),{"color":"red"},imgNo + " 密码输入不符合规范，请重新输入",false);
		}
	});
	
	telephone.on("focus",function(){
		validateTip(telephone.next(),{"color":"#666666"},"* 请输入手机号",false);
	}).on("blur",function(){
		var patrn=/^(13[0-9]|15[0-9]|18[0-9])\d{8}$/;
		if(telephone.val().match(patrn)){
			validateTip(telephone.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(telephone.next(),{"color":"red"},imgNo + " 您输入的手机号格式不正确",false);
		}
	});
	
	saveBtn.on("click",function(){
		//rolename.blur();
		password.blur();
		telephone.blur();
		if(password.attr("validateStatus") == "true" &&
			telephone.attr("validateStatus") == "true"){
			if(confirm("是否确认提交数据")){
				$("#roleForm").submit();
			}
		}
	});
	
	backBtn.on("click",function(){
		//alert("modify: "+referer);
		if(referer != undefined 
			&& null != referer 
			&& "" != referer
			&& "null" != referer
			&& referer.length > 4){
		 window.location.href = referer;
		}else{
			history.back(-1);
		}
	});
});