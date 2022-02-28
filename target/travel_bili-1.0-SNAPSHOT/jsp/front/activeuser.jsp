<%--
  Created by IntelliJ IDEA.
  User: DSY
  Date: 2021/2/14
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>自动跳转</title>
    <link rel="stylesheet" type="text/css" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/register.css">
    <!--导入jquery-->
    <script src="../../js/jquery-3.3.1.js"></script>
   <%-- <style>
        p{
            margin-top: 200px;
            text-align: center;
            size: 50px;
        }
        span{
            color: red;
        }
    </style>--%>
</head>
<body>
<!--引入头部-->
<div id="header"></div>
<!-- 头部 end -->
<body>

<div style="text-align:center;red:yellow;font-weight:bold;height:150px;padding-top:100px;font-size:30px;">
    <h4>${msg},<span id="time" style="color: red">5</span>秒之后，自动跳转至首页...</h4>

</div>




<script language=javascript>
    /*
    分析：
       1.显示页面效果<p>
       2.倒计时读秒效果实现
         2.1定义一个方法，获取span标签，修改span标签体内容，时间--
         2.2定义一个定时器，1秒执行一次该方法
       3.在方法中判断时间如果《=0，则跳转至首页
     */
    //2.倒计时读秒效果实现
    var second = 5;
    var time = document.getElementById("time");

    function showTime() {
        second--;
        console.log(second);
        if(second <= 0){
            //跳转至首页
            console.log("进入"+second);
            location.href = "http://localhost:8080/jsp/front/index.jsp";
            console.log("出去"+second);

        }
        time.innerHTML = second + "";

    }


    //设置定时器，1秒执行一次该方法
    setInterval(showTime,1000);

</script>

</body>
<!--引入尾部-->
<div id="footer"></div>
<!--导入布局js，共享header和footer-->
<script type="text/javascript" src="../../js/include.js"></script>
