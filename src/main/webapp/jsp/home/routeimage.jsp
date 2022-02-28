<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/jsp/home/common/head.jsp"%>

<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>下一步：旅游路线管理页面 >> 路线图片添加页面</span>
    </div>
    <div class="providerAdd">
            <!--div的class 为error是验证错误，ok是验证成功-->
        <h2 style="padding-left: 110px">图片详情：</h2><br/><br/>

        <form id="addRImage" name="addRImage" action="/addRImage" method="post" enctype="multipart/form-data">
            <input type="hidden" name="rid" id="rid" value="${routeid}">
            <h3 style="padding-left: 160px">路线图：</h3></br>
            <span style="padding-left: 190px"></span>
            <input type = "file" name = "fileAddRImage" id="fileAddRImage"><br><br>
        </form>
        <font color="red"></font>
        </br>

        <%--<form id="addBigPic" name="addBigPic" action="/addBigPic" method="post" enctype="multipart/form-data">
            <h3 style="padding-left: 160px">大图：</h3><br/>
            <span style="padding-left: 190px"></span>
            <input type = "file" name = "fileAddBigPic"><br><br>
        </form>
        <font color="red"></font>
        </br>--%>

        <form id="addDetailPic" name="addDetailPic" action="/addDetailPic" method = "post" enctype="multipart/form-data">
            <input type="hidden" name="routeid" id="routeid" value="${routeid}">
            <h3 style="padding-left: 160px">详情图：</h3><br/>
            <span style="padding-left: 190px"></span>
         <input type = "file" name = "files"><br><br>
            <span style="padding-left: 190px"></span>
         <input type = "file" name = "files"><br><br>
            <span style="padding-left: 190px"></span>
         <input type = "file" name = "files">
         </form>
         <font color="red"></font>

        <div class="providerAddBtn">
            <input type = "button" id="add" name="add" value = "上传"/>
            <input type="button" id="back" name="back" value="返回"/>
            <%-- onclick="jump();"--%>
        </div>
    </div>

</div>
</section>
<%@include file="/jsp/home/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/routeimage.js"></script>