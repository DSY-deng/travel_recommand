var rolename = null;
var password = null;
var sex = null;
var telephone = null;
//var type = null;
//var createtime = null;
var addBtn = null;
var backBtn = null;

$(function(){
	rolename = $("#rolename");
	password = $("#password");
	sex = $("#sex");
	telephone = $("#telephone");
	//type = $("#type");
	//createtime = $("#createtime");
	addBtn = $("#add");
	backBtn = $("#back");
	//初始化的时候，要把所有的提示信息变为：* 以提示必填项，更灵活，不要写在页面上
	rolename.next().html("*");
	password.next().html("*");
	sex.next().html("*");
	telephone.next().html("*");
	//type.next().html("*");
	//createtime.next().html("*");
	
	/*
	 * 验证
	 * 失焦\获焦
	 * jquery的方法传递
	 */
	rolename.bind("blur",function(){
		//ajax后台验证--userCode是否已存在
		//user.do?method=ucexist&userCode=**
		$.ajax({
			type:"GET",//请求类型
			url:path+"/isRoleName",//请求的url
			data:{rolename:rolename.val()},//请求参数
			dataType:"json",//ajax接口（请求url）返回的数据类型
			success:function(data){//data：返回数据（json对象）
				//alert(data);
				if(data.flag){//账号已存在，错误提示
					validateTip(rolename.next(),{"color":"red"},imgNo+ " 该管理员用户名已存在",false);
				}else{//账号可用，正确提示
					validateTip(rolename.next(),{"color":"green"},imgYes+" 该管理员用户名可以使用",true);
				}
			},
			error:function(data){//当访问时候，404，500 等非200的错误状态码
				validateTip(rolename.next(),{"color":"red"},imgNo+" 您访问的页面不存在",false);
			}
		});
	}).bind("focus",function(){
		//显示友情提示
		validateTip(rolename.next(),{"color":"#666666"},"* 用户名是您登录系统的账号",false);
	}).focus();


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
	/*proContact.on("focus",function(){
		validateTip(proContact.next(),{"color":"#666666"},"* 请输入联系人",false);
	}).on("blur",function(){
		if(proContact.val() != null && proContact.val() != ""){
			validateTip(proContact.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(proContact.next(),{"color":"red"},imgNo+" 联系人不能为空，请重新输入",false);
		}
		
	});*/
	
	telephone.on("focus",function(){
		validateTip(telephone.next(),{"color":"#666666"},"* 请输入手机号",false);
	}).on("blur",function(){
		var patrn=/^(13[0-9]|15[0-9]|18[0-9])\d{8}$/;
		if(telephone.val().match(patrn)){
			validateTip(telephone.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(telephone.next(),{"color":"red"},imgNo + " 您输入的手机号格式不正确,请输入13-的号码",false);
		}
	});
	
	addBtn.bind("click",function(){
		if(rolename.attr("validateStatus") != "true"){
			rolename.blur();
		}else if(password.attr("validateStatus") != "true"){
			password.blur();
		}else if(telephone.attr("validateStatus") != "true"){
			telephone.blur();
		}else{
			if(confirm("是否确认提交数据")){
				$("#roleForm").submit();
			}
		}
	});
	
	backBtn.on("click",function(){
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