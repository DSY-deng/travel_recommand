<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <meta charset="utf-8">
    <title>路线详情</title>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../css/common.css">
    <link rel="stylesheet" type="text/css" href="../../css/route-detail.css">
</head>

<body>
<!--引入头部-->
<div id="header"></div>
    <!-- 详情 start -->   
    <div class="wrap">
        <div class="bread_box">
            <a href="/jsp/front/index.jsp">首页</a>
            <span>>&gt;</span>
            <span id="Inner"><a href="#">国内游</a></span>><span> ></span>
            <span id="routeIntroduce"><a href="#">全国-曼谷6-7天自由行 泰国出境旅游 特价往返机票自由行二次确认</a></span>

        </div>
        <div class="prosum_box">
            <dl class="prosum_left">
                <dt>
                    <img alt="" class="big_img" src="http://www.jinmalvyou.com/Public/uploads/goods_img/img_size4/201703/m49788843d72171643297ccc033d9288ee.jpg">
                </dt>
                <dd id="dd">
                    <a class="up_img up_img_disable"></a>
                    <a title="" class="little_img" data-bigpic="http://www.jinmalvyou.com/Public/uploads/goods_img/img_size4/201703/m40920d0669855e745d97f9ad1df966ebb.jpg">
                        <img src="http://www.jinmalvyou.com/Public/uploads/goods_img/img_size2/201703/m20920d0669855e745d97f9ad1df966ebb.jpg">
                    </a>
                    <a title="" class="little_img cur_img" data-bigpic="http://www.jinmalvyou.com/Public/uploads/goods_img/img_size4/201703/m49788843d72171643297ccc033d9288ee.jpg">
                        <img src="http://www.jinmalvyou.com/Public/uploads/goods_img/img_size2/201703/m29788843d72171643297ccc033d9288ee.jpg">
                    </a>
                    <a title="" class="little_img" data-bigpic="http://www.jinmalvyou.com/Public/uploads/goods_img/img_size4/201703/m4531a8dbceefa2c44e6d0e35627cd2689.jpg">
                        <img src="http://www.jinmalvyou.com/Public/uploads/goods_img/img_size2/201703/m2531a8dbceefa2c44e6d0e35627cd2689.jpg">
                    </a>
                    <a title="" class="little_img" data-bigpic="http://www.jinmalvyou.com/Public/uploads/goods_img/img_size4/201703/m46d8cb900e9f6c0a762aca19eae40c00c.jpg">
                        <img src="http://www.jinmalvyou.com/Public/uploads/goods_img/img_size2/201703/m26d8cb900e9f6c0a762aca19eae40c00c.jpg">
                    </a>
                    <a title="" class="little_img" data-bigpic="http://www.jinmalvyou.com/Public/uploads/goods_img/img_size4/201703/m45ea00f6eba562a767b5095bbf8cffe07.jpg" style="display:none;">
                        <img src="http://www.jinmalvyou.com/Public/uploads/goods_img/img_size2/201703/m25ea00f6eba562a767b5095bbf8cffe07.jpg">
                    </a>
                    <a title="" class="little_img" data-bigpic="http://www.jinmalvyou.com/Public/uploads/goods_img/img_size4/201703/m4265ec488cd1bc7ce749bc8c9b34b87bc.jpg" style="display:none;">
                        <img src="http://www.jinmalvyou.com/Public/uploads/goods_img/img_size2/201703/m2265ec488cd1bc7ce749bc8c9b34b87bc.jpg">
                    </a>
                    <a title="" class="little_img" data-bigpic="http://www.jinmalvyou.com/Public/uploads/goods_img/img_size4/201703/m4e7e964909d7dd1a9f6e5494d4dc0c847.jpg" style="display:none;">
                        <img src="http://www.jinmalvyou.com/Public/uploads/goods_img/img_size2/201703/m2e7e964909d7dd1a9f6e5494d4dc0c847.jpg">
                    </a>
                    <a title="" class="little_img" data-bigpic="http://www.jinmalvyou.com/Public/uploads/goods_img/img_size4/201703/m467db00e1b76718fab0fe8b96e10f4d35.jpg" style="display:none;">
                        <img src="http://www.jinmalvyou.com/Public/uploads/goods_img/img_size2/201703/m267db00e1b76718fab0fe8b96e10f4d35.jpg">
                    </a>
                    <a title="" class="little_img" data-bigpic="http://www.jinmalvyou.com/Public/uploads/goods_img/img_size4/201703/m487bbbc6e43eba6aa6a36cc1a182f7a20.jpg" style="display:none;">
                        <img src="http://www.jinmalvyou.com/Public/uploads/goods_img/img_size2/201703/m287bbbc6e43eba6aa6a36cc1a182f7a20.jpg">
                    </a>
                    <a class="down_img down_img_disable" style="margin-bottom: 0;"></a>
                </dd>
            </dl>
            <div class="prosum_right">
               <p class="pros_title" id="rname">【尾单特卖】全国-曼谷6-7天自由行 泰国出境旅游 特价往返机票自由行二次确认</p>
                <p class="hot" id="">1-2月出发，网付立享￥1099/2人起！爆款位置有限，抢完即止！</p>
                <div class="pros_other">
                    <p>经营商家  ：<span id="sname">武汉轻工大学</span></p>
                    <p>咨询电话 : <span id="consphone">111-222-333</span></p>
                    <p>地址 ： <span id="address">湖北省武汉市东西湖区环湖中路36号 </span></p>
                </div>
                <div class="pros_price">
                    <p class="price"><strong id="price">¥2699.00</strong><span>起</span></p>
                    <p class="collect">
                        <a class="btn" id="shopping" onclick="InterShop();"><i class="glyphicon glyphicon-heart-empty"></i>加入购物车</a>
                        <a class="btn" id="favorite" onclick="addFavorite();"><i class="glyphicon glyphicon-heart-empty"></i>点击收藏</a>

                       <!-- <a  class="btn already" disabled="disabled"><i class="glyphicon glyphicon-heart-empty"></i>点击收藏</a>-->
                        <span id="favoriteCount">已收藏100次</span>
                    </p>
                </div>        
            </div>
        </div>
        <div class="you_need_konw">
            <span>旅游须知</span>
            <div class="notice">
                <p>1、旅行社已投保旅行社责任险。建议游客购买旅游意外保险 <br>

                <p>2、旅游者参加打猎、潜水、海边游泳、漂流、滑水、滑雪、滑草、蹦极、跳伞、滑翔、乘热气球、骑马、赛车、攀岩、水疗、水上飞机等属于高风险性游乐项目的，敬请旅游者务必在参加前充分了解项目的安全须知并确保身体状况能适应此类活动；如旅游者不具备较好的身体条件及技能，可能会造成身体伤害。</p>

                <p>3、参加出海活动时，请务必穿着救生设备。参加水上活动应注意自己的身体状况，有心脏病、冠心病、高血压、感冒、发烧和饮酒及餐后不可以参加水上活动及潜水。在海里活动时，严禁触摸海洋中各种鱼类，水母，海胆，珊瑚等海洋生物，避免被其蛰伤。老人和小孩必须有成年人陪同才能参加合适的水上活动。在海边游玩时，注意保管好随身携带的贵重物品。</p>

                <p>4、根据中国海关总署的规定，旅客在境外购买的物品，在进入中国海关时可能需要征收关税。详细内容见《中华人民共和国海关总署公告2010年第54号文件》。</p>

                <p>5、建议出发时行李托运，贵重物品、常用物品、常用药品、御寒衣物等请随身携带，尽量不要托运。行李延误属于不可抗力因素，我司将全力协助客人跟进后续工作，但我司对此不承担任何责任。</p>
                <p>1、旅行社已投保旅行社责任险。建议游客购买旅游意外保险 <br>

                <p>2、旅游者参加打猎、潜水、海边游泳、漂流、滑水、滑雪、滑草、蹦极、跳伞、滑翔、乘热气球、骑马、赛车、攀岩、水疗、水上飞机等属于高风险性游乐项目的，敬请旅游者务必在参加前充分了解项目的安全须知并确保身体状况能适应此类活动；如旅游者不具备较好的身体条件及技能，可能会造成身体伤害。</p>

                <p>3、参加出海活动时，请务必穿着救生设备。参加水上活动应注意自己的身体状况，有心脏病、冠心病、高血压、感冒、发烧和饮酒及餐后不可以参加水上活动及潜水。在海里活动时，严禁触摸海洋中各种鱼类，水母，海胆，珊瑚等海洋生物，避免被其蛰伤。老人和小孩必须有成年人陪同才能参加合适的水上活动。在海边游玩时，注意保管好随身携带的贵重物品。</p>

                <p>4、根据中国海关总署的规定，旅客在境外购买的物品，在进入中国海关时可能需要征收关税。详细内容见《中华人民共和国海关总署公告2010年第54号文件》。</p>

                <p>5、建议出发时行李托运，贵重物品、常用物品、常用药品、御寒衣物等请随身携带，尽量不要托运。行李延误属于不可抗力因素，我司将全力协助客人跟进后续工作，但我司对此不承担任何责任。</p>
            </div>           
        </div>
    </div>
    <!-- 详情 end -->

    <!--引入头部-->
    <div id="footer"></div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../../js/jquery-3.3.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../../js/bootstrap.min.js"></script>
    <!--导入布局js，共享header和footer-->
    <script type="text/javascript" src="../../js/include.js"></script>
    <script src="../../js/getParameter.js"></script>
    <script>
    $(document).ready(function() {
        goImg();
        //自动播放
        // var timer = setInterval("auto_play()", 5000);
    });

    function goImg() {

        //焦点图效果
        //点击图片切换图片
        $('.little_img').on('mousemove', function() {
            $('.little_img').removeClass('cur_img');
            var big_pic = $(this).data('bigpic');
            $('.big_img').attr('src', big_pic);
            $(this).addClass('cur_img');
        });
        //上下切换
        var picindex = 0;
        var nextindex = 4;
        $('.down_img').on('click',function(){
            var num = $('.little_img').length;
            if((nextindex + 1) <= num){
                $('.little_img:eq('+picindex+')').hide();
                $('.little_img:eq('+nextindex+')').show();
                picindex = picindex + 1;
                nextindex = nextindex + 1;
            }
        });
        $('.up_img').on('click',function(){
            var num = $('.little_img').length;
            if(picindex > 0){
                $('.little_img:eq('+(nextindex-1)+')').hide();
                $('.little_img:eq('+(picindex-1)+')').show();
                picindex = picindex - 1;
                nextindex = nextindex - 1;
            }
        });

    }



    //自动轮播方法
    function auto_play() {
        var cur_index = $('.prosum_left dd').find('a.cur_img').index();
        cur_index = cur_index - 1;
        var num = $('.little_img').length;
        var max_index = 3;
        if ((num - 1) < 3) {
            max_index = num - 1;
        }
        if (cur_index < max_index) {
            var next_index = cur_index + 1;
            var big_pic = $('.little_img:eq(' + next_index + ')').data('bigpic');
            $('.little_img').removeClass('cur_img');
            $('.little_img:eq(' + next_index + ')').addClass('cur_img');
            $('.big_img').attr('src', big_pic);
        } else {
            var big_pic = $('.little_img:eq(0)').data('bigpic');
            $('.little_img').removeClass('cur_img');
            $('.little_img:eq(0)').addClass('cur_img');
            $('.big_img').attr('src', big_pic);
        }
    }

    /* json格式
    * {
	"rid": 1,
	"rname": "【旅展 半价特惠 重走丝路•漫游宁夏 双飞4天】银川西部影视城 穆民新村 中卫沙坡头【品美酒 回族学唱花儿 感悟民俗】",
	"price": 999.0,
	"routeIntroduce": "走进【宁夏沙坡头】，感受西北大漠风情、体会“大漠孤烟直，长河落日圆”的塞上风光！",
	"rflag": "1",
	"rdate": "2018-02-09 01:13:16",
	"isThemeTour": "0",
	"count": 0,
	"cid": 1,
	"rimage": "img/product/small/m304b69a4c8328f7d6b8d5dadef020fe07.jpg",
	"sid": 1,
	"sourceId": "23677",
	"category": null,
	"seller": {
		"sid": 1,
		"sname": "黑马程序员",
		"consphone": "12345678901",
		"address": "传智播客javaEE学院"
	},
	"routeImgList": [{
		"rgid": 1,
		"rid": 1,
		"bigPic": "img/product/size4/m421d66d4446940b1c80a0092c91e75184.jpg",
		"smallPic": "img/product/size2/m221d66d4446940b1c80a0092c91e75184.jpg"
	}, {
		"rgid": 2,
		"rid": 1,
		"bigPic": "img/product/size4/m4227f0cde1b021a77c56c1c18a8f2e7fd.jpg",
		"smallPic": "img/product/size2/m2227f0cde1b021a77c56c1c18a8f2e7fd.jpg"
	} ...]
}
    * */

            $(function () {
//                1、获取rid
               var rid = getParameter("rid");
               //var cid = getParameter("cid");
               var cname = getParameter("cname");
                //            判断cname如果不为null或者""
                if (cname){
//                url解码
                    cname = window.decodeURIComponent(cname);
                }
//               2、发送请求 route/findOne
                $.get("/findDetail",{rid:rid},function (data) {
//                    3、解析数据,填充html
                    var titleStr='<a href="/jsp/front/route_list.jsp?cid='+data.cid+'&cname='+cname+'">'+cname+'</a>';
                    $("#Inner").html(titleStr);
                    //var routeStr='<a href="/jsp/route_list.jsp?cid='+data.rid+'">'+data.routeintroduce+'</a>';
                    $("#rname").html(data.rname);
                    $("#routeIntroduce").html(data.routeintroduce);
                    $("#price").html("¥"+data.price);
                    $("#sname").html(data.seller.sname);
                    $("#consphone").html(data.seller.consphone);
                    $("#address").html(data.seller.address);
//                    设置收藏次数
                    $("#favoriteCount").html("已收藏"+data.count+"次")

//                    图片展示
                    var ddstr = '<a class="up_img up_img_disable"></a>';
//                    遍历routeImgList
                    for (var i = 0 ;i < data.routeImgList.length;i++){
                        var astr;
                        //alert(data.routeImgList[i].smallpic);
                        if (i >= 4){
                            astr = '<a title="" class="little_img" data-bigpic="../../'+data.routeImgList[i].bigpic+'" style="display:none;">\n' +
                                '                        <img src=../../'+data.routeImgList[i].smallpic+'>\n' +
                                '                    </a>';
                        }else {
                            astr = '<a title="" class="little_img" data-bigpic="../../'+data.routeImgList[i].bigpic+'">\n' +
                                '                        <img src=../../'+data.routeImgList[i].smallpic+'>\n' +
                                '                    </a>';
                        }
                        ddstr += astr;
                    }
                    ddstr += '<a class="down_img down_img_disable" style="margin-bottom: 0;"></a>';

                    $("#dd").html(ddstr);

//                    图片展示和切换调用
                    goImg();
                });
            });

            $(function () {
//                1、发送请求判断用户是否收藏
                var rid = getParameter("rid");
                //alert(rid);
                $.get("/isFavorite",{rid:rid},function (data) {
                    //alert(data.message);
                    //alert(data.flag);
                    if (data.flag){
//                        用户已经收藏过
                        //alert("不需要显示");
                        $("#favorite").addClass("already");
                        $("#favorite").attr("disabled","disabled");

//                        删除按钮的点击事件
                        $("#favorite").removeAttr("onclick");
                    }else {
//                        用户没有收藏
                    }
                })

                $.get("/isCart",{rid:rid},function (data) {
                    //alert(data.message);
                    //alert(data.flag);
                    if (data.flag){
//                        用户已经收藏过
                        //alert("不需要显示");
                        $("#shopping").addClass("already");
                        $("#shopping").attr("disabled","disabled");

//                        删除按钮的点击事件
                        $("#shopping").removeAttr("onclick");
                    }else {
//                        用户没有收藏
                    }
                })
            });
    //         点击收藏按钮触发的方法
    function InterShop() {
        var rid = getParameter("rid");
//            1、判断用户是否登录
        $.get("/showUsername",{},function (data) {
            //alert(data.message);
//                服务器从sesson中返回的usr对象,如果不为null
            if (data.flag){
//                  用户登陆了

                $.get("/addCart",{rid:rid},function (data) {
                    alert(data.message);
//                        代码刷新页面
                    location.reload();
                });
            }else {
//                    用户没有登录
                alert("您尚未登录，请登录！");

                location.href="login.jsp";

            }
        });
    }


    //         点击收藏按钮触发的方法
        function addFavorite() {
            var rid = getParameter("rid");
//            1、判断用户是否登录
            $.get("/showUsername",{},function (data) {
                //alert(data.message);
//                服务器从sesson中返回的usr对象,如果不为null
                if (data.flag){
//                  用户登陆了

                    $.get("/addFavorite",{rid:rid},function (data) {
                        alert(data.message);
//                        代码刷新页面
                        location.reload();
                    });
                }else {
//                    用户没有登录
                    alert("您尚未登录，请登录！");

                    location.href="login.jsp";

                }
            });
        }


    </script>
</body>

</html>