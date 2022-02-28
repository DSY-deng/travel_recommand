<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/jsp/home/common/head.jsp"%>
    <div class="right">
        <img class="wColck" src="${pageContext.request.contextPath }/homeimages/clock.jpg" alt=""/>
        <div class="wFont">
            <h2>${sessionScope.roleSession.rolename}</h2>
            <p>欢迎来到旅游网站后台管理系统!</p>
        </div>
    </div>
</section>
<%@include file="/jsp/home/common/foot.jsp" %>
