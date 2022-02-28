<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/home/common/head.jsp"%>

<div class="right">
     <div class="location">
         <strong>你现在所在的位置是:</strong>
         <span>旅游路线管理页面 >> 旅游路线添加页面</span>
     </div>
     <div class="providerAdd">
         <form id="routeForm" name="routeForm" method="get" action="${pageContext.request.contextPath }/addRoute">
             <!--div的class 为error是验证错误，ok是验证成功-->
            <%-- <input type="hidden" name="method" value="add">--%>
             <div class="">
                 <label for="rname">路线名称：</label>
                 <input type="text" name="rname" class="text" id="rname" value="">
				 <!-- 放置提示信息 -->
				 <font color="red"></font>
             </div>
             <div>
                 <label for="price">价格：</label>
                 <input type="text" name="price" id="price" value="">
				 <font color="red"></font>
             </div>
             <div>
                 <label for="routeintroduce">详情介绍：</label>
                 <input type="text" name="routeintroduce" id="routeintroduce" value="">
				 <font color="red"></font>
             </div>
             <%--下拉框--%>
             <%--<div>
                 <label for="category">所属类别：</label>
                 <input type="text" name="category" id="category" value="">
				 <font color="red"></font>
             </div>--%>
             <div>
                 <label >所属类别：</label>
                 <select name="cid" id="cid">
		         </select>
				 <font color="red"></font>
             </div>
             <div>
                 <label >是否上架：</label>
                 <input type="radio" name="rflage" value="1" checked="checked">已上架
                 <input type="radio" name="rflage" value="0" >未上架
             </div>
             <div>
                 <label for="sourceid">数据来源：</label>
                 <input type="text" name="sourceid" id="sourceid" value="">
                 <font color="red"></font>
             </div>
             <%--<div>
                 <label >所属商家：</label>
                 <select name="seller" id="seller">
                 </select>
                 <font color="red"></font>
             </div>--%>
            <%-- <div>
                 <label >图片详情：</label>
                 <form method = "post" enctype="multipart/form-data">
                     <input type = "file" name = "file"><br><br>
                     &lt;%&ndash;图二：<input type = "file" name = "file2"><br><br>
                     图三：<input type = "file" name = "file3"><br><br>
                     <input type = "submit" value = "上传"/>&ndash;%&gt;
                 </form>
                 <font color="red"></font>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billadd.js"></script>