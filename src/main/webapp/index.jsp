<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false"%>
<%@ page language="java" import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html style="width:100%;height:100%;overflow:hidden">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>登陆</title>
    <script src="${ctx}/static/scripts/jquery.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/EasyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/EasyUI/themes/icon.css">
    <script type="text/javascript" src="${ctx}/static/EasyUI/jquery.min.js" ></script>
    <script type="text/javascript" src="${ctx}/static/EasyUI/jquery.easyui.min.js" ></script>
</head>
<body style="height:100%;width:100%;overflow:hidden;border:none;visibility:visible;">
<div id="mainwindow" class="easyui-window" title="登陆"
     style="width:500px;height:300px;background:#fafafa;overflow:hidden;"
     border="false" resizable="false" draggable="false"
     minimizable="false" maximizable="false">
    <div class="header" style="height:35px">
        <div class="toptitle" style="margin-top: 25px; font-size:20px; margin-left:60px;">
            ${requestScope.message}
        </div>
    </div>
    <div style="padding:60px 0;">
        <div id="loginForm">
            <div style="padding-left:150px">
                <table cellpadding="0" cellspacing="3">
                    <tr>
                        <td>登陆账号</td>
                        <td><input id="login_name" style="width:114px;"></input>
                        </td>
                    </tr>
                    <tr>
                        <td>登陆密码</td>
                        <td><input id="login_password" type="password" style="width:114px;"></input>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <a id="btnLogin" class="easyui-linkbutton">登陆</a>
                            <a onclick="clearAll()" class="easyui-linkbutton">重置</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    function clearAll()
    {
        document.getElementById('login_name').value="";
        document.getElementById('login_password').value="";
    }
    $("#login_password").keydown(function(event)
    {
        if(event.keyCode==13)
            $("#btnLogin").click();
    });
    $("#btnLogin").click(function()
    {
        var login_name=$("#login_name").val();
        var login_password=$("#login_password").val();
        if(login_name==null||login_password==null)
        {
            $.messager.alert("提示信息","用户名,密码都不能为空","info");
            return;
        }
        var condition={"login_name":login_name,"login_password":pass_word};
        condition=JSON.stringify(condition);//转成json字符串
        condition=escape(encodeURIComponent(condition));//参数用encodeURIComponent
                                                        //网址用encodeURI
        var url='USERLogin.action?condition='+condition;

        $.ajax({
            type:"post",
            url:url,
            contentType:"text/html",
            error:function(event,request,settings)
            {
                $.messager.alert("提示信息","请求失败","info");
            },
            success : function(data)
            {
                if(data.total>0)
                {
                    window.location.href="main.jsp";
                }
                else
                {
                    $.messager.alert("提示消息","用户名或密码错误","info")
                }
            }
        });
    });
</script>
</html>