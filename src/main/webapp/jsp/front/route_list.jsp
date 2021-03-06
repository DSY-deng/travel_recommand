<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>旅游-搜索</title>
    <link rel="stylesheet" type="text/css" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/search.css">
    <script src="../../js/jquery-3.3.1.js"></script>
    <script src="../../js/getParameter.js"></script>
    <script>
        /* data数据json格式
        {
	"totalCount": 513,
	"totalPage": 103,
	"currentPage": 1,
	"pageSize": 5,
	"list": [{
		"rid": 1,
		"rname": "【旅展 半价特惠 重走丝路•漫游宁夏 双飞4天】银川西部影视城 穆民新村 中卫沙坡头【品美酒 回族学唱花儿 感悟民俗】",
		"price": 999.0,
		"routeIntroduce": "走进【宁夏沙坡头】，感受西北大漠风情、体会“大漠孤烟直，长河落日圆”的塞上风光！",
		"rflag": "1",
		"rdate": "2018-02-09 01:13:16",
		"isThemeTour": "0",
		"count": 0,
		"cid": 5,
		"rimage": "img/product/small/m304b69a4c8328f7d6b8d5dadef020fe07.jpg",
		"sid": 1,
		"sourceId": "23677",
		"category": null,
		"seller": null,
		"routeImgList": null
	        },.....]
        }
        */
        $(function () {
            /*            var search = location.search;
            //            切割字符串'cid=6'，拿到第二个值
                        var cid = search.split("=")[1];*/
//           获取cid
            var cid = getParameter("cid");
//            获取rname
            var rname = getParameter("rname");

            //alert(cid);

            //alert("cid:" + cid);
           // alert("rname:" + rname);

//            判断rname如果不为null或者""
            if (rname) {
//                url解码
                rname = window.decodeURIComponent(rname);
            }

            if (rname) {
               $("#innershowrname").html(rname + '>>');
            }else{
                $("#innershowrname").html("");
            }
//            当页码加载完成后，调用load方法，发送ajax请求加载数据
            /*,rname*/

                load(cid,1,rname);



            /*location.reload重新加载一次*/
            /*var totalPageNumber=$("#currentPage").val() ;
            load(cid,totalPageNumber,rname);*/

            // 发送请求数据，显示某一类别cid收藏最高的数据
            $.get("/selectTopByCid",{cid:cid},function (data) {
                //           2、 列表数据显示
                var route_lis = "";
                console.log("内容："+data);
                console.log("长度："+data.length);
                //遍历数组，拼接字符串标签
                for (var i = 0; i < 5 ; i++){
                    var routeByCid = data[i];
                    var route_li = '<li>\n' +
                        '<a href="route_detail.jsp?rid='+routeByCid.rid+'&cname='+data[i].category.cname+'">\n' +
                        '<div class="left"><img src=../../'+routeByCid.rimage+' alt=""></div>\n' +
                        '<div class="right">\n' +
                        '<p>'+routeByCid.routeintroduce+'</p>\n' +
                        '<p>网付价<span>&yen;<span>'+routeByCid.price+'</span>起</span>\n' +
                        '</p>\n' +
                        '</div>\n' +
                        '</li>';
                    route_lis += route_li;
                }
//                将route_lis内容设置到ul
                $("#hotRecommend").html(route_lis);
            })


                setTimeout("fresh()",5);


        });

        function fresh(){
            if(location.href.indexOf("&reload=true")<0){
                location.href+="&reload=true";
            }
        }




        function load(cid,currentPage,rname) {

//            发送ajax数据，请求route/pageQuery，传递cid
            /*,currentPage:currentPage,rname:rname*/
            $.get("/pageQuery",{cid:cid,currentPage:currentPage,rname:rname},function (data) {
//            解析pageBean数据，展示到页面上

//           1、 分页工具条数据显示
//           1.1、展示总页码和总记录数
                var totalCount = $("#total").val() ;
                var totalPage = $("#sumPage").val() ;
                var rouname = $("#searchb").val();

                //var currentPage = $("#currentPage").val() ;
                console.log(data);
                console.log("totalCount:"+totalCount);
                console.log("totalPage:"+totalPage);
                console.log("rname:"+rname);
                $("#totalPage").html(totalPage);
                $("#totalCount").html(totalCount);
                $("#search_input").html(rouname);

               // alert("searchb："+searchb);

                var lis = "";
                var firstPage = "";
                if(rname){
                    firstPage = '<li onclick="javascript:load('+ cid + ',1,\''+ rname +'\');"><a href="javascript:void(0);">首页</a></li>';

                }else {
                    firstPage = '<li onclick="javascript:load('+ cid + ',1,'+ rname +');"><a href="javascript:void(0);">首页</a></li>';

                }
//                计算上一页的页码
                var beforeNum = currentPage - 1;
                console.log("beforeNum:"+beforeNum);
                if (beforeNum <= 0){
                    beforeNum = 1;
                }
                console.log("beforeNum:"+beforeNum);
                var beforePage = "";
                if(rname){
                    beforePage = '<li onclick="javascript:load('+ cid +','+ beforeNum +',\''+ rname +'\');" class="threeword"><a href="javascript:void(0);">上一页</a></li>';

                }else{
                    beforePage = '<li onclick="javascript:load('+ cid +','+ beforeNum +','+ rname +');" class="threeword"><a href="javascript:void(0);">上一页</a></li>';

                }
                lis += firstPage;
                lis += beforePage;
//           1.2、展示分页页码

                /*
                    1、一共展示10个页码，能够达到前5后4的效果
                    2、如果前边不够5个，后边补齐10个
                    3、如果后边不足4个，前边补齐10个

                 */
//                定义开始位置begin，结束位置 end
                var begin;
                var end;

//                1、要显示10个页码
//                总页码不够10页
                if(totalPage < 10){
                    begin = 1;
                    end = totalPage;
                }else {
//                    总页码超过10页
                    begin = currentPage - 5;
                    end = currentPage + 4;

//                    2、如果前边不够5个，后边补齐10个
                    if (begin < 1){
                        begin = 1;
                        end = begin + 9;
                    }
//                    3、如果后边不足4个，前边补齐10个
                    if (end > totalPage){
                        end = totalPage;
                        begin = end -9;
                    }
                }



                for (var i = begin ; i <= end ; i++){
//                    创建页码li
                    var li = "";
//                    判断当前页码是否等于i
                    if(currentPage <= 0){
                        currentPage = 1;
                    }
                    if (currentPage == i){
                        if(rname){
                            li = '<li class="curPage" onclick="javascript:load('+ cid +','+ i +',\''+rname+'\');"><a href="javascript:void(0);">'+i+'</a></li>';

                        }else{
                            li = '<li class="curPage" onclick="javascript:load('+ cid +','+ i +','+rname+');"><a href="javascript:void(0);">'+i+'</a></li>';

                        }
i
                    }else {
                        if(rname){
                            li = '<li onclick="javascript:load('+ cid +','+ i +',\''+rname+'\');"><a href="javascript:void(0);">'+i+'</a></li>';

                        }else{
                            li = '<li onclick="javascript:load('+ cid +','+ i +','+rname+');"><a href="javascript:void(0);">'+i+'</a></li>';

                        }
                    }

//                    拼接字符串
                    lis += li;
                }



/*!//                展示所有页码
                for (var i = 1; i<=totalPage ;i++){
//                    创建页码li
                    var li = "";
//                    判断当前页码是否等于i
                    if (data.currentPage == i){
                    li = '<li class="curPage" onclick="javascript:load('+cid+','+i+');"><a href="javascript:void(0);">'+i+'</a></li>';

                    }else {
                    li = '<li onclick="javascript:load('+cid+','+i+');"><a href="javascript:void(0);">'+i+'</a></li>';
                    }

//                    拼接字符串
                    lis += li;
                }*/

                var lastPage = "";
                if(rname){
                    lastPage = '<li onclick="javascript:load('+ cid +','+ totalPage +',\''+rname+'\');" class="threeword"><a href="javascript:;">末页</a></li>';

                }else{
                    lastPage = '<li onclick="javascript:load('+ cid +','+ totalPage +','+rname+');" class="threeword"><a href="javascript:;">末页</a></li>';

                }
//                计算下一页页码
                var nextNum = currentPage +1;
                if (nextNum > totalPage){
                    nextNum = totalPage;
                }
                var nextPage = "";
                if(rname){
                    nextPage = '<li onclick="javascript:load('+ cid +','+ nextNum +',\''+rname+'\');" class="threeword"><a href="javascript:void(0);">下一页</a></li>';

                }else{
                    nextPage = '<li onclick="javascript:load('+ cid +','+ nextNum +',\''+rname+'\');" class="threeword"><a href="javascript:void(0);">下一页</a></li>';

                }
                lis += nextPage;
                lis += lastPage;
//                将lis内容设置到ul
                $("#pageNum").html(lis);


                //alert(currentPage);
               /* if(currentPage>1){
                    setTimeout("iscurrentpage()",5);
                }*/

//           2、 列表数据显示
                var route_lis = "";
                var cname = getParameter("cname");
                //            判断cname如果不为null或者""
                if (cname){
//                url解码
                    cname = window.decodeURIComponent(cname);
                }
                //alert(cname);
                console.log("内容："+data);
                console.log("长度："+data.length);
                for (var i = 0; i < data.length ; i++){
                    var route = data[i];
                    console.log(route);
                    console.log("已进入")
                    var route_li = '<li>\n' +
                        '                            <div class="img"><img src=../../'+ route.rimage +' alt="" style="width: 299px"></div>\n' +
                        '                            <div class="text1">\n' +
                        '                                <p>'+ route.rname +'</p>\n' +
                        '                                <br/>\n' +
                        '                                <p>'+ route.routeintroduce +'</p>\n' +
                        '                            </div>\n' +
                        '                            <div class="price">\n' +
                        '                                <p class="price_num">\n' +
                        '                                    <span>&yen;</span>\n' +
                        '                                    <span>'+ route.price +'</span>\n' +
                        '                                    <span>起</span>\n' +
                        '                                </p>\n' +
                        '                                <p><a href="route_detail.jsp?rid='+route.rid+'&cname='+cname+'">查看详情</a></p>\n' +
                        '                            </div>\n' +
                        '                        </li>';

                    route_lis += route_li;
                }
//                将route_lis内容设置到ul
                $("#route").html(route_lis);

//                定位到页面顶部
                window.scrollTo(0,0);
            });


        }

    </script>

</head>
<body>
<!--引入头部-->
<div id="header"></div>
    <div class="page_one">
        <div class="contant">
            <div class="crumbs">
                <img src="../../images/search.png" alt="">
                <p>旅行>><span id="innershowrname" style="color: #0f0f0f">车票</span><span>搜索结果</span></p>
            </div>
            <div class="xinxi clearfix">
                <div class="left">
                    <div class="header">
                        <span>商品信息</span>
                        <span class="jg">价格</span>
                    </div>
                    <ul id="route">
                       <!-- <li>
                            <div class="img"><img src="images/04-search_03.jpg" alt=""></div>
                            <div class="text1">
                                <p>浪花朵朵旅行普吉岛丛林飞跃空中飞人探险游中文服务泰国旅游</p>
                                <br/>
                                <p>1-2月出发，网付立享￥1099/2人起！爆款位置有限，抢完即止！</p>
                            </div>
                            <div class="price">
                                <p class="price_num">
                                    <span>&yen;</span>
                                    <span>899</span>
                                    <span>起</span>
                                </p>
                                <p><a href="route_detail.jsp">查看详情</a></p>
                            </div>
                        </li>-->
                        <input type="hidden" id="searchb" name="searchb" value="${sessionScope.rname}"/>

                   </ul>
                    <input type="hidden" id="total" value="${sessionScope.total}"/>
                    <input type="hidden" id="sumPage" value="${sessionScope.sumPage}"/>
                    <input type="hidden" id="currentPage" value="${sessionScope.currentPage}"/>
                    <div class="page_num_inf">
                        <i></i> 共
                        <span id="totalPage">12</span>页<span id="totalCount">100</span>条
                    </div>
                    <div class="pageNum">
                        <ul id="pageNum">
                          <%-- <li><a href="">首页</a></li>
                            <li class="threeword"><a href="#">上一页</a></li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">6</a></li>
                            <li><a href="#">7</a></li>
                            <li><a href="#">8</a></li>
                            <li><a href="#">9</a></li>
                            <li><a href="#">10</a></li>
                            <li class="threeword"><a href="javascript:;">下一页</a></li>
                            <li class="threeword"><a href="javascript:;">末页</a></li>--%>
                        </ul>
                    </div>
                </div>
                <div class="right">
                    <div class="top">
                        <div class="hot">HOT</div>
                        <span>热门推荐</span>
                    </div>
                    <ul id="hotRecommend">
                       <%-- <li>
                            <div class="left"><img src="../images/04-search_09.jpg" alt=""></div>
                            <div class="right">
                                <p>清远新银盏温泉度假村酒店/自由行套...</p>
                                <p>网付价<span>&yen;<span>899</span>起</span>
                                </p>
                            </div>
                        </li>
                        <li>
                            <div class="left"><img src="../images/04-search_09.jpg" alt=""></div>
                            <div class="right">
                                <p>清远新银盏温泉度假村酒店/自由行套...</p>
                                <p>网付价<span>&yen;<span>899</span>起</span>
                                </p>
                            </div>
                        </li>
                        <li>
                            <div class="left"><img src="../images/04-search_09.jpg" alt=""></div>
                            <div class="right">
                                <p>清远新银盏温泉度假村酒店/自由行套...</p>
                                <p>网付价<span>&yen;<span>899</span>起</span>
                                </p>
                            </div>
                        </li>
                        <li>
                            <div class="left"><img src="../images/04-search_09.jpg" alt=""></div>
                            <div class="right">
                                <p>清远新银盏温泉度假村酒店/自由行套...</p>
                                <p>网付价<span>&yen;<span>899</span>起</span>
                                </p>
                            </div>
                        </li>
                        <li>
                            <div class="left"><img src="../images/04-search_09.jpg" alt=""></div>
                            <div class="right">
                                <p>清远新银盏温泉度假村酒店/自由行套...</p>
                                <p>网付价<span>&yen;<span>899</span>起</span>
                                </p>
                            </div>
                        </li>--%>
                    </ul>
                </div>
            </div>
        </div>
    </div>


    <!--引入头部-->
    <div id="footer"></div>
    <!--导入布局js，共享header和footer-->
    <script type="text/javascript" src="../../js/include.js"></script>
</body>



</html>