var billObj;

//订单管理页面上点击删除按钮弹出删除框(billlist.jsp)
function deleteRoute(obj){
	$.ajax({
		type:"GET",
		url:path+"/deleteRoute",
		data:{rid:obj.attr("rid")},
		dataType:"json",
		success:function(data){
			alert(data);
			if(data.flag){//删除成功：移除删除行
				cancleBtn();
				obj.parents("tr").remove();
				location.reload();
				//window.Location.href="${pageContext.request.contextPath}/billList"
			}else{//删除失败
				//alert("对不起，删除订单【"+obj.attr("billcc")+"】失败");
				changeDLGContent("对不起，删除订单【"+obj.attr("routecc")+"】失败");
			}
		},
		error:function(data){
			alert("对不起，删除失败");
		}
	});
}

function openYesOrNoDLG(){
	$('.zhezhao').css('display', 'block');
	$('#removeBi').fadeIn();
}

function cancleBtn(){
	$('.zhezhao').css('display', 'none');
	$('#removeBi').fadeOut();
}
function changeDLGContent(contentStr){
	var p = $(".removeMain").find("p");
	p.html(contentStr);
}

$(function(){
	$(".viewRoute").on("click",function(){
		//将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
		var obj = $(this);
		window.location.href=path+"/routeView?rid="+ obj.attr("rid");
	});
	
	$(".modifyRoute").on("click",function(){
		var obj = $(this);
		window.location.href=path+"/viewRoute?rid="+ obj.attr("rid");
	});
	$('#no').click(function () {
		cancleBtn();
	});
	
	$('#yes').click(function () {
		deleteRoute(billObj);
	});

	$(".deleteRoute").on("click",function(){
		billObj = $(this);
		changeDLGContent("你确定要删除订单【"+billObj.attr("routecc")+"】吗？");
		openYesOrNoDLG();
	});


	/*$(".deleteBill").on("click",function(){
		var obj = $(this);
		if(confirm("你确定要删除订单【"+obj.attr("billcc")+"】吗？")){
			$.ajax({
				type:"GET",
				url:path+"/bill.do",
				data:{method:"delbill",billid:obj.attr("billid")},
				dataType:"json",
				success:function(data){
					if(data.delResult == "true"){//删除成功：移除删除行
						alert("删除成功");
						obj.parents("tr").remove();
					}else if(data.delResult == "false"){//删除失败
						alert("对不起，删除订单【"+obj.attr("billcc")+"】失败");
					}else if(data.delResult == "notexist"){
						alert("对不起，订单【"+obj.attr("billcc")+"】不存在");
					}
				},
				error:function(data){
					alert("对不起，删除失败");
				}
			});
		}
	});*/
});