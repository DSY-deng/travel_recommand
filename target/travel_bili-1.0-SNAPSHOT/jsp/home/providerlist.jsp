<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/jsp/home/common/head.jsp"%>

<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>管理员信息管理页面</span>
        </div>
        <div class="search">
        	<form method="get" action="${pageContext.request.contextPath }/homeRoleList">
				<input name="method" value="query" type="hidden">
				<span>管理员用户名：</span>
				<input name="rolename" type="text" value="${rolename }">

				<%--下拉框--%>
				<span>管理员职位：</span>
				<select name="type" value="${type}">
					<option value="">-请选择-</option>
					<option value="1" <c:if test="${type == 1}">selected</c:if> >经理</option>
					<option value="2" <c:if test="${type == 2}">selected</c:if> >普通管理员</option>
				</select>

				<input type="hidden" name="pageIndex" value="1"/>
				<input value="查 询" type="submit" id="searchbutton">
				<a href="${pageContext.request.contextPath }/jsp/home/provideradd.jsp">添加管理员</a>
			</form>
        </div>
        <!--供应商操作表格-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="15%">管理员姓名</th>
                <th width="15%">管理员密码</th>
                <th width="10%">性别</th>
                <th width="15%">联系电话</th>
                <th width="10%">类型</th>
                <th width="17%">创建时间</th>
                <th width="18%">操作</th>
            </tr>
            <c:forEach var="role" items="${rolePageInfo.list }" varStatus="status">
				<tr>
					<td>
					<span>${role.rolename}</span>
					</td>
					<td>
					<span>${role.password}</span>
					</td>
					<td>
					<span>${role.sex}</span>
					</td>
					<td>
					<span>${role.telephone}</span>
					</td>
					<td>
					<span>
						<c:if test="${role.type == 1}">经理</c:if>
						<c:if test="${role.type == 2}">普通管理员</c:if>
					</span>
					</td>
					<td>
					<span>
						<span>${role.createtime}</span>
					<%--<fmt:formatDate value="${role.creatdate}" pattern="yyyy-MM-dd"/>--%>
					</span>
					</td>
					<td>
					<span><a class="viewRole" href="javascript:;" roleid=${role.roleid } rolename=${role.rolename }><img src="${pageContext.request.contextPath }/homeimages/read.png" alt="查看" title="查看"/></a></span>
					<span><a class="modifyRole" href="javascript:;" roleid=${role.roleid } rolename=${role.rolename }><img src="${pageContext.request.contextPath }/homeimages/xiugai.png" alt="修改" title="修改"/></a></span>
					<span><a class="deleteRole" href="javascript:;" roleid=${role.roleid } rolename=${role.rolename }><img src="${pageContext.request.contextPath }/homeimages/schu.png" alt="删除" title="删除"/></a></span>
					</td>
				</tr>
			</c:forEach>
        </table>
	<%--Provider分页--%>
	<input type="hidden" id="totalPageCount" value="${rolePageInfo.pages}"/>
	<c:import url="rollpage.jsp">
		<c:param name="totalCount" value="${rolePageInfo.total}"/>
		<c:param name="currentPageNo" value="${rolePageInfo.pageNum}"/>
		<c:param name="totalPageCount" value="${rolePageInfo.pages}"/>
	</c:import>
	<%--分页结束--%>
    </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeProv">
   <div class="removerChid">
       <h2>提示</h2>
       <div class="removeMain" >
           <p>你确定要删除该供应商吗？</p>
           <a href="#" id="yes">确定</a>
           <a href="#" id="no">取消</a>
       </div>
   </div>
</div>

<%@include file="/jsp/home/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/providerlist.js"></script>
