var addBtn = null;
var backBtn = null;



function jump(){
    window.location.href="localhost:8080/billlist.jsp";
}

$(function () {

    addBtn = $("#add");
    backBtn = $("#back");

    addBtn.on("click",function(){

            if(confirm("是否确认提交数据")){
                $("#addDetailPic").submit();
              //  $("#addRImage").submit();
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

            jump();
        }
    });

});
