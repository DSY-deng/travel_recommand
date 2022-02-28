<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/jsp/home/common/head.jsp"%>
        <div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>用户管理页面</span>
            </div>
            <div class="search">
           		<form method="get" action="${pageContext.request.contextPath }/homeUserList">
					<input name="method" value="query" class="input-text" type="hidden">
					 <span>用户名：</span>
					<%--用于回选--%>
					 <input name="name" class="input-text"	type="text" value="${name }">
					 
					 <span>用户性别：</span>
					<%--下拉框--%>
					 <select name="sex" value="${sex}">
						 <option value="">-请选择-</option>
						 <option value="男" <c:if test="${'男' eq sex}">selected</c:if> >男</option>
						 <option value="女" <c:if test="${'女' eq sex}">selected</c:if> >女</option>
	        		</select>
					 
					 <input type="hidden" name="pageIndex" value="1"/>
					 <input	value="查 询" type="submit" id="searchbutton">
					 <a href="${pageContext.request.contextPath}/jsp/home/useradd.jsp" >添加用户</a>
				</form>
            </div>
            <!--用户-->
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="10%">用户名称</th>
                    <th width="10%">用户名</th>
                    <th width="10%">性别</th>
                    <th width="12%">生日</th>
                    <th width="12%">手机号</th>
                    <th width="18%">邮箱</th>
                    <th width="28%">操作</th>
                </tr>
                   <c:forEach var="user" items="${userPageInfo.list}" varStatus="status">
					<tr>
						<td>
						<span>${user.username }</span>
						</td>
						<td>
						<span>${user.name }</span>
						</td>
						<td>
							<span>
								${user.sex}
								<%--<c:if test="${user.gender==1}">男</c:if>
								<c:if test="${user.gender==2}">女</c:if>--%>
							</span>
						</td>
						<td>
						<span>${user.birthday}</span>
						</td>
						<td>
						<span>${user.telephone}</span>
						</td>
						<td>
							<span>${user.email}</span>
						</td>
						<td>
						<span><a class="viewUser" href="javascript:;" userid=${user.uid } username=${user.name }><img src="${pageContext.request.contextPath }/homeimages/read.png" alt="查看" title="查看"/></a></span>
						<span><a class="modifyUser" href="javascript:;" userid=${user.uid } username=${user.name }><img src="${pageContext.request.contextPath }/homeimages/xiugai.png" alt="修改" title="修改"/></a></span>
						<span><a class="deleteUser" href="javascript:;" userid=${user.uid } username=${user.name }><img src="${pageContext.request.contextPath }/homeimages/schu.png" alt="删除" title="删除"/></a></span>
						</td>
					</tr>
				</c:forEach>
			</table>
			<%--User分页--%>
			<input type="hidden" id="totalPageCount" value="${userPageInfo.pages}"/>
		  	<c:import url="rollpage.jsp">
	          	<c:param name="totalCount" value="${userPageInfo.total}"/>
	          	<c:param name="currentPageNo" value="${userPageInfo.pageNum}"/>
	          	<c:param name="totalPageCount" value="${userPageInfo.pages}"/>
          	</c:import>
			<%--分页结束--%>
        </div>
    </section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该用户吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<%@include file="/jsp/home/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/userlist.js"></script>
