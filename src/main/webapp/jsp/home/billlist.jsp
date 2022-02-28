<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/jsp/home/common/head.jsp"%>

<div class="right">
       <div class="location">
           <strong>你现在所在的位置是:</strong>
           <span>旅游路线管理页面</span>
       </div>
       <div class="search">
       <form method="get" action="${pageContext.request.contextPath }/homeRouteList">
			<input name="method" value="query" class="input-text" type="hidden">
			<span>商品名称：</span>
			<input name="rname" type="text" value="${rname}">

		   <span></span><span></span><span></span><span></span><span></span><span></span><span></span>
			<%--<span>路线名称：</span>--%>
		   <%--下拉框select   providerList无list属性--%>
		   <%----%>
			<%--<select name="queryProviderId">
				<c:if test="${providerList != null }">
				   <option value="0">--请选择--</option>
				   <c:forEach var="provider" items="${providerList}">
				   		<option <c:if test="${provider.id == queryProviderId }">selected="selected"</c:if>
				   		value="${provider.id}">${provider.proname}</option>
				   </c:forEach>
				</c:if>
       		</select>--%>
			 
			<span>价格区间:</span>
		   <input name="homepricelow" type="text" value="${homepricelow}" width="120px"> ---
		   <input name="homepricehigh" type="text" value="${homepricehigh}" width="120px">
<%--			<select name="queryIsPayment">--%>
<%--				<option value="0">--请选择--</option>--%>
<%--				<option value="1" ${isPayment == 1 ? "selected=\"selected\"":"" }>未付款</option>--%>
<%--				<option value="2" ${isPayment == 2 ? "selected=\"selected\"":"" }>已付款</option>--%>
<%--       		</select>--%>

		   <%--跳转分页，上一页，下一页--%>
		 	  <input type="hidden" name="pageIndex" value="1"/>
		   <%--跳转分页结束--%>
			 <input	value="查 询" type="submit" id="searchbutton">
			 <a href="${pageContext.request.contextPath }/jsp/home/billadd.jsp">添加旅游路线</a>
		</form>
       </div>
       <!--账单表格 样式和供应商公用-->
      <table class="providerTable" cellpadding="0" cellspacing="0">
          <tr class="firstTr">
              <th width="20%">路线名称</th>
			  <th width="9%">订单金额</th>
              <th width="24%">详情介绍</th>
              <th width="7%">收藏次数</th>
              <th width="8%">创建时间</th>
              <th width="15%">操作</th>
          </tr>
		  <%--循环输出，与下拉框不同--%>
		  <%--List用于下拉框，PageInfo可使用.list属性，用于循环输出--%>
          <c:forEach var="route" items="${routePageInfo.list}" varStatus="status">
				<tr>
					<td>
					<span>${route.rname }</span>
					</td>
					<td>
					<span>${route.price }</span>
					</td>
					<td>
					<span>${route.routeintroduce}</span>
					</td>
					<td>
					<span>${route.count}</span>
					</td>
					<%--<td>
					<span>
						<c:if test="${bill.ispayment == 1}">未付款</c:if>
						<c:if test="${bill.ispayment == 2}">已付款</c:if>
					</span>
					</td>--%>
					<td>
					<span>
						<span>${route.rdate}</span>
					<%--<fmt:formatDate value="${route.rdate}" pattern="yyyy-MM-dd"/>--%>
					</span>
					</td>
					<td>
					<span><a class="viewRoute" href="javascript:;" rid=${route.rid} routecc=${route.rname}><img src="${pageContext.request.contextPath }/homeimages/read.png" alt="查看" title="查看"/></a></span>
					<span><a class="modifyRoute" href="javascript:;" rid=${route.rid} routecc=${route.rname}><img src="${pageContext.request.contextPath }/homeimages/xiugai.png" alt="修改" title="修改"/></a></span>
					<span><a class="deleteRoute" href="javascript:;" rid=${route.rid} routecc=${route.rname }><img src="${pageContext.request.contextPath }/homeimages/schu.png" alt="删除" title="删除"/></a></span>
					</td>
				</tr>
			</c:forEach>
      </table>
	<%--bill分页--%>
	<input type="hidden" id="totalPageCount" value="${routePageInfo.pages}"/>
	<c:import url="rollpage.jsp">
		<c:param name="totalCount" value="${routePageInfo.total}"/>
		<c:param name="currentPageNo" value="${routePageInfo.pageNum}"/>
		<c:param name="totalPageCount" value="${routePageInfo.pages}"/>
	</c:import>
	<%--分页结束--%>
  </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeBi">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该订单吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<%@include file="/jsp/home/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billlist.js"></script>