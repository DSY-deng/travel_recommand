<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/home/common/head.jsp"%>
<div class="right">
     <div class="location">
         <strong>你现在所在的位置是:</strong>
         <span>旅游路线管理页面 >> 信息查看</span>
     </div>
     <div class="providerView">
         <p><strong>线路名称：</strong><span>${route.rname }</span></p>
         <p><strong>线路价格：</strong><span>${route.price}</span></p>
         <p><strong>详情介绍：</strong><span>${route.routeintroduce}</span></p>
         <p><strong>收藏次数：</strong><span>${route.count}</span></p>
         <p><strong>所属分类：</strong><span>${route.category.cname}</span></p>
         <p><strong>图片详情：</strong><%--<span>${route.routeImgList.smallpic}</span>--%>
             <c:forEach items="${route.routeImgList }" var="routeImage">
                 <img src="../../${routeImage.smallpic}" width="120" height="80"/>

         </c:forEach>

         </p>
         <%--<p><strong>是否付款：</strong>
         	<span>
         		<c:if test="${bill.ispayment == 1}">未付款</c:if>
				<c:if test="${bill.ispayment == 2}">已付款</c:if>
			</span>
		</p>--%>
		<div class="providerAddBtn">
         	<input type="button" id="back" name="back" value="返回" >
        </div>
     </div>
 </div>
</section>
<%@include file="/jsp/home/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billview.js"></script>