<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>黑马旅游网-登录</title>  
    <link rel="stylesheet" type="text/css" href="../../css/common.css">
    <link rel="stylesheet" type="text/css" href="../../css/login.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
      <!--导入angularJS文件-->
   <!-- <script src="js/angular.min.js"></script>-->
	<!--导入jquery-->
	<script src="../../js/jquery-3.3.1.js"></script>

	<%--<script>

		$(function (){
			//1、给登录按钮绑定单击事件
			$("#btn_sub").click(function () {

					console.log("进入登录页面");
//		2、发送ajax请求，提交表单数据
					$.post("/login", $("#loginForm").serialize(), function (data) {
//		3、处理响应结果
						if (data.flag) {
//				    登录成功
							console.log("进入登入成功处理");
//					2.判断

							location.href = "index.jsp";
						} else {
//				    登录失败
							$("#errorMsg").html(data.message);
						}
					});

				return false;
			});

		});

	</script>
--%>

</head>

<body>
<!--引入头部-->
<div id="header"></div>
    <!-- 头部 end -->
    <section id="login_wrap">
        <div class="fullscreen-bg" style="background: url(../../images/backlogin_2.jpg);height: 532px;">
        	
        </div>
        <div class="login-box">
        	<div class="title">
        		<img src="../../images/login_logo.png" alt="">
        		<span>欢迎登录旅游账户</span>
        	</div>
        	<div class="login_inner">
				
				<!--登录错误提示消息-->
        		<div id="errorMsg" class="alert alert-danger" ></div>
				<form id="loginForm" action="" method="post" accept-charset="utf-8">
        			<input type="hidden" name="action" value="login"/>
					<input name="username" type="text" placeholder="请输入账号" autocomplete="off">
        			<input name="password" type="text" placeholder="请输入密码" autocomplete="off">
        			<div class="verify">
					<input name="checkByCode" type="text" placeholder="请输入验证码" autocomplete="off">
					<span><img src="../../checkCode" alt="" onclick="changeCheckCode(this)"></span>
					<script type="text/javascript">
						//图片点击事件
						function changeCheckCode(img) {
							img.src="../../checkCode?"+new Date().getTime();
						}
					</script>
			</div>
			<div class="submit_btn">
        				<button type="button" id="btn_sub" onclick="changeInformation()">登录</button>

				<script type="text/javascript">
					function changeInformation() {
						$.post("/login", $("#loginForm").serialize(), function (data) {
//		3、处理响应结果
							//alert(data.flag);
							if (data.flag) {
//				    登录成功
								console.log("进入登入成功处理");
//					2.判断
								location.href = "index.jsp";
							} else {
//				    登录失败
								//alert(data.message);
								$("#errorMsg").html(data.message);
							}
						});

						return false;
					}
				</script>
        				<div class="auto_login">
        					<input type="checkbox" name="checkbox" class="checkbox">
        					<span>自动登录</span>
        				</div>        				
        			</div>        			       		
        		</form>
        		<div class="reg">没有账户？<a href="http://localhost:8080/jsp/front/register.jsp">立即注册</a></div>
        	</div>
        </div>
    </section>
    <!--引入尾部-->
    <div id="footer"></div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../../js/jquery-1.11.0.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../../js/bootstrap.min.js"></script>
    <!--导入布局js，共享header和footer-->
    <script type="text/javascript" src="../../js/include.js"></script>
</body>

</html>