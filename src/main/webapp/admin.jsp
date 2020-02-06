<%--
  Created by IntelliJ IDEA.
  User: didi
  Date: 2020/2/6
  Time: 6:35 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; ISO-8859-1" %>
<html>
<head>
    <title>后台管理首页面</title>
    <%--   引入EasyUI的相关css和js文件 --%>
    <link href="jquery-easyui-1.7.0/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="jquery-easyui-1.7.0/themes/icon.css" rel="stylesheet" type="text/css" />
    <link href="jquery-easyui-1.7.0/demo/demo.css" rel="stylesheet" type="text/css" />
    <script src="jquery-easyui-1.7.0/jquery.min.js" type="text/javascript"></script>
    <script src="jquery-easyui-1.7.0/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
</head>
<body class="easyui-layout">
    <div data-options="region:'north',border:false" style="height: 60px;background: #B3DFDA;padding: 10px">
        <div align="left">
            <div style="font-family: Microsoft YaHei;font-size: 16px;">电商平台后台管理系统</div>
            <div align="right">欢迎您，<font color="red">${sessionScope.admin.name}</font> </div>
        </div>
    </div>
    <div data-options="region:'west',split:true,title:'功能菜单'" style="width: 180px">
        <ul id="tt"></ul>
    </div>
    <div data-options="region:'south',border:flase" style="height: 50px;background: #A9FACD;padding: 10px;text-align: center">
        powered by calorieyang
    </div>
    <div data-options="region:'center'">
        <div id="tabs" data-options="fit:true" class="easyui-tabs" style="width:500px;height: 250px;"></div>
    </div>
    <script type="text/javascript">
        $('#tt').tree({
            url : 'admininfo/getTree?adminid=${sessionScope.admin.id}'
        });
        $('#tt').tree({
            onclick:function (node) {
                if("商品列表" == node.text){
                    if($('#tabs').tabs('exists','商品列表')){
                        $('#tabs').tabs('select','商品列表');
                    }else{
                        $('#tabs').tabs('add',{
                            title:node.text,
                            href:'productlist.jsp',
                            closable:true
                        });
                    }
                }else if("商品类型列表" == node.text){
                    if($('#tabs').tabs('exists','商品类型列表')){
                        $('#tabs').tabs('select','商品类型列表');
                    }else{
                        $('#tabs').tabs('add',{
                            title:node.text,
                            href:'typelist.jsp',
                            closable:true
                        });
                    }
                }else if("查询订单" == node.text){
                    if($('#tabs').tabs('exists','查询订单')){
                        $('#tabs').tabs('select','查询订单');
                    }else{
                        $('#tabs').tabs('add',{
                            title:node.text,
                            href:'searchorder.jsp',
                            closable:true
                        });
                    }
                }else if("创建订单" == node.text){
                    if($('#tabs').tabs('exists','创建订单')){
                        $('#tabs').tabs('select','创建订单');
                    }else{
                        $('#tabs').tabs('add',{
                            title:node.text,
                            href:'createorder.jsp',
                            closable:true
                        });
                    }
                }else if("客户列表" == node.text){
                    if($('#tabs').tabs('exists','客户列表')){
                        $('#tabs').tabs('select','客户列表');
                    }else{
                        $('#tabs').tabs('add',{
                            title:node.text,
                            href:'userlist.jsp',
                            closable:true
                        });
                    }
                }else if("管理员列表" == node.text){
                    if($('#tabs').tabs('exists','管理员列表')){
                        $('#tabs').tabs('select','管理员列表');
                    }else{
                        $('#tabs').tabs('add',{
                            title:node.text,
                            href:'adminlist.jsp',
                            closable:true
                        });
                    }
                }else if("退出系统" == node.text){
                    $.ajax({
                        url: 'admininfo/logout',
                        success:function (data) {
                            window.location.href="admin_login.jsp";
                        }
                    })
                }
            }
        });
    </script>
</body>
</html>
