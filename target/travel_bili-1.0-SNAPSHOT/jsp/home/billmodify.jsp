<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/home/common/head.jsp"%>

<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>旅游路线管理页面 >> 旅游路线修改页面</span>
        </div>
        <div class="providerAdd">
          <form id="routeForm" name="routeForm" method="get" action="${pageContext.request.contextPath }/updateRoute">
				<input type="hidden" name="rid" value="${route.rid }">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="rname">线路名称：</label>
                    <input type="text" name="rname" id="rname" value="${route.rname }" readonly="readonly">
                </div>
                <div>
                    <label for="price">线路价格：</label>
                    <input type="text" name="price" id="price" value="${route.price }">
					<font color="red"></font>
                </div>
                <div>
                    <label for="routeintroduce">详情介绍：</label>
                    <input type="text" name="routeintroduce" id="routeintroduce" value="${route.routeintroduce}">
					<font color="red"></font>
                </div>
                <div>
                    <label for="count">收藏次数：</label>
                    <input type="text" name="count" id="count" value="${route.count}">
					<font color="red"></font>
                </div>
              <div>
                  <label >所属类别：</label>
                  <select name="cid" id="cid">
                  </select>
                  <font color="red"></font>
              </div>
                <div>
                    <label >是否上架：</label>
                    <c:if test="${route.rflag == 1 }">
						<input type="radio" name="rflag" value="1" checked="checked">已上架
						<input type="radio" name="rflag" value="0" >未上架
					</c:if>
					<c:if test="${route.rflag == 0 }">
						<input type="radio" name="rflag" value="1">已上架
						<input type="radio" name="rflag" value="0" checked="checked">未上架
					</c:if>
                </div>
              <div>
                  <label for="sourceid">数据来源：</label>
                  <input type="text" name="sourceid" id="sourceid" value="${route.sourceid}">
                  <font color="red"></font>
              </div>
              <div><label>图片详情：</label><%--<span>${route.routeImgList.smallpic}</span>--%>
                  <c:forEach items="${route.routeImgList }" var="routeImage">
                      <img src="../../${routeImage.smallpic}" width="120" height="80"/>

                  </c:forEach>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billmodify.js"></script>