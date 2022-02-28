<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/home/common/head.jsp"%>

  <div class="right">
      <div class="location">
          <strong>你现在所在的位置是:</strong>
          <span>管理员信息管理页面 >> 管理员信息修改页</span>
      </div>
      <div class="providerAdd">
          <form id="roleForm" name="roleForm" method="get" action="${pageContext.request.contextPath }/updateRole">
              <input type="hidden" name="roleid" value="${role.roleid }">
              <!--div的class 为error是验证错误，ok是验证成功-->
              <div class="">
                  <label for="rolename">管理员用户名：</label>
                  <input type="text" name="rolename" id="rolename" value="${role.rolename}" readonly="readonly">
              </div>
              <div>
                  <label for="password">管理员密码：</label>
                 <input type="text" name="password" id="password" value="${role.password}">
			<font color="red"></font>
              </div>
              
              <div>
                  <label for="sex">性别：</label>
                  <select name="sex" id="sex">
                      <option <c:if test="${role.sex == '男'}">selected="selected"</c:if>>男</option>
                      <option <c:if test="${role.sex == '女'}">selected="selected"</c:if>>女</option>
                  </select>
			<font color="red"></font>
              </div>

              <div>
                  <label for="birthday">生日：</label>
                  <input type="text" Class="Wdate" id="birthday" name="birthday" value="${role.birthday}"
                         readonly="readonly" onclick="WdatePicker();">
              </div>
              
              <div>
                  <label for="telephone">联系手机：</label>
                  <input type="text" name="telephone" id="telephone" value="${role.telephone }">
			<font color="red"></font>
              </div>
              

              
              <div>
                  <label for="type">职位：</label>
                  <select name="type" id="type">
                      <option value="1" <c:if test="${role.type == 1}">selected="selected"</c:if>>经理</option>
                      <option value="2" <c:if test="${role.type == 2}">selected="selected"</c:if>>普通管理员</option>
                  </select>
              </div>
              
              <div>
                  <label for="createtime">创建时间：</label>
                  <input type="text" name="createtime" id="createtime" value="${role.createtime}" readonly="false">
              </div>
              <div class="providerAddBtn">
                  <input type="button" name="save" id="save" value="保存">
				  <input type="button" id="back" name="back" value="返回" >
              </div>
          </form>
      </div>
  </div>
</section>
<%@include file="/jsp/home/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/providermodify.js"></script>