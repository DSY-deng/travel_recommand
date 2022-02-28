<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/home/common/head.jsp"%>
 <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>管理员信息管理页面 >> 信息查看</span>
        </div>
        <div class="providerView">
            <p><strong>管理员用户名：</strong><span>${role.rolename}</span></p>
            <p><strong>管理员密码：</strong><span>${role.password}</span></p>
            <p><strong>性别：</strong><span>${role.sex}</span></p>
            <p><strong>联系电话：</strong><span>${role.telephone}</span></p>
            <p><strong>职位：</strong>
                <span>
                <c:if test="${role.type == 1}">经理</c:if>
                    <c:if test="${role.type == 2}">普通管理员</c:if>
                </span>
            </p>
            <p><strong>添加时间：</strong><span>${role.createtime}</span></p>

			<div class="providerAddBtn">
            	<input type="button" id="back" name="back" value="返回" >
            </div>
        </div>
    </div>
</section>
<%@include file="/jsp/home/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/providerview.js"></script>
