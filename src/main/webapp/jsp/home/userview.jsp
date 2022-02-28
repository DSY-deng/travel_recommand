<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/home/common/head.jsp"%>
 <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户信息查看页面</span>
        </div>
        <div class="providerView">
            <p><strong>用户名称：</strong><span>${user.username}</span></p>
            <p><strong>用户姓名：</strong><span>${user.name }</span></p>
            <p><strong>用户性别：</strong>
            	<span>
                    ${user.sex}
            		<%--<c:if test="${user.gender == 1 }">男</c:if>
					<c:if test="${user.gender == 2 }">女</c:if>--%>
				</span>
			</p>
            <%--<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"></fmt:formatDate>--%>
            <p><strong>出生日期：</strong><span>${user.birthday}</span></p>
            <p><strong>用户电话：</strong><span>${user.telephone }</span></p>
            <p><strong>用户邮箱：</strong><span>${user.email }</span></p>
            <%--<p><strong>用户角色：</strong><span>${user.rolename}</span></p>--%>
			<div class="providerAddBtn">
            	<input type="button" id="back" name="back" value="返回" >
            </div>
        </div>
    </div>
</section>
<%@include file="/jsp/home/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/userview.js"></script>