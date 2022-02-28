<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:if test="${sessionScope.roleSession==null}">
    <script>
        /*此处防止进入需用重定向*/
        window.Location.href="${pageContext.request.contextPath}/login.jsp"
    </script>
</c:if>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>旅游网站后台管理系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/public.css" />
</head>
<body>
<!--头部-->
    <header class="publicHeader">
        <h1>旅游网站后台管理系统</h1>
        <div class="publicHeaderR">
            <p><span> </span><span style="color: #fff21b"> ${sessionScope.roleSession.rolename }</span> , 欢迎你！</p>
            <a href="${pageContext.request.contextPath }/homeloginOut">退出</a>
        </div>
    </header>
<!--时间-->
    <section class="publicTime">
        <span id="time">2021年1月1日 11:11  星期一</span>
    </section>
 <!--主体内容-->
 <section class="publicMian ">
     <div class="left">
         <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
         <nav>
             <ul class="list">
                 <li ><a href="${pageContext.request.contextPath }/homeUserList">用戶信息管理</a></li>
              <li><a href="${pageContext.request.contextPath }/homeRouteList">旅游路线管理</a></li>
              <li><a href="${pageContext.request.contextPath }/homeRoleList">管理员信息管理</a></li>
              <li><a href="${pageContext.request.contextPath }/jsp/home/pwdmodify.jsp">密码修改</a></li>
              <li><a href="${pageContext.request.contextPath }/homeloginOut">退出系统</a></li>
             </ul>
         </nav>
     </div>
     <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
     <input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>
