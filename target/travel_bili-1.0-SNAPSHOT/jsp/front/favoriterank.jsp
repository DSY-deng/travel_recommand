<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>收藏排行榜</title>
        <link rel="stylesheet" type="text/css" href="../../css/common.css">
        <link rel="stylesheet" type="text/css" href="../../css/ranking-list.css">
        <script src="../../js/jquery-3.3.1.js"></script>
        <script src="../../js/getParameter.js"></script>
        <script>

            $(function () {

                var searchroute = getParameter("searchroute");
                var pricelow = getParameter("pricelow");
                var pricehigh = getParameter("pricehigh");

               // alert(searchroute+","+pricelow+","+pricehigh);
                //            判断rname如果不为null或者""
               /* if (searchroute) {
                    //                url解码
                    searchroute = window.decodeURIComponent(searchroute);
                }
*/
           //            判断rname如果不为null或者""
                if (searchroute) {
            //                url解码
                    searchroute = window.decodeURIComponent(searchroute);
                   /!* searchroute="\'"+searchroute+"\'";*!/
                }else{
                    searchroute = null;
                }
                if(pricelow){
                    pricelow = window.decodeURIComponent(pricelow);
                }else {
                    pricelow=null;
                }
                if(pricehigh){
                    pricehigh = window.decodeURIComponent(pricehigh);
                }else {
                    pricehigh=null;
                }

                // setTimeout("fresh()",5);

                load(1,searchroute,pricelow,pricehigh);

                var search = location.search;
                //alert(search);
                var para = search.split("?")[1];
               // alert(para);
               // alert("reload=true"==para);

                if("reload=true"==para){
                    location.href-="?reload=true";
                }



            });

           /* function fresh(){

                    if(location.href.indexOf("?reload=true")<0){
                        location.href+="?reload=true";
                    }

            }
*/

            function show() {

                //        给搜索按钮绑定单击事件，获取搜索输入框内容
                $("#find").click(function (){
//            线路名称
                    var sroute = $("#searchroute").val();
                    var plow = $("#pricelow").val();
                    var phigh = $("#pricehigh").val();
                    //alert("cid:"+cid);
                    // alert("rname:"+rname);
                    // $("#search_input").html(rname);
                    /*//            判断rname如果不为null或者""
                                if (rname){
                    //                url解码
                                    rname = window.decodeURIComponent(rname);
                                }
                                console.log("rname:"+rname);*/
//            跳转路径 "http://localhost/travel/route_list.jsp?cid=5&rname="+rname;
                    location.href="http://localhost:8080/jsp/front/favoriterank.jsp?searchroute="+sroute+"&pricelow="+plow+"&pricehigh="+phigh;
                });


            }




            function load(currentPage,searchroute,pricelow,pricehigh) {

           // alert(currentPage+","+searchroute+","+pricelow+","+pricehigh);
                // 发送请求数据，显示全部收藏最高的数据
                /*currentPage:currentPage,searchroute:searchroute,pricelow:pricelow,pricehigh:pricehigh*/
                $.get("/selectFavoriteTop", {currentPage:currentPage,searchroute:searchroute,pricelow:pricelow,pricehigh:pricehigh}, function (data) {
                    //            解析pageBean数据，展示到页面上

        //           1、 分页工具条数据显示
        //           1.1、展示总页码和总记录数
                    var totalCount = $("#total").val() ;
                    var totalPage = $("#sumPage").val() ;
                    /*用于数据展示*/
                    var sumstart = (currentPage-1)*10;
                    var sumend = currentPage*10;


                    console.log("totalCount:"+totalCount);
                    console.log("totalPage:"+totalPage);
                    console.log("searchroute:"+searchroute);
                    $("#totalPage").html(totalPage);
                    $("#totalCount").html(totalCount);
                   // $("#search_input").html(searchb);
                   // alert("search---:"+searchroute);
                    var lis = "";
                    var firstPage="";
                    if(searchroute){
                    firstPage = '<li onclick="javascript:load(1,\''+ searchroute +'\','+pricelow+','+pricehigh+');"><a href="javascript:void(0);">首页</a></li>';
                } else{
                        firstPage = '<li onclick="javascript:load(1,'+ searchroute +','+pricelow+','+pricehigh+');"><a href="javascript:void(0);">首页</a></li>';

                    }//                计算上一页的页码
                    var beforeNum = currentPage - 1;
                    console.log("beforeNum:"+beforeNum);
                    if (beforeNum <= 0){
                        beforeNum = 1;
                    }
                    console.log("beforeNum:"+beforeNum);
                    var beforePage="";
                    if (searchroute){
                        beforePage = '<li onclick="javascript:load('+beforeNum+',\''+ searchroute +'\','+pricelow+','+pricehigh+');" class="threeword"><a href="javascript:void(0);">上一页</a></li>';
                }else{
                        beforePage = '<li onclick="javascript:load('+beforeNum+','+ searchroute +','+pricelow+','+pricehigh+');" class="threeword"><a href="javascript:void(0);">上一页</a></li>';

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
                            if(searchroute){
                                li = '<li class="curPage" onclick="javascript:load('+ i +',\''+ searchroute +'\','+pricelow+','+pricehigh+');"><a href="javascript:void(0);">'+i+'</a></li>';

                            }else{
                                li = '<li class="curPage" onclick="javascript:load('+ i +','+ searchroute +','+pricelow+','+pricehigh+');"><a href="javascript:void(0);">'+i+'</a></li>';

                            }

                        }else {
                            if(searchroute){
                                li = '<li onclick="javascript:load('+ i +',\''+ searchroute +'\','+pricelow+','+pricehigh+');"><a href="javascript:void(0);">'+i+'</a></li>';

                            }else {
                                li = '<li onclick="javascript:load('+ i +','+ searchroute +','+pricelow+','+pricehigh+');"><a href="javascript:void(0);">'+i+'</a></li>';

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
                    if(searchroute){
                        lastPage='<li onclick="javascript:load('+totalPage+',\''+ searchroute +'\','+pricelow+','+pricehigh+');" class="threeword"><a href="javascript:;">末页</a></li>';

                    }else {
                        lastPage='<li onclick="javascript:load('+totalPage+','+ searchroute +','+pricelow+','+pricehigh+');" class="threeword"><a href="javascript:;">末页</a></li>';

                    }
        //                计算下一页页码
                    var nextNum = currentPage +1;
                    if (nextNum > totalPage){
                        nextNum = totalPage;
                    }
                    var nextPage ="";
                    if(searchroute){
                        nextPage = '<li onclick="javascript:load('+nextNum+',\''+ searchroute +'\','+pricelow+','+pricehigh+');" class="threeword"><a href="javascript:void(0);">下一页</a></li>';

                    }else {
                        nextPage = '<li onclick="javascript:load('+nextNum+','+ searchroute +','+pricelow+','+pricehigh+');" class="threeword"><a href="javascript:void(0);">下一页</a></li>';

                    }

                    lis += nextPage;
                    lis += lastPage;
        //                将lis内容设置到ul
                    $("#pageNum").html(lis);

                    //           2、 列表数据显示
                    var route_lis = "";
                    var number = 2;
                   if(sumend<11){
                       var listTop = '<li>\n' +
                           '                        <span class="num one">1</span>\n' +
                           '                        <a href="route_detail.jsp?rid='+data[0].rid+'&cid='+data[0].cid+'&cname='+data[0].category.cname+'"><img src="../../'+data[0].rimage+'" alt=""></a>\n' +
                           '                        <h4><a href="route_detail.jsp?rid='+data[0].rid+'&cid='+data[0].cid+'&cname='+data[0].category.cname+'">'+data[0].routeintroduce+'</a></h4>\n' +
                           '                        <p>\n' +
                           '                            <b class="price">&yen;<span>'+data[0].price+'</span>起</b>\n' +
                           '                            <span class="shouchang">已收藏'+data[0].count+'次</span>\n' +
                           '                        </p>\n' +
                           '                    </li>\n'+
                           '<li>' +
                           '                        <span class="num two">2</span>\n' +
                           '                        <a href="route_detail.jsp?rid='+data[1].rid+'&cid='+data[1].cid+'&cname='+data[1].category.cname+'"><img src="../../'+data[1].rimage+'" alt=""></a>\n' +
                           '                        <h4><a href="route_detail.jsp?rid='+data[1].rid+'&cid='+data[1].cid+'&cname='+data[1].category.cname+'">'+data[1].routeintroduce+'</a></h4>\n' +
                           '                        <p>\n' +
                           '                            <b class="price">&yen;<span>'+data[1].price+'</span>起</b>\n' +
                           '                            <span class="shouchang">已收藏'+data[1].count+'次</span>\n' +
                           '                        </p>\n' +
                           '                    </li>';

                       route_lis += listTop;
                       //遍历数组，拼接字符串标签
                       for (var i = 2; i < data.length; i++) {
                           var routeTop = data[i];
                           number++;
                           var route_li = '<li>\n' +
                               '                        <span class="num">'+number+'</span>\n' +
                               '                        <a href="route_detail.jsp?rid='+data[i].rid+'&cid='+data[i].cid+'&cname='+data[i].category.cname+'"><img src="../../'+data[i].rimage+'" alt=""></a>\n' +
                               '                        <h4><a href="route_detail.jsp?rid='+data[i].rid+'&cid='+data[i].cid+'&cname='+data[i].category.cname+'">'+data[i].routeintroduce+'</a></h4>\n' +
                               '                        <p>\n' +
                               '                            <b class="price">&yen;<span>'+data[i].price+'</span>起</b>\n' +
                               '                            <span class="shouchang">已收藏'+data[i].count+'次</span>\n' +
                               '                        </p>\n' +
                               '                    </li>\n';
                           route_lis += route_li;
                            }

                    }else{
                       //当不是首页时，直接遍历数组，拼接字符串标签
                       for (var i = 0; i < data.length; i++) {
                           var routeTop = data[i];
                           sumstart++;
                           var route_li = '<li>\n' +
                               '                        <span class="num">'+sumstart+'</span>\n' +
                               '                        <a href="route_detail.jsp?rid='+data[i].rid+'&cid='+data[i].cid+'&cname='+data[i].category.cname+'"><img src="../../'+data[i].rimage+'" alt=""></a>\n' +
                               '                        <h4><a href="route_detail.jsp?rid='+data[i].rid+'&cid='+data[i].cid+'&cname='+data[i].category.cname+'">'+data[i].routeintroduce+'</a></h4>\n' +
                               '                        <p>\n' +
                               '                            <b class="price">&yen;<span>'+data[i].price+'</span>起</b>\n' +
                               '                            <span class="shouchang">已收藏'+data[i].count+'次</span>\n' +
                               '                        </p>\n' +
                               '                    </li>\n';
                           route_lis += route_li;
                       }

                   }
        //                将route_lis内容设置到ul
                    $("#topBySort").html(route_lis);

                   // 定位到页面顶部
                  //  window.scrollTo(0,0);
                });
        }


        </script>

    </head>
    <body>
    <!--引入头部-->
    <div id="header"></div>
        <div class="contant">
            <div class="shaixuan">
                <span>线路名称</span>
                <input type="text" id="searchroute" name="searchroute" value="${sessionScope.searchroute}">
                <span>金额</span>
                <input type="text" id="pricelow" name="pricelow" value="${sessionScope.pricelow}" >---
                <input type="text" id="pricehigh" name="pricehigh" value="${sessionScope.pricehigh}" >
                <button id="find" name="find" onclick="show()">搜索</button>
            </div>
            <div class="list clearfix">
                <ul id="topBySort">
                    <%--<li>
                        <span class="num one">1</span>
                        <a href="route_detail.jsp"><img src="../images/jiangxuan_4.jpg" alt=""></a>
                        <h4><a href="route_detail.jsp">【尾单特卖】全国-曼谷6-7天自由行 泰国出境旅游 特价往6-7天自由行 泰国出境旅游 特价往..</a></h4>
                        <p>
                            <b class="price">&yen;<span>899</span>起</b>
                            <span class="shouchang">已收藏450次</span>
                        </p>
                    </li>
                    <li>
                        <span class="num two">2</span>
                         <a href="route_detail.jsp"><img src="../images/jiangxuan_4.jpg" alt=""></a>
                        <h4><a href="route_detail.jsp">【尾单特卖】全国-曼谷6-7天自由行 泰国出境旅游 特价往6-7天自由行 泰国出境旅游 特价往..</a></h4>
                        <p>
                            <b class="price">&yen;<span>899</span>起</b>
                            <span class="shouchang">已收藏450次</span>
                        </p>
                    </li>
                    <li>
                        <span class="num">3</span>
                         <a href="route_detail.jsp"><img src="../images/jiangxuan_4.jpg" alt=""></a>
                        <h4><a href="route_detail.jsp">【尾单特卖】全国-曼谷6-7天自由行 泰国出境旅游 特价往6-7天自由行 泰国出境旅游 特价往..</a></h4>
                        <p>
                            <b class="price">&yen;<span>899</span>起</b>
                            <span class="shouchang">已收藏450次</span>
                        </p>
                    </li>
                    <li>
                        <span class="num">4</span>
                         <a href="route_detail.jsp"><img src="../images/jiangxuan_4.jpg" alt=""></a>
                        <h4><a href="route_detail.jsp">【尾单特卖】全国-曼谷6-7天自由行 泰国出境旅游 特价往6-7天自由行 泰国出境旅游 特价往..</a></h4>
                        <p>
                            <b class="price">&yen;<span>899</span>起</b>
                            <span class="shouchang">已收藏450次</span>
                        </p>
                    </li>
                    <li>
                        <span class="num">5</span>
                         <a href="route_detail.jsp"><img src="../images/jiangxuan_4.jpg" alt=""></a>
                        <h4><a href="route_detail.jsp">【尾单特卖】全国-曼谷6-7天自由行 泰国出境旅游 特价往6-7天自由行 泰国出境旅游 特价往..</a></h4>
                        <p>
                            <b class="price">&yen;<span>899</span>起</b>
                            <span class="shouchang">已收藏450次</span>
                        </p>
                    </li>
                    <li>
                        <span class="num">6</span>
                         <a href="route_detail.jsp"><img src="../images/jiangxuan_4.jpg" alt=""></a>
                        <h4><a href="route_detail.jsp">【尾单特卖】全国-曼谷6-7天自由行 泰国出境旅游 特价往6-7天自由行 泰国出境旅游 特价往..</a></h4>
                        <p>
                            <b class="price">&yen;<span>899</span>起</b>
                            <span class="shouchang">已收藏450次</span>
                        </p>
                    </li>
                    <li>
                        <span class="num">7</span>
                         <a href="route_detail.jsp"><img src="../images/jiangxuan_4.jpg" alt=""></a>
                        <h4><a href="route_detail.jsp">【尾单特卖】全国-曼谷6-7天自由行 泰国出境旅游 特价往6-7天自由行 泰国出境旅游 特价往..</a></h4>
                        <p>
                            <b class="price">&yen;<span>899</span>起</b>
                            <span class="shouchang">已收藏450次</span>
                        </p>
                    </li>
                    <li>
                        <span class="num">8</span>
                        <a href="route_detail.jsp"><img src="../images/jiangxuan_4.jpg" alt=""></a>
                        <h4><a href="route_detail.jsp">【尾单特卖】全国-曼谷6-7天自由行 泰国出境旅游 特价往6-7天自由行 泰国出境旅游 特价往..</a></h4>
                        <p>
                            <b class="price">&yen;<span>899</span>起</b>
                            <span class="shouchang">已收藏450次</span>
                        </p>
                    </li>--%>
                </ul>
            </div>

            <%--用于数据接收--%>
            <%--<input type="hidden" id="searchroute"  value="${sessionScope.searchroute}"/>
            <input type="hidden" id="pricelow" value="${sessionScope.pricelow}"/>
            <input type="hidden" id="pricehigh" value="${sessionScope.pricehigh}"/>--%>
            <%--分页--%>
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
    	
         <!--导入底部-->
   		 <div id="footer"></div>
    <!--导入布局js，共享header和footer-->
    <script type="text/javascript" src="../../js/include.js"></script>
    </body>
</html>