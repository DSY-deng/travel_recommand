var rname = null;
var price = null;
var routeintroduce = null;
var cid = null;
var rimage = null;
var sid = null;
var sourceid = null;
var addBtn = null;
var backBtn = null;

function priceReg (value){
	value = value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符
		value = value.replace(/^\./g,"");  //验证第一个字符是数字而不是.
    value = value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的.
    value = value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");//去掉特殊符号￥
	if(value.indexOf(".")>0){
		value = value.substring(0,value.indexOf(".")+3);
	}
	return value;
}


$(function(){
	rname = $("#rname");
	price = $("#price");
	routeintroduce = $("#routeintroduce");
	cid = $("#cid");
	rimage = $("#rimage");
	//sid = $("#sid");
	sourceid = $("#sourceid");
	addBtn = $("#add");
	backBtn = $("#back");
	//初始化的时候，要把所有的提示信息变为：* 以提示必填项，更灵活，不要写在页面上
	rname.next().html("*");
	price.next().html("*");
	routeintroduce.next().html("*");
	cid.next().html("*");
	//sid.next().html("*");
	sourceid.next().html("*");

	
	/*$.ajax({
		type:"GET",//请求类型
		/!*分页的显示所有和单独的显示所有不能混用*!/
		url:path+"/showSellerName",//请求的url
		data:{},//请求参数
		dataType:"json",//ajax接口（请求url）返回的数据类型
		success:function(data){//data：返回数据（json对象）
			alert(data)
			if(data != null){
				$("select").html("");//通过标签选择器，得到select标签，适用于页面里只有一个select
				var options = "<option value=\"0\">请选择</option>";
				for(var i = 0; i < data.length; i++){
					//alert(data[i].id);
					//alert(data[i].proName);
					options += "<option value=\""+data[i].sid+"\">"+data[i].sname+"</option>";
				}
				$("select").html(options);
			}
		},
		error:function(data){//当访问时候，404，500 等非200的错误状态码
			validateTip(sid.next(),{"color":"red"},imgNo+" 获取供应商列表error",false);
		}
	});*/
	$.ajax({
		type:"GET",//请求类型
		/*分页的显示所有和单独的显示所有不能混用*/
		url:path+"/showAllCategory",//请求的url
		data:{},//请求参数
		dataType:"json",//ajax接口（请求url）返回的数据类型
		success:function(data){//data：返回数据（json对象）
			alert(data);
			if(data != null){
				$("select").html("");//通过标签选择器，得到select标签，适用于页面里只有一个select
				var options = "<option value=\"0\">请选择</option>";
				for(var i = 0; i < data.length; i++){
					//alert(data[i].id);
					//alert(data[i].proName);
					options += "<option value=\""+data[i].cid+"\">"+data[i].cname+"</option>";
				}
				$("select").html(options);
			}
		},
		error:function(data){//当访问时候，404，500 等非200的错误状态码
			validateTip(cid.next(),{"color":"red"},imgNo+" 获取供应商列表error",false);
		}
	});


	/*
	 * 验证
	 * 失焦\获焦
	 * jquery的方法传递
	 */
	rname.on("focus",function(){
		validateTip(rname.next(),{"color":"#666666"},"* 请输入路线名称",false);
	}).on("blur",function(){
		if(rname.val() != null && rname.val() != ""){
			validateTip(rname.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(rname.next(),{"color":"red"},imgNo+" 路线名称不能为空，请重新输入",false);
		}

	});
	
	routeintroduce.on("focus",function(){
		validateTip(routeintroduce.next(),{"color":"#666666"},"* 请输入路线详情介绍",false);
	}).on("blur",function(){
		if(routeintroduce.val() != null && routeintroduce.val() != ""){
			validateTip(routeintroduce.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(routeintroduce.next(),{"color":"red"},imgNo+" 路线详情介绍不能为空，请重新输入",false);
		}
		
	});
	
	/*productUnit.on("focus",function(){
		validateTip(productUnit.next(),{"color":"#666666"},"* 请输入商品单位",false);
	}).on("blur",function(){
		if(productUnit.val() != null && productUnit.val() != ""){
			validateTip(productUnit.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(productUnit.next(),{"color":"red"},imgNo+" 单位不能为空，请重新输入",false);
		}
		
	});*/
	
	cid.on("focus",function(){
		validateTip(cid.next(),{"color":"#666666"},"* 请选择商品类别",false);
	}).on("blur",function(){
		if(cid.val() != null && cid.val() != "" && cid.val() != 0){
			validateTip(cid.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(cid.next(),{"color":"red"},imgNo+" 商品类别不能为空，请选择",false);
		}
		
	});
	
	/*productCount.on("focus",function(){
		validateTip(productCount.next(),{"color":"#666666"},"* 请输入大于0的正自然数，小数点后保留2位",false);
	}).on("keyup",function(){
		this.value = priceReg(this.value);
	}).on("blur",function(){
		this.value = priceReg(this.value);
	});*/
	
	/*price.on("focus",function(){
		validateTip(price.next(),{"color":"#666666"},"* 请输入大于0的正自然数，小数点后保留2位",false);
	}).on("keyup",function(){
		this.value = priceReg(this.value);
	}).on("blur",function(){
		this.value = priceReg(this.value);
	});*/
	price.on("focus",function(){
		validateTip(price.next(),{"color":"#666666"},"* 请输入大于0的正自然数",false);
	}).on("blur",function(){
		if(price.val() != null && price.val() != ""){
			validateTip(price.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(price.next(),{"color":"red"},imgNo+" 价格不能为空",false);
		}
	});

	sourceid.on("focus",function(){
		validateTip(sourceid.next(),{"color":"#666666"},"* 请输入数据来源id",false);
	}).on("blur",function(){
		if(sourceid.val() != null && sourceid.val() != ""){
			validateTip(sourceid.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(sourceid.next(),{"color":"red"},imgNo+" 数据来源id不能为空，请重新输入",false);
		}

	});
	/*else if(cid.attr("validateStatus") != "true"){
			cid.blur();
		}*/
	
	addBtn.on("click",function(){
		if(rname.attr("validateStatus") != "true"){
			rname.blur();
		}else if(price.attr("validateStatus") != "true"){
			price.blur();
		}else if(routeintroduce.attr("validateStatus") != "true"){
			routeintroduce.blur();
		}else if(sourceid.attr("validateStatus") != "true"){
			sourceid.blur();
		}else{
			if(confirm("是否确认提交数据")){
				//$("#file").submit();
				$("#routeForm").submit();
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