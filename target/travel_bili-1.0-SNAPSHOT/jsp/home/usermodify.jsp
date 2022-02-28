<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/home/common/head.jsp"%>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户修改页面</span>
        </div>
        <div class="providerAdd">
        <form id="userForm" name="userForm" method="get" action="${pageContext.request.contextPath }/updateUser">
			<input type="hidden" name="uid" id="uid" value="${user.uid }"/>
			 <div>
                    <label for="userName">用户名称：</label>
                    <input type="text" name="username" id="username" value="${user.username }">
					<font color="red"></font>
             </div>
            <div>
                <label for="userName">用户姓名：</label>
                <input type="text" name="name" id="name" value="${user.name }">
                <font color="red"></font>
            </div>
			 <div>
                    <label >用户性别：</label>
                    <select name="sex" id="sex">
						<c:choose>
							<c:when test="${user.sex.equals('男') }">
								<option value="男" selected="selected">男</option>
					    		<option value="女">女</option>
							</c:when>
							<c:otherwise>
								<option value="男">男</option>
					    		<option value="女" selected="selected">女</option>
							</c:otherwise>
						</c:choose>
					 </select>
             </div>
			 <div>
                    <label for="data">出生日期：</label>
                 <%--<fmt:formatDate value='${user.birthday }' pattern='yyyy-MM-dd'></fmt:formatDate>--%>
                    <input type="text" Class="Wdate" id="birthday" name="birthday" value=${user.birthday}
					readonly="readonly" onclick="WdatePicker();">
                    <font color="red"></font>
              </div>
			
		       <div>
                    <label for="userphone">用户手机：</label>
                    <input type="text" name="telephone" id="telephone" value="${user.telephone }">
                    <font color="red"></font>
               </div>
                <div>
                    <label for="userAddress">用户邮箱：</label>
                    <input type="text" name="email" id="email" value="${user.email }">
                </div>
				<%--<div>
                    <label >用户角色：</label>
                    <!-- 列出所有的角色分类 -->
					<input type="hidden" value="${user.userrole }" id="rid" />
					<select name="userrole" id="userRole"></select>
        			<font color="red"></font>
                </div>--%>
			 <div class="providerAddBtn">
                    <input type="button" name="save" id="save" value="保存" />
                    <input type="button" id="back" name="back" value="返回"/>
                </div>
            </form>
        </div>
    </div>
</section>
<%@include file="/jsp/home/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/usermodify.js"></script>
