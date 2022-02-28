<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>黑马旅游网-我的收藏</title>
        <link href="../../css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="../../css/common.css">
        <link rel="stylesheet" href="../../css/index.css">
       <style>
           .tab-content .row>div {
            margin-top: 16px;
           } 
           .tab-content {
            margin-bottom: 36px;
           }
       </style>
       <script src="../../js/jquery-3.3.1.js"></script>
        <script>
            $(function () {
               // var rid = getParameter("rid");
//            1、判断用户是否登录
                $.get("/isLogin",{},function (data) {
                    //alert(data.message);
//                服务器从sesson中返回的usr对象,如果不为null
                    if (data.flag){
//                  用户登陆了
                        var uid = data.message;
                        //alert(uid);
                        $.get("/showMyfavorite",{uid:uid},function (data) {
                           // alert(data.message);
                            if(data){
                                //           2、 列表数据显示
                                var route_lis = "";
                                //遍历数组，拼接字符串标签
                                for (var i = 0; i < data.length ; i++){
                                    var route = data[i];
                                    var route_li = '<div class="col-md-3">\n' +
                                        '<a href="route_detail.jsp?rid='+route.rid+'&cname='+route.category.cname+'">\n' +
                                        '<img src=../../'+route.route.rimage+' alt="">\n' +
                                        '<div class="has_border">\n' +
                                        '<h3>'+route.route.routeintroduce+'</h3>\n' +
                                        '<div class="price">网付价<em>￥</em><strong>'+route.route.price+'</strong><em>起</em></div>\n' +
                                        '</div>\n' +
                                        '</a>\n' +
                                        '</div>';
                                    route_lis += route_li;
                                }
//                将route_lis内容设置到ul
                                $("#showMyfavoriteRoute").html(route_lis);
                            }else{

                            }
                        });
                    }else {
//                    用户没有登录
                        alert("您尚未登录，请登录！");

                        location.href="login.jsp";

                    }
                });
            })
        </script>
    </head>
    <body>
    <!--引入头部-->
    <div id="header"></div>
         <!-- 排行榜 start-->
        <section id="content">            
            <section class="hemai_jx">
                <div class="jx_top">
                    <div class="jx_tit">
                        <img src="../../images/icon_5.jpg" alt="">
                        <span>我的收藏</span>
                    </div>                    
                </div>
                <div class="jx_content">
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home">
                            <div id="showMyfavoriteRoute" class="row">
                                <%-- <div class="col-md-3">
                                     <a href="route_detail.jsp">
                                         <img src="../images/collection_pic.jpg" alt="">
                                         <div class="has_border">
                                             <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                             <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                         </div>
                                     </a>
                                </div>
 <%--                                <div class="col-md-3">
                                     <a href="route_detail.jsp">
                                         <img src="../images/collection_pic.jpg" alt="">
                                         <div class="has_border">
                                             <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                             <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                         </div>
                                     </a>
                                 </div>
                                 <div class="col-md-3">
                                     <a href="route_detail.jsp">
                                         <img src="../images/collection_pic.jpg" alt="">
                                         <div class="has_border">
                                             <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                             <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                         </div>
                                     </a>
                                 </div>
                                 <div class="col-md-3">
                                     <a href="route_detail.jsp">
                                         <img src="../images/collection_pic.jpg" alt="">
                                         <div class="has_border">
                                             <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                             <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                         </div>
                                     </a>
                                 </div>
                                 <div class="col-md-3">
                                     <a href="route_detail.jsp">
                                         <img src="../images/collection_pic.jpg" alt="">
                                         <div class="has_border">
                                             <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                             <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                         </div>
                                     </a>
                                 </div>
                                 <div class="col-md-3">
                                     <a href="route_detail.jsp">
                                         <img src="../images/collection_pic.jpg" alt="">
                                         <div class="has_border">
                                             <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                             <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                         </div>
                                     </a>
                                 </div>
                                 <div class="col-md-3">
                                     <a href="route_detail.jsp">
                                         <img src="../images/collection_pic.jpg" alt="">
                                         <div class="has_border">
                                             <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                             <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                         </div>
                                     </a>
                                 </div>
                                 <div class="col-md-3">
                                     <a href="route_detail.jsp">
                                         <img src="../images/collection_pic.jpg" alt="">
                                         <div class="has_border">
                                             <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                             <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                         </div>
                                     </a>
                                 </div>
                                  <div class="col-md-3">
                                     <a href="route_detail.jsp">
                                         <img src="../images/collection_pic.jpg" alt="">
                                         <div class="has_border">
                                             <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                             <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                         </div>
                                     </a>
                                 </div>
                                 <div class="col-md-3">
                                     <a href="route_detail.jsp">
                                         <img src="../images/collection_pic.jpg" alt="">
                                         <div class="has_border">
                                             <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                             <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                         </div>
                                     </a>
                                 </div>
                                 <div class="col-md-3">
                                     <a href="route_detail.jsp">
                                         <img src="../images/collection_pic.jpg" alt="">
                                         <div class="has_border">
                                             <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                             <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                         </div>
                                     </a>
                                 </div>
                                 <div class="col-md-3">
                                     <a href="jroute_detail.html">
                                         <img src="../images/collection_pic.jpg" alt="">
                                         <div class="has_border">
                                             <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                             <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                         </div>
                                     </a>
                                 </div>--%>
                            </div>
                        </div>                       
                    </div>
                </div>
                <div class="pageNum">
                    <ul>
                      <%--  <li><a href="">首页</a></li>
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
            </section>                      
        </section>
        <!-- 排行榜 end-->
    	
         <!--引入尾部-->
    	<div id="footer"></div>
        <!--导入布局js，共享header和footer-->
        <script type="text/javascript" src="../../js/include.js"></script>
    </body>
</html>