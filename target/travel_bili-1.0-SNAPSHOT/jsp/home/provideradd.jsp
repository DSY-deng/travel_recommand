<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/home/common/head.jsp"%>

<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>管理员信息管理页面 >> 管理员信息添加页面</span>
        </div>
        <div class="providerAdd">
           <form id="roleForm" name="roleForm" method="get" action="${pageContext.request.contextPath }/addRole">
			<%--<input type="hidden" name="method" value="add">--%>
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="rolename">管理员用户名：</label>
                    <input type="text" name="rolename" id="rolename" value="">
					<!-- 放置提示信息 -->
					<font color="red"></font>
                </div>
                <div>
                    <label for="password">管理员密码：</label>
                   <input type="text" name="password" id="password" value="">
					<font color="red"></font>
                </div>
                <div>
                    <label for="sex">性别：</label>
                    <select name="sex" id="sex">
                        <option value="男" selected="selected">男</option>
                        <option value="女">女</option>
                    </select>
                    <%--<input type="text" name="sex" id="sex" value="">--%>
					<font color="red"></font>

                </div>
               <div>
                   <label for="birthday">出生日期：</label>
                   <input type="text" Class="Wdate" id="birthday" name="birthday"
                          readonly="readonly" onclick="WdatePicker();">
                   <font color="red"></font>
               </div>
                <div>
                    <label for="telephone">联系电话：</label>
                    <input type="text" name="telephone" id="telephone" value="">
					<font color="red"></font>
                </div>
                <div>
                    <label for="type">职位：</label>
                    <select name="type" id="type">
                        <option value="1" selected="selected">经理</option>
                        <option value="2">普通管理员</option>
                    </select>
                    <%--<input type="text" name="type" id="type" value="">--%>
                </div>
                <%--<div>
                    <label for="createtime">创建时间：</label>
                    <input type="text" name="createtime" id="createtime" value="">
                </div>--%>
                <%--<div>
                    <label for="proDesc">描述：</label>
                    <input type="text" name="prodesc" id="proDesc" value="">
                </div>--%>
                <div class="providerAddBtn">
                    <input type="button" name="add" id="add" value="保存">
					<input type="button" id="back" name="back" value="返回" >
                </div>
            </form>
     </div>
</div>
</section>
<%@include file="/jsp/home/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/provideradd.js"></script>
