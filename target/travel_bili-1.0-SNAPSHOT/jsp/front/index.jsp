<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>黑马旅游网</title>
    <!-- Bootstrap -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/common.css">
    <link rel="stylesheet" type="text/css" href="../../css/index.css">
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../../js/jquery-3.3.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../../js/bootstrap.min.js"></script>
    <!--导入布局js，共享header和footer-->
    <script type="text/javascript" src="../../js/include.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        $(function () {
     // 发送请求数据，显示全部收藏最高的数据
            $.get("/selectTop",{},function (data) {
                //           2、 列表数据显示
                var route_lis = "";
                console.log("内容："+data);
                console.log("长度："+data.length);
                //遍历数组，拼接字符串标签
                for (var i = 0; i < 4 ; i++){
                    var routeTop = data[i];
                    var route_li = '<div class="col-md-3">' +
                        '<a href="route_detail.jsp?rid='+routeTop.rid+'&cname='+routeTop.category.cname+'">\n' +
                        '                                    <img src=../../'+routeTop.rimage+' alt="">\n' +
                        '                                    <div class="has_border">\n' +
                        '                                        <h3>'+ routeTop.routeintroduce +'</h3>\n' +
                        '                                        <div class="price">网付价<em>￥</em><strong>'+routeTop.price+'</strong><em>起</em></div>\n' +
                        '                                    </div>\n' +
                        '                                </a></div>';
                        route_lis += route_li;
                }
//                将route_lis内容设置到ul
                $("#selectTop").html(route_lis);

            })

            // 发送请求数据，显示国内收藏最高的数据
            $.get("/selectInternalTop",{},function (data) {
                //           2、 列表数据显示
                var route_lis = "";
                console.log("内容："+data);
                console.log("长度："+data.length);
                //遍历数组，拼接字符串标签
                for (var i = 0; i < 6 ; i++){
                    var routeIn = data[i];
                    var route_li = '<div class="col-md-4">\n' +
                        '<a href="route_detail.jsp?rid='+routeIn.rid+'&cname='+routeIn.category.cname+'">\n' +
                        '<img src=../../'+routeIn.rimage+' alt="">\n' +
                        '<div class="has_border">\n' +
                        '<h3>'+routeIn.routeintroduce+'</h3>\n' +
                        '<div class="price">网付价<em>￥</em><strong>'+routeIn.price+'</strong><em>起</em></div>\n' +
                        '</div>\n' +
                        '</a>\n' +
                        '</div>';
                    route_lis += route_li;
                }
//                将route_lis内容设置到ul
                $("#guonei").html(route_lis);

            })

            // 发送请求数据，显示国外收藏最高的数据
            $.get("/selectOutTop",{},function (data) {
                //           2、 列表数据显示
                var route_lis = "";
                console.log("内容："+data);
                console.log("长度："+data.length);
                //遍历数组，拼接字符串标签
                for (var i = 0; i < 6 ; i++){
                    var routeOut = data[i];
                    var route_li = '<div class="col-md-4">\n' +
                        '<a href="route_detail.jsp?rid='+routeOut.rid+'&cname='+routeOut.category.cname+'">\n' +
                        ' <img src=../../'+routeOut.rimage+' alt="">\n' +
                        ' <div class="has_border">\n' +
                        ' <h3>'+routeOut.routeintroduce+'</h3>\n' +
                        ' <div class="price">网付价<em>￥</em><strong>'+routeOut.price+'</strong><em>起</em></div>\n' +
                        ' </div>\n' +
                        ' </a>\n' +
                        ' </div>';
                    route_lis += route_li;
                }
//                将route_lis内容设置到ul
                $("#guowai").html(route_lis);

            })


        })


    </script>
</head>
<body>
	<!--引入头部-->
    <div id="header"></div>
    <!-- banner start-->
    <section id="banner">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="2000">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>
            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="../../images/lunbo2.jpg" style="width: 1500px;height: 399px" alt="">
                </div>
                <div class="item">
                    <img src="../../images/lubo.jpg" style="width: 1500px;height: 399px" alt="">
                </div>
                <div class="item">
                    <img src="../../images/banner_2.jpg" alt="">
                </div>
            </div>
            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
        </div>
    </section>
    <!-- banner end-->
    <!-- 旅游 start-->
    <section id="content">
         <!-- 黑马精选start-->
        <section class="hemai_jx">
            <div class="jx_top">
                <div class="jx_tit">
                    <img src="../../images/icon_5.jpg" alt="">
                    <span>旅游精选</span>
                </div>
                <!-- Nav tabs -->
                <%--<ul class="jx_tabs" role="tablist">
                    <li role="presentation" class="active">
                        <span></span>
                        <a href="#popularity" aria-controls="popularity" role="tab" data-toggle="tab">人气旅游</a>
                    </li>
                    <li role="presentation">
                        <span></span>
                        <a href="#newest" aria-controls="newest" role="tab" data-toggle="tab">最新旅游</a>
                    </li>
                    <li role="presentation">
                        <span></span>
                        <a href="#theme" aria-controls="theme" role="tab" data-toggle="tab">主题旅游</a>
                    </li>
                </ul>--%>
            </div>


            <div class="jx_content">
                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="popularity">
                        <div id="selectTop" class="row">
                            <%--<div class="col-md-3">
                                <a href="javascript:;">
                                    <img src="../images/jiangxuan_4.jpg" alt="">
                                    <div class="has_border">
                                        <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                        <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="javascript:;">
                                    <img src="../images/jiangxuan_4.jpg" alt="">
                                    <div class="has_border">
                                        <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                        <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="javascript:;">
                                    <img src="../images/jiangxuan_4.jpg" alt="">
                                    <div class="has_border">
                                        <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                        <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="javascript:;">
                                    <img src="../images/jiangxuan_4.jpg" alt="">
                                    <div class="has_border">
                                        <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                        <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                    </div>
                                </a>
                            </div>--%>
                        </div>
                    </div>
                    <%--好像没啥用开始--%>
                    <div role="tabpanel" class="tab-pane" id="newest">
                        <div class="row">
                            <div class="col-md-3">
                                <a href="javascript:;">
                                    <img src="../../images/jiangxuan_1.jpg" alt="">
                                    <div class="has_border">
                                        <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                        <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="javascript:;">
                                    <img src="../../images/jiangxuan_1.jpg" alt="">
                                    <div class="has_border">
                                        <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                        <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="javascript:;">
                                    <img src="../../images/jiangxuan_1.jpg" alt="">
                                    <div class="has_border">
                                        <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                        <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="javascript:;">
                                    <img src="../../images/jiangxuan_1.jpg" alt="">
                                    <div class="has_border">
                                        <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                        <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="theme">
                        <div class="row">
                            <div class="col-md-3">
                                <a href="javascript:;">
                                    <img src="../../images/jiangxuan_2.jpg" alt="">
                                    <div class="has_border">
                                        <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                        <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="javascript:;">
                                    <img src="../../images/jiangxuan_2.jpg" alt="">
                                    <div class="has_border">
                                        <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                        <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="javascript:;">
                                    <img src="../../images/jiangxuan_2.jpg" alt="">
                                    <div class="has_border">
                                        <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                        <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="javascript:;">
                                    <img src="../../images/jiangxuan_2.jpg" alt="">
                                    <div class="has_border">
                                        <h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
                                        <div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <%--好像没啥用结束--%>
                </div>
            </div>
        </section>
        <!-- 黑马精选end-->
        <!-- 国内游 start-->
        <section class="hemai_jx">
            <div class="jx_top">
                <div class="jx_tit">
                    <img src="../../images/icon_6.jpg" alt="">
                    <span>国内游</span>
                </div>
            </div>
            <div class="heima_gn">
                <div class="guonei_l">
                    <img src="../../images/guoneii_1.jpg" style="width: 360px;height: 488px" alt="">
                </div>
                <div class="guone_r">
                    <div id="guonei" class="row">
                       <%-- <div class="col-md-4">
                            <a href="route_detail.jsp">
								<img src="../images/jiangxuan_4.jpg" alt="">
								<div class="has_border">
									<h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
									<div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>									
								</div>
							</a>
                        </div>
                        <div class="col-md-4">
                            <a href="route_detail.jsp">
								<img src="../images/jiangxuan_4.jpg" alt="">
								<div class="has_border">
									<h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
									<div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>									
								</div>
							</a>
                        </div>
                        <div class="col-md-4">
                            <a href="route_detail.jsp">
								<img src="../images/jiangxuan_4.jpg" alt="">
								<div class="has_border">
									<h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
									<div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>									
								</div>
							</a>
                        </div>
                        <div class="col-md-4">
                            <a href="route_detail.jsp">
								<img src="../images/jiangxuan_4.jpg" alt="">
								<div class="has_border">
									<h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
									<div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>									
								</div>
							</a>
                        </div>
                        <div class="col-md-4">
                            <a href="route_detail.jsp">
									<img src="../images/jiangxuan_4.jpg" alt="">
								<div class="has_border">
									<h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
									<div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>									
								</div>
							</a>
                        </div>
                        <div class="col-md-4">
                            <a href="route_detail.jsp">
								<img src="../images/jiangxuan_4.jpg" alt="">
								<div class="has_border">
									<h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
									<div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>									
								</div>
							</a>
                        </div>--%>
                    </div>
                </div>
            </div>
        </section>
        <!-- 国内游 end-->
        <!-- 境外游 start-->
        <section class="hemai_jx">
            <div class="jx_top">
                <div class="jx_tit">
                    <img src="../../../images/icon_7.jpg" alt="">
                    <span>境外游</span>
                </div>
            </div>
            <div class="heima_gn">
                <div class="guonei_l">
                    <img src="../../../images/jingwaii_3.jpg" style="width: 360px;height: 488px"  alt="">
                </div>
                <div class="guone_r">
                    <div id="guowai" class="row">
<%--                        <div class="col-md-4">
                            <a href="route_detail.jsp">
								<img src="../images/jiangxuan_4.jpg" alt="">
								<div class="has_border">
									<h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
									<div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>									
								</div>
							</a>
                        </div>
                        <div class="col-md-4">
                            <a href="route_detail.jsp">
								<img src="../images/jiangxuan_4.jpg" alt="">
								<div class="has_border">
									<h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
									<div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>									
								</div>
							</a>
                        </div>
                        <div class="col-md-4">
                            <a href="route_detail.jsp">
								<img src="../images/jiangxuan_4.jpg" alt="">
								<div class="has_border">
									<h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
									<div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>									
								</div>
							</a>
                        </div>
                        <div class="col-md-4">
                            <a href="route_detail.jsp">
								<img src="../images/jiangxuan_4.jpg" alt="">
								<div class="has_border">
									<h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
									<div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>									
								</div>
							</a>
                        </div>
                        <div class="col-md-4">
                            <a href="route_detail.jsp">
									<img src="../images/jiangxuan_4.jpg" alt="">
								<div class="has_border">
									<h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
									<div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>									
								</div>
							</a>
                        </div>
                        <div class="col-md-4">
                            <a href="route_detail.jsp">
								<img src="../images/jiangxuan_4.jpg" alt="">
								<div class="has_border">
									<h3>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</h3>
									<div class="price">网付价<em>￥</em><strong>889</strong><em>起</em></div>									
								</div>
							</a>
                        </div>--%>
                    </div>
                </div>
            </div>
        </section>
        <!-- 境外游 end-->
    </section>
    <!-- 旅游 end-->
   <!--导入底部-->
    <div id="footer"></div>

</body>
</html>