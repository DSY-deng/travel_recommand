<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%--<c:if test="${sessionScope.userSession==null}">
    <script>
        /*此处防止进入需用重定向*/
        window.Location.href="${pageContext.request.contextPath}/login.jsp"
    </script>
</c:if>--%>
<html>
<head lang="en">
    <meta charset="UTF-8">

<script src="../../js/getParameter.js"></script>
<script>
    $(function () {
//        查询用户信息
       $.post("/showUsername",{},function (data) {
//           data: {uid:1,name:'李四'}
           console.log(data);
           if (data.flag){
           var msg = "欢迎回来，"+data.message;
           $("#span_name").html(msg);
           /*var elementsByClassName = document.getElementsByClassName("login_out");
           console.log(elementsByClassName);*/
           }
       });


//       查询分类数据
        $.get("/showAllCategory",{},function (data) {
//            data : {cid:1,cname:国内游}
            console.log(data);
            var lis = '<li class="nav-active"><a href="/jsp/front/index.jsp">首页</a></li>';
//            遍历数组,拼接字符串<li>
            for (var i = 0;i < data.length;i++){
                var li = '<li><a href="/jsp/front/route_list.jsp?cid='+data[i].cid+'&cname='+data[i].cname+'">'+data[i].cname+'</a></li>'
                lis += li;
            }


//            拼接收藏排行榜的li
            lis += '<li><a href="/jsp/front/favoriterank.jsp">收藏排行榜</a></li>';
            lis += '<li><a href="/jsp/view_cart.jsp">购物车</a></li>';
//            将lis字符串设置到ul的html内容中
            $("#category").html(lis);
        });

//        给搜索按钮绑定单击事件，获取搜索输入框内容
        $("#search-button").click(function (){
//            线路名称
            var rname = $("#search_input").val();
            var cid = getParameter("cid");

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
           location.href="http://localhost:8080/jsp/front/route_list.jsp?cid="+cid+"&rname="+rname;
        });

    });

</script>


<!-- 头部 start -->
    <header id="header">
        <div class="top_banner">
            <%--<img src="../../images/top_banner.jpg" alt="">--%>
                <img src="../../images/title.jpg" style="width: 1700px;height: 127px" alt="">
        </div>
        <div class="shortcut">
            <!-- 未登录状态  -->
            <div class="login_out">
                <a href="http://localhost:8080/jsp/front/login.jsp">登录</a>
                <a href="http://localhost:8080/jsp/front/register.jsp">注册</a>
            </div>
            <!-- 登录状态  -->
            <div class="login">
            	
                <span id="span_name"></span>
                <a href="http://localhost:8080/jsp/front/myfavorite.jsp" class="collection">我的收藏</a>
                <a href="javascript:location.href='http://localhost:8080/loginOut';">退出</a>
            </div>
        </div>
        <div class="header_wrap">
            <div class="topbar">
                <div class="logo">
                    <%--<a href="/"><img src="../../images/logo.jpg" alt=""></a>--%>
                    <a href="/"><img src="../../images/schoollogo.jpg" style="width: 200px;height: 55px;margin-left: 50px" alt=""></a>
                </div>
                <div class="search">
                    <input name="" type="text" placeholder="请输入路线名称" id="search_input" class="search_input" autocomplete="off">
                    <a href="javascript:;" id="search-button" class="search-button">搜索</a>
                </div>
                <div class="hottel">
                    <div class="hot_pic">
                        <img src="../../images/hot_tel.jpg" alt="">
                    </div>
                    <div class="hot_tel">
                        <p class="hot_time">客服热线(9:00-6:00)</p>
                        <p class="hot_num">400-618-9090</p>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- 头部 end -->
     <!-- 首页导航 -->
    <div class="navitem">
        <ul class="nav" id="category">
            <!--<li class="nav-active"><a href="index.jsp">首页</a></li>
            <li><a href="route_list.jsp">门票</a></li>
            <li><a href="route_list.jsp">酒店</a></li>
            <li><a href="route_list.jsp">香港车票</a></li>
            <li><a href="route_list.jsp">出境游</a></li>
            <li><a href="route_list.jsp">国内游</a></li>
            <li><a href="route_list.jsp">港澳游</a></li>
            <li><a href="route_list.jsp">抱团定制</a></li>
            <li><a href="route_list.jsp">全球自由行</a></li>
            <li><a href="favoriterank.jsp">收藏排行榜</a></li>-->
        </ul>
    </div>
    