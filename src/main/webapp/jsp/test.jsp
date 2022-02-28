<%--
  Created by IntelliJ IDEA.
  User: DSY
  Date: 2021/4/21
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试图片上传</title>
    <script src="http://www.jq22.com/jquery/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/updateimg.js"></script>
</head>

<body>
<%--<form action="/fileUpload" method="post" enctype="multipart/form-data">
    <label>上传图片</label>
    <input type="file" name="file"/>
    <input type="submit" value="上传"/>

</form>--%>
<%--<iframe name="upload" style="display:none;"></iframe>--%>
<div>
    <div id="showimg">
        <ul id="showui"></ul>
        <div id="showinput"></div>
    </div>
    <div>
        <input type="file" id="upgteimg" value="" multiple="multiple" />
    </div>
    <button id="submit">开始上传</button>
</div>


<%--<!--添加产品信息浮层-->
<form id="form0" enctype="multipart/form-data">
    <div class="PublicFloatBox adduser">
        <div class="kongfx">
            <div class=" wid400">
                <div class="f_Head">
                    <span>添加产品</span>
                    <i class="Js_closeBtn iconfont icon-buoumaotubiao20 fr"></i>
                </div>
                <div class="f_content">
                    <div class="f_alonediv">
                        <div class="f_alone_name">
                            鞋子图片:
                        </div>
                        <div class="f_alone_input">
                            <input class="uploadimg" type="file" id="pro_photo" name="request_file"/>
                        </div>
                        <!--提示消息-->
                    </div>
                    <div class="f_alonediv">
                        <div class="f_alone_name">
                            鞋子名称:
                        </div>
                        <div class="f_alone_input">
                            <input class="f_p_input" id="pro_name"/>
                        </div>
                        <!--提示消息-->
                    </div>
                    <div class="f_alonediv">
                        <div class="f_alone_name">
                            鞋子描述:
                        </div>
                        <div class="f_alone_input">
                            <input class="f_p_input" id="pro_desc"/>
                        </div>
                        <!--提示消息-->
                    </div>
                    <div class="f_alonediv">
                        <div class="f_alone_name">
                            鞋子价格:
                        </div>
                        <div class="f_alone_input">
                            <input class="f_p_input" id="pro_money"/>
                        </div>
                        <!--提示消息-->
                    </div>
                    <div class="f_alonediv">
                        <div class="f_alone_name">
                            鞋子品牌:
                        </div>
                        <div class="f_alone_input">
                            <input class="f_p_input" id="pro_logo"/>
                        </div>
                        <!--提示消息-->
                    </div>
                    <div class="f_alonediv">
                        <div class="f_alone_name">
                            鞋子型号:
                        </div>
                        <div class="f_alone_input">
                            <input class="f_p_input" id="pro_model"/>
                        </div>
                        <!--提示消息-->
                    </div>
                    <div class="f_alonediv1">
                        <div class="f_alone_name">
                        </div>
                        <div class="f_alone_input1">
                            <!--publicbtn-->
                            <div class="publicf_btn">
                                <!--<a class="publicf_btn1" id="add_btn" type="submit">-->
                                <input type="submit" class="publicf_btn1" id="add_btn">
                                确定
                                </a>
                                <div class="publicf_btn2 fr Js_closeBtn">
                                    取消
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>--%>

</body>
</html>
