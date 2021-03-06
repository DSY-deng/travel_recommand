<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="商城">
    <meta name="description" content="">
    <title>购物车</title>

    <link href="/plugins/zui/css/zui.css" rel="stylesheet">
    <link href="/plugins/zui/css/zui-theme.css" rel="stylesheet">
    <link href="/css/my.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="/plugins/zui/lib/ieonly/html5shiv.js"></script>
    <script src="/plugins/zui/lib/ieonly/respond.js"></script>
    <script src="/plugins/zui/lib/ieonly/excanvas.js"></script>
    <![endif]-->
</head>
<body>


<div id="top"></div>

<!-- 主内容 -->
<div class="wrapper" style="min-height: 500px;">
    <form action="/pay/createPayForm" method="post">
    <ul>
        <li><input type="radio" name="checkway" value="weixin">微信</li>
        <li><input type="radio" name="checkway" value="alipay">支付宝</li>
    </ul>
    <input type="hidden" name="orderNumber" id="orderNumber"/>
        <input type="hidden" name="payMoney" id="payMoney"/>
    <input type="submit" value="开始支付" id="btn_check"/>
    </form>
</div>
<!-- /主内容 -->

<div id="bottom"></div>

<script src="/plugins/zui/lib/jquery/jquery.js"></script>
<script src="/js/jquery.scrollUp.min.js"></script>
<script src="/plugins/zui/js/zui.js"></script>
<script src="/js/include.js"></script>
<script src="/js/my.js"></script>

<script>
    $(function(){
        //接受上一张页面传过来的订单号和支付金额
       var orderNumber = window.location.search.split("&")[0].split("=")[1]
        var payment_price = window.location.search.split("&")[1].split("=")[1]

        $("#orderNumber").val(orderNumber);
        $("#payMoney").val(payment_price);

        //为开始支付按钮添加点击事件
        /*$("btn_check").click(function () {
            $.ajax({
                url:"/pay/createPayForm",
                data:{"orderNumber":orderNumber,"checkway":$("input[name='checkway']:checked").val()},
                async:false,//表示的发送的是一个同步请求，不是一个异步请求
            })
        })*/
    })

</script>


</body>
</html>