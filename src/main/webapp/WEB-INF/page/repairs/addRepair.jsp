<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>添加报修单</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
        content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${ctx }/layui/css/layui.css" media="all" />
    <script>
        <%--JS gloable varilible--%>
        var ctx = "${ctx}";
    </script>
    <style type="text/css">
        .layui-form-item .layui-inline {
            width: 33.333%;
            float: left;
            margin-right: 0;
        }

        @media ( max-width :1240px) {
            .layui-form-item .layui-inline {
                width: 100%;
                float: none;
            }
        }
    </style>
</head>
<body class="childrenBody">
<form class="layui-form" style="width: 80%;" id="aaf">
    <br/>
    <div class="layui-form-item">
        <label class="layui-form-label">报修详情</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input userName"
                   lay-verify="required" placeholder="请输入描述信息" name="content" value="">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">报修地点</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input userName"
                   lay-verify="required" placeholder="请输入描述信息" name="address" value="">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">报修类型</label>
        <div class="layui-input-block">
            <select name="formType">
                <option value="">请选择</option>
                <option value="2">网络中心</option>
                <option value="3">教务处</option>
                <option value="4">后勤部门</option>
                <option value="5">人事部门</option>
                <option value="6">财务处</option>
                <option value="1">其他</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">图片</label>
        <div class="layui-input-block">
            <button type="button" class="layui-btn" id="onePicUpload"><i class="layui-icon"></i>上传文件</button><br />
            <img class="layui-upload-img" id="preview" style="width: 150px;margin-top: 5px">
            <p id="uploadError"></p>
            <input type="hidden" lay-verify="imgurl" name="linkUrl" id="newsImg" value=""/>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">联系人</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input userName"
                   lay-verify="required" placeholder="请输入描述信息" name="linkman" value="">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">联系电话</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input userName"
                   lay-verify="required" placeholder="请输入描述信息" name="tel" value="">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addRepair">立即提交</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
<script type="text/javascript" src="${ctx }/page/repairs/addRepair.js"></script>
</body>
</html>